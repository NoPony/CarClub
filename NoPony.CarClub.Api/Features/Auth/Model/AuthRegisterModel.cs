using System;

namespace NoPony.CarClub.Api.Features.Auth.Record
{
    public class AuthRegisterModel
    {
        public string ClientIp { get; set; }
        public Guid Key { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
    }
}
