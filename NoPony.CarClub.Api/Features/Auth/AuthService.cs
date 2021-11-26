using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using NoPony.CarClub.Api.Features.Auth.Dto;
using NoPony.CarClub.Api.Features.Auth.Record;
using NoPony.CarClub.Api.Templates;
using NoPony.CarClub.Api.Templates.RegisterEmail;
using SendGrid;
using SendGrid.Helpers.Mail;
using Serilog;
using Sodium;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Net;
using System.Security.Claims;
using System.Text;

namespace NoPony.CarClub.Api.Features.Auth
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

        public bool TryRegister(IPAddress clientIp, AuthRegisterRequestDto request)
        {
            string h = PasswordHash.ArgonHashString(request.Password)
                .Replace("\0", "");

            if (!_authRepository.TryRegister(clientIp, request.Email, h, out AuthRegisterModel record))
                return false;

            string bodyPlain = "Yes";

            string bodyHtml = _templateEngine.Process("RegisterEmail",
                new RegisterEmailModel
                {
                    VerifyUrl = $"http://localhost:4200/verify/{record.EmailVerifyKey}"
                });

            Response sendgridResponse = new SendGridClient(_config.GetValue<string>("Email:SendgridKey"))
                .SendEmailAsync(MailHelper.CreateSingleEmail(
                    new EmailAddress(_config.GetValue<string>("Email:SystemEmail"), _config.GetValue<string>("Email:SystemName")),
                    new EmailAddress(request.Email, request.Email),
                    "Confirm Registration: WRX Club of Western Australia",
                    bodyPlain,
                    bodyHtml))
                .Result;

            if (!sendgridResponse.IsSuccessStatusCode)
            {
                throw new Exception("Failed to send email");
            }

            return true;
        }

        public bool TryVerify(IPAddress clientIp, Guid? key)
        {
            if (!_authRepository.TryVerify(clientIp, key))
                return false;

            return true;
        }

        public bool TryLogin(IPAddress clientIp, AuthLoginRequestDto request, out AuthLoginResponseDto response)
        {
            if (!_authRepository.TryLogin(clientIp, request.Email, out AuthLoginModel record))
            {
                response = null;

                return false;
            }

            if (!PasswordHash.ArgonHashStringVerify(record.Password, request.Password))
            {
                _authRepository.TryLoginFailure(clientIp, record.Key);

                response = null;

                return false;
            }

            _authRepository.TryLoginSuccess(clientIp, record.Key);
            _authRepository.TryGetPermissions(record.Key, out IEnumerable<string> permissions);

            response = new AuthLoginResponseDto
            {
                Token = token(record.Key.ToString(), TimeSpan.FromDays(2)),
                Permissions = permissions,
            };

            return true;
        }

        private string token(string key, TimeSpan duration)
        {
            SymmetricSecurityKey securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config.GetValue<string>("Jwt:Key")));

            SigningCredentials credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            Claim[] claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub, key),
            };

            JwtSecurityToken token = new JwtSecurityToken(_config.GetValue<string>("Jwt:Issuer"), _config.GetValue<string>("Jwt:Audience"), claims, DateTime.UtcNow, DateTime.UtcNow.Add(duration), credentials);

            return new JwtSecurityTokenHandler()
                .WriteToken(token);
        }
    }
}
