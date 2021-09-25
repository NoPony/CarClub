using System;

namespace NoPony.CarClub.Api.Features.Auth.Record
{
    public class AuthRegisterModel
    {
        public string Name { get; set; }
        public string Email { get; set; }
        public Guid? EmailVerifyKey { get; set; }
    }
}
