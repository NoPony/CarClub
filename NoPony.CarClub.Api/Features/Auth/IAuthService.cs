using NoPony.CarClub.Api.Features.Auth.Dto;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.User
{
    public interface IAuthService
    {
        Task<AuthRegisterResponseDto> Register(AuthRegisterRequestDto Request);
        Task<AuthEmailVerifyResponseDto> EmailVerify(AuthEmailVerifyRequestDto Request);
        Task<AuthLoginResponseDto> Login(AuthLoginRequestDto Request);
    }
}
