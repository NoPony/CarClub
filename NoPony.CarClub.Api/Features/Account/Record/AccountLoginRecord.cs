using System;

namespace NoPony.CarClub.Api.Features.User.Record
{
    public class AccountLoginRecord
    {
        public Guid? Key { get; set; }
        public string Password { get; set; }
        public string MfaKey { get; set; }
    }
}
