using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class EventOfficial
    {
        public long Id { get; set; }
        public long EventId { get; set; }
        public long OfficeId { get; set; }
        public long MemberId { get; set; }
        public DateTimeOffset CreatedUtc { get; set; }
        public string CreatedIp { get; set; }
        public string CreatedBy { get; set; }
        public bool Updated { get; set; }
        public long? UpdatedMemberId { get; set; }
        public string UpdatedIp { get; set; }
        public DateTimeOffset? UpdatedUtc { get; set; }
        public string UpdatedBy { get; set; }
        public bool Deleted { get; set; }
        public long? DeletedMemberId { get; set; }
        public string DeletedIp { get; set; }
        public DateTimeOffset? DeletedUtc { get; set; }

        public virtual Event Event { get; set; }
        public virtual Member Member { get; set; }
        public virtual Office Office { get; set; }
    }
}
