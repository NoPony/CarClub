using NoPony.CarClub.Api.Features.Auth.Dto;

namespace NoPony.CarClub.Api.Features.User
{
    public interface IAuthService
    {
        AuthRegisterResponseDto Register(string ClientIp, AuthRegisterRequestDto Request);
        AuthVerifyResponseDto Verify(string ClientIp, AuthVerifyRequestDto Request);
        AuthLoginResponseDto Login(string ClientIp, AuthLoginRequestDto Request);
    }
}
