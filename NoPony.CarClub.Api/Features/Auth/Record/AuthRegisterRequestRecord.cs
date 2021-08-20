using System;

namespace NoPony.CarClub.Api.Features.Auth.Record
{
    public class AuthRegisterRequestRecord
    {
        public Guid Key { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
    }
}
