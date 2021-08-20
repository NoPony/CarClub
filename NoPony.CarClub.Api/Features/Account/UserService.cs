using Microsoft.IdentityModel.Tokens;
using NoPony.CarClub.Api.Features.User.Dto;
using NoPony.CarClub.Api.Features.User.Record;
using Sodium;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.User
{
    public class UserService : IAccountService
    {
        private readonly IAccountRepository _userRepository;

        public UserService(IAccountRepository userRepository)
        {
            _userRepository = userRepository ?? throw new ArgumentNullException(nameof(userRepository));
        }

        public async Task<TryResult<AccountLoginResponseDto>> TryRegister(AccountRegisterRequestDto Request)
        {
            var r = await _userRepository.TryRegister(new AccountRegisterRequestRecord
            {
                Key = Guid.NewGuid(),
                Email = Request.Email,
                Password = PasswordHash.ArgonHashString(Request.Password),
                FullName = Request.FullName,
                PreferredName = Request.PreferredName,
                Phone = Request.Phone,
                Mobile = Request.Mobile,
                Street = Request.Street,
                Suburb = Request.Suburb,
                Postcode = Request.Postcode,
                State = Request.State,
            });

            if (r.Outcome)
            {
                return new TryResult<AccountLoginResponseDto>(true, new AccountLoginResponseDto
                {
                    Token = generateToken(r.Result.Key.ToString(), TimeSpan.FromDays(2)),
                    FullName = Request.FullName,
                    PreferredName = Request.PreferredName,
                    //Permissions
                });
            }

            return new TryResult<AccountLoginResponseDto>(false, null);
        }

        public async Task<TryResult<AccountLoginResponseDto>> TryVerifyEmail(AccountEmailVerifyRequestDto request)
        {
            var k = await _userRepository.TryVerifyEmail(request.Key);
            if (!k.Outcome)
                return new TryResult<AccountLoginResponseDto>(false, null);

            Guid? key = k.Result;

            if (!await _userRepository.TryLoginPass(key))
                return new TryResult<AccountLoginResponseDto>(false, null);

            TryResult<AccountDetailsRecord> r = await _userRepository.TryGetDetails(key);

            if (!r.Outcome)
                return new TryResult<AccountLoginResponseDto>(false, null);

            return new TryResult<AccountLoginResponseDto>(true, new AccountLoginResponseDto
            {
                Token = generateToken(key.ToString(), TimeSpan.FromDays(1)),
                FullName = r.Result.FullName,
                PreferredName = r.Result.PreferredName,
                Permissions = r.Result.Permissions,
            });
        }

        public async Task<TryResult<AccountLoginResponseDto>> TryLogin(AccountLoginRequestDto request)
        {
            var r = await _userRepository.TryLogin(request.Email);

            if (!r.Outcome)
                return null;

            if (!PasswordHash.ArgonHashStringVerify(r.Result.Password, request.Password))
            {
                await _userRepository.TryLoginFail(r.Result.Key);

                return new TryResult<AccountLoginResponseDto>(false, null);
            }

            if (!await _userRepository.TryLoginPass(r.Result.Key))
                return new TryResult<AccountLoginResponseDto>(false, null);

            TryResult<AccountDetailsRecord> u = await _userRepository.TryGetDetails(r.Result.Key);
            if (!u.Outcome)
                return new TryResult<AccountLoginResponseDto>(false, null);

            return new TryResult<AccountLoginResponseDto>(true, new AccountLoginResponseDto
            {
                Token = generateToken(r.Result.Key.ToString(), TimeSpan.FromDays(2)),
                FullName = u.Result.FullName,
                PreferredName = u.Result.PreferredName,
                //Permissions = u.Result.Permissions,
            });
        }

        private static string generateToken(string key, TimeSpan duration)
        {
            SymmetricSecurityKey securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Constants.JwtKey));

            SigningCredentials credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            Claim[] claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub, key),
            };

            JwtSecurityToken token = new JwtSecurityToken(Constants.JwtIssuer, Constants.JwtAudience, claims, null, DateTime.Now.Add(duration), credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
