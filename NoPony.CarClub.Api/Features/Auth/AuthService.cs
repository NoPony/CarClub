using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using NoPony.CarClub.Api.Exceptions;
using NoPony.CarClub.Api.Features.Auth.Dto;
using NoPony.CarClub.Api.Features.Auth.Model;
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
using System.Threading.Tasks;

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

        public async Task Register(IPAddress clientIp, AuthRegisterRequestDto request)
        {
            // Need to fix trailing null ('\0') chars that LibSodium puts on the hash
            // While MySql and SQL Server handle these trailing nulls with no issue PostgreSql explodes.
            string passwordHash = PasswordHash.ArgonHashString(request.Password)
                .Replace("\0", "");

            AuthRegisterResponseModel responseModel = await _authRepository.Register(clientIp, request.Email, passwordHash);

            string bodyPlain = "Yes";

            string bodyHtml = _templateEngine.Process("RegisterEmail",
                new RegisterEmailModel
                {
                    VerifyUrl = $"http://localhost:4200/verify/{responseModel.EmailVerifyKey}"
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
                throw new Exception("Failed to send email");
        }

        public async Task Verify(IPAddress clientIp, Guid? key)
        {
            await _authRepository.Verify(clientIp, key);
        }

        public async Task<AuthLoginResponseModel> Login(IPAddress clientIp, AuthLoginRequestDto request)
        {
            AuthUserModel record = await _authRepository.Login(clientIp, request.Email);

            if (!PasswordHash.ArgonHashStringVerify(record.Password, request.Password))
            {
                await _authRepository.LoginFailure(clientIp, record.Key);

                throw new LoginFailedException();
            }

            await _authRepository.LoginSuccess(clientIp, record.Key);
            //IEnumerable<string> permissions = await _authRepository.GetPermissions(record.Key);

            return new AuthLoginResponseModel
            {
                RefreshToken = buildRefreshToken(record.Key.ToString()),
                AccessToken = buildAccessToken(record.Key.ToString()),
                //Permissions = permissions,
            };
        }

        public async Task<AuthLoginResponseModel> Refresh(Guid clientKey, IPAddress clientIp)
        {
            return await Task.Run(() => new AuthLoginResponseModel
            {
                RefreshToken = buildRefreshToken(clientKey.ToString()),
                AccessToken = buildAccessToken(clientKey.ToString()),
                //Permissions = permissions,
            });
        }

        private string buildRefreshToken(string userKey)
        {
            SymmetricSecurityKey securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config.GetValue<string>("Jwt:Key")));

            SigningCredentials credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            string issuer = _config.GetValue<string>("Jwt:Issuer");
            string audience = _config.GetValue<string>("Jwt:Audience");
            DateTime notBefore = DateTime.UtcNow;
            DateTime expires = notBefore.Add(TimeSpan.FromDays(14));

            Claim[] claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub, userKey),
            };

            JwtSecurityToken token = new JwtSecurityToken(issuer, audience, claims, notBefore, expires, credentials);

            return new JwtSecurityTokenHandler()
                .WriteToken(token);
        }

        private string buildAccessToken(string userKey)
        {
            SymmetricSecurityKey securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config.GetValue<string>("Jwt:Key")));

            SigningCredentials credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            string issuer = _config.GetValue<string>("Jwt:Issuer");
            string audience = _config.GetValue<string>("Jwt:Audience");
            DateTime notBefore = DateTime.UtcNow;
            DateTime expires = notBefore.Add(TimeSpan.FromMinutes(2));

            Claim[] claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub, userKey),
            };

            JwtSecurityToken token = new JwtSecurityToken(issuer, audience, claims, notBefore, expires, credentials);

            return new JwtSecurityTokenHandler()
                .WriteToken(token);
        }
    }
}
