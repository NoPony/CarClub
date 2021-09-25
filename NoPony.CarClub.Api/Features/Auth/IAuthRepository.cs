using NoPony.CarClub.Api.Features.Auth.Record;
using System;
using System.Collections.Generic;
using System.Net;

namespace NoPony.CarClub.Api.Features.Auth
{
    public interface IAuthRepository
    {
        bool TryRegister(IPAddress clientIp, string email, string password, out AuthRegisterModel result);
        bool TryVerify(IPAddress ClientIp, Guid? key);
        bool TryLogin(IPAddress ClientIp, string email, out AuthLoginModel result);
        bool TryLoginSuccess(IPAddress clientIp, Guid? key);
        bool TryLoginFailure(IPAddress clientIp, Guid? key);
        bool TryGetPermissions(Guid? key, out IEnumerable<string> result);
    }
}
