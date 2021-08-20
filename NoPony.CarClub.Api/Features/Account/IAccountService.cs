using NoPony.CarClub.Api.Features.Account.Dto;
using NoPony.CarClub.Api.Features.User.Dto;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.User
{
    public interface IAccountService
    {
        Task<TryResult<AccountLoginResponseDto>> TryLogin(AccountLoginRequestDto Request);
        Task<TryResult<AccountLoginResponseDto>> TryRegister(AccountRegisterRequestDto Request);
        Task<TryResult<AccountLoginResponseDto>> TryVerifyEmail(AccountEmailVerifyRequestDto Request);
    }
}
