using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Login1
    {
        public long Id { get; set; }
        public Guid Key { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public bool MfaEnabled { get; set; }
        public string MfaEnabledIp { get; set; }
        public DateTime? MfaEnabledUtc { get; set; }
        public string MfaKey { get; set; }
        public bool EmailVerify { get; set; }
        public string EmailVerifyIp { get; set; }
        public DateTimeOffset? EmailVerifyUtc { get; set; }
        public Guid? EmailVerifyKey { get; set; }
        public DateTimeOffset? EmailVerifyExpiryUtc { get; set; }
        public string EmailVerifiedIp { get; set; }
        public DateTimeOffset? EmailVerifiedUtc { get; set; }
        public bool ForgotPassword { get; set; }
        public string ForgotPasswordIp { get; set; }
        public Guid? ForgotPasswordUtc { get; set; }
        public Guid? ForgotPasswordKey { get; set; }
        public DateTimeOffset? ForgotPasswordExpiryUtc { get; set; }
        public string ForgotResetIp { get; set; }
        public DateTimeOffset? ForgotResetUtc { get; set; }
        public string LastLoginIp { get; set; }
        public DateTimeOffset? LastLoginUtc { get; set; }
        public bool FailedLogin { get; set; }
        public string FailedLoginIp { get; set; }
        public DateTimeOffset? FailedLoginUtc { get; set; }
        public byte FailedLoginCount { get; set; }
        public DateTimeOffset CreatedUtc { get; set; }
        public string CreatedIp { get; set; }
        public string CreatedBy { get; set; }
        public bool Updated { get; set; }
        public string UpdatedIp { get; set; }
        public DateTimeOffset? UpdatedUtc { get; set; }
        public string UpdatedBy { get; set; }
        public bool Deleted { get; set; }
        public string DeletedIp { get; set; }
        public DateTimeOffset? DeletedUtc { get; set; }
        public string DeletedBy { get; set; }
    }
}
