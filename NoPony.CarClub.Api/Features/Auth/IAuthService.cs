using NoPony.CarClub.Api.Features.Auth.Dto;
using NoPony.CarClub.Api.Features.Auth.Model;
using System;
using System.Net;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.Auth
{
    public interface IAuthService
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="clientIp"></param>
        /// <param name="request"></param>
        /// <returns></returns>
        /// <exception cref="InvalidRequestException"></exception>"
        Task Register(IPAddress clientIp, AuthRegisterRequestDto request);
        Task Verify(IPAddress clientIp, Guid? key);
        Task<AuthLoginResponseModel> Login(IPAddress clientIp, AuthLoginRequestDto request);
        Task<AuthLoginResponseModel> Refresh(Guid clientKey, IPAddress clientIp);
        // ForgotPassword
        // ResetPassword
    }
}
