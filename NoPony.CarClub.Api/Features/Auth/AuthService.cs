using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using NoPony.CarClub.Api.Features.Auth.Dto;
using NoPony.CarClub.Api.Features.Auth.Record;
using NoPony.CarClub.Api.Features.User.Record;
using NoPony.CarClub.Api.Templates;
using NoPony.CarClub.Api.Templates.RegisterEmail;
using SendGrid;
using SendGrid.Helpers.Mail;
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
        private readonly IConfiguration _config;
        private readonly IAuthRepository _authRepository;
        private readonly ITemplateEngine _templateEngine;

        public AuthService(IConfiguration config, IAuthRepository authRepository, ITemplateEngine templateEngine)
        {
            _config = config ?? throw new ArgumentNullException(nameof(config));
            _authRepository = authRepository ?? throw new ArgumentNullException(nameof(authRepository));
            _templateEngine = templateEngine ?? throw new ArgumentNullException(nameof(templateEngine));
        }

        public AuthRegisterResponseDto Register(string ClientIp, AuthRegisterRequestDto Request)
        {
            AuthRegisterRecord r = _authRepository.Register(new AuthRegisterModel
            {
                ClientIp = ClientIp,

                Key = Guid.NewGuid(),
                Login = Request.Email,
                Password = PasswordHash.ArgonHashString(Request.Password),
            });

            if (r != null)
            {
                string bodyPlain = "Yes";

                string bodyHtml = _templateEngine.Process("RegisterEmail",
                    new RegisterEmailModel
                    {
                        VerifyUrl = "https://localhost:/Auth/Verify?"
                    });

                Response response = new SendGridClient(_config.GetValue<string>("Email:SendgridKey"))
                    .SendEmailAsync(MailHelper.CreateSingleEmail(
                        new EmailAddress(_config.GetValue<string>("Email:FromEmail"), _config.GetValue<string>("Email:FromName")),
                        new EmailAddress(Request.Email, Request.Email),
                        "Confirm Registration Registration",
                        bodyPlain,
                        bodyHtml))
                    .Result;

                return new AuthRegisterResponseDto();
            }

            return new AuthRegisterResponseDto();
        }

        public AuthVerifyResponseDto Verify(string ClientIp, AuthVerifyRequestDto request)
        {
            if (_authRepository.Verify(ClientIp, request.Key) == null)
                return null;

            var key = _authRepository.Verify(ClientIp, request.Key);

            _authRepository.Verify(ClientIp, request.Key);

            return new AuthVerifyResponseDto
            {
                Token = generateToken(key.ToString(), TimeSpan.FromDays(1)),
            };
        }

        public AuthLoginResponseDto Login(string ClientIp, AuthLoginRequestDto request)
        {
            if (!_authRepository.TryLoginStart(ClientIp, request.Email, out AuthLoginRecord r))
                return null;

            if (!PasswordHash.ArgonHashStringVerify(r.Password, request.Password))
            {
                _authRepository.LoginFail(r.Key);

                return null;
            }

            _authRepository.LoginPass(r.Key);

            return new AuthLoginResponseDto
            {
                Token = generateToken(r.Key.ToString(), TimeSpan.FromDays(2)),
                Permissions = null,
            };
        }

        private static string generateToken(string key, TimeSpan duration)
        {
            SymmetricSecurityKey securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Settings.JwtKey));

            SigningCredentials credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            Claim[] claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub, key),
            };

            JwtSecurityToken token = new JwtSecurityToken(Settings.JwtIssuer, Settings.JwtAudience, claims, null, DateTime.Now.Add(duration), credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
