using NoPony.CarClub.Api.Features.Auth.Record;
using NoPony.CarClub.Api.Features.User.Record;
using System;

namespace NoPony.CarClub.Api.Features.User
{
    public interface IAuthRepository
    {
        AuthRegisterRecord Register(AuthRegisterModel model);
        AuthVerifyRecord Verify(string ClientIp, Guid? key);
        bool TryLoginStart(string ClientIp, string email, out AuthLoginRecord result);
        void LoginPass(Guid? key);
        void LoginFail(Guid? key);
    }
}
