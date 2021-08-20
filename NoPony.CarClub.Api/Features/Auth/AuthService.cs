using Microsoft.IdentityModel.Tokens;
using NoPony.CarClub.Api.Features.Auth.Dto;
using NoPony.CarClub.Api.Features.Auth.Record;
using NoPony.CarClub.Api.Features.User.Record;
using Sodium;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.User
{
    public class AuthService : IAuthService
    {
        private readonly IAuthRepository _authRepository;

        public AuthService(IAuthRepository userRepository)
        {
            _authRepository = userRepository ?? throw new ArgumentNullException(nameof(userRepository));
        }

        public async Task<AuthRegisterResponseDto> Register(AuthRegisterRequestDto Request)
        {
            AuthRegisterRecord r = await _authRepository.Register(new AuthRegisterRequestRecord
            {
                Key = Guid.NewGuid(),
                Login = Request.Login,
                Password = PasswordHash.ArgonHashString(Request.Password),
            });

            if (r != null)
            {
                return new AuthRegisterResponseDto();
            }

            return new AuthRegisterResponseDto();
        }

        public async Task<AuthEmailVerifyResponseDto> EmailVerify(AuthEmailVerifyRequestDto request)
        {
            if (await _authRepository.EmailVerify(request.Key) == null)
                return null;

            var key = await _authRepository.EmailVerify(request.Key);

            await _authRepository.EmailVerify(request.Key);

            return new AuthEmailVerifyResponseDto
            {
                Token = generateToken(key.ToString(), TimeSpan.FromDays(1)),
            };
        }

        public async Task<AuthLoginResponseDto> Login(AuthLoginRequestDto request)
        {
            var r = await _authRepository.Login(request.Email);

            if (r == null)
                return null;

            if (!PasswordHash.ArgonHashStringVerify(r.Password, request.Password))
            {
                await _authRepository.LoginFail(r.Key);

                return new AuthLoginResponseDto();
            }

            await _authRepository.LoginPass(r.Key);

            return new AuthLoginResponseDto
            {
                Token = generateToken(r.Key.ToString(), TimeSpan.FromDays(2)),
            };
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
