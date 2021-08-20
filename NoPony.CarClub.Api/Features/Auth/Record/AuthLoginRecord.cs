using System;

namespace NoPony.CarClub.Api.Features.User.Record
{
    public class AuthLoginRecord
    {
        public Guid? Key { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public string MfaKey { get; set; }
    }
}
