using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Role
    {
        public Role()
        {
            LoginRole = new HashSet<LoginRole>();
        }

        public long Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public DateTimeOffset CreatedUtc { get; set; }
        public string CreatedBy { get; set; }
        public DateTimeOffset? UpdatedUtc { get; set; }
        public string UpdatedBy { get; set; }

        public virtual ICollection<LoginRole> LoginRole { get; set; }
    }
}
