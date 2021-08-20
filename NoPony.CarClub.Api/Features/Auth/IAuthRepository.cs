using NoPony.CarClub.Api.Features.Auth.Record;
using NoPony.CarClub.Api.Features.User.Record;
using System;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.User
{
    public interface IAuthRepository
    {
        Task<AuthRegisterRecord> Register(AuthRegisterRequestRecord record);
        Task<AuthEmailVerifyRecord> EmailVerify(Guid? key);
        Task<AuthLoginRecord> Login(string email);
        Task LoginPass(Guid? key);
        Task LoginFail(Guid? key);
    }
}
