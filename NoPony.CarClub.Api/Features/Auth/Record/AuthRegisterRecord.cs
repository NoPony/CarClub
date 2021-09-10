using System;

namespace NoPony.CarClub.Api.Features.Auth.Record
{
    public class AuthRegisterRecord
    {
        public string Name { get; set; }
        public string Email { get; set; }
        public Guid? VerifyId { get; set; }

        public Guid? EmailVerifyKey { get; set; }
        public DateTime? EmailVerifyExpiryUtc { get; set; }
    }
}
