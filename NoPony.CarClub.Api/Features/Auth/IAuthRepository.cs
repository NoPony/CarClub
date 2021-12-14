using NoPony.CarClub.Api.Features.Auth.Record;
using System;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.Auth
{
    public interface IAuthRepository
    {
        Task<AuthRegisterResponseModel> Register(IPAddress clientIp, string email, string password);
        Task Verify(IPAddress ClientIp, Guid? key);
        Task<AuthUserModel> Login(IPAddress ClientIp, string email);
        Task LoginSuccess(IPAddress clientIp, Guid? key);
        Task LoginFailure(IPAddress clientIp, Guid? key);
        Task<IEnumerable<string>> GetPermissions(Guid? key);
    }
}
