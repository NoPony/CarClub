using NoPony.CarClub.Api.Features.User.Record;
using System;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.User
{
    public interface IAccountRepository
    {
        Task<TryResult<AccountLoginRecord>> TryRegister(AccountRegisterRequestRecord record);
        Task<TryResult<Guid?>> TryVerifyEmail(Guid? key);
        Task<TryResult<AccountLoginRecord>> TryLogin(string email);
        Task<bool> TryLoginPass(Guid? key);
        Task<bool> TryLoginFail(Guid? key);
        Task<TryResult<AccountDetailsRecord>> TryGetDetails(Guid? key);
    }
}
