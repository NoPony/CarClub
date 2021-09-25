using NoPony.CarClub.Api.Features.Auth.Dto;
using System;
using System.Net;

namespace NoPony.CarClub.Api.Features.Auth
{
    public interface IAuthService
    {
        bool TryRegister(IPAddress clientIp, AuthRegisterRequestDto request);
        bool TryVerify(IPAddress clientIp, Guid? key);
        bool TryLogin(IPAddress clientIp, AuthLoginRequestDto request, out AuthLoginResponseDto response);
        // TryForgotPassword
        // TryResetPassword
    }
}
