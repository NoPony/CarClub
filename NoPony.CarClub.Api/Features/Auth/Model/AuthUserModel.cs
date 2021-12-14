using System;

namespace NoPony.CarClub.Api.Features.Auth.Record
{
    public class AuthUserModel
    {
        public Guid? Key { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public string MfaKey { get; set; }
    }
}
