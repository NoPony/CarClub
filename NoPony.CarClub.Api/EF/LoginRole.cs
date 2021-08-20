using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class LoginRole
    {
        public long Id { get; set; }
        public long LoginId { get; set; }
        public long RoleId { get; set; }
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

        public virtual Login Login { get; set; }
        public virtual Role Role { get; set; }
    }
}
