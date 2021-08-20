using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Thread
    {
        public long Id { get; set; }
        public long? PostId { get; set; }
        public long StatusId { get; set; }
        public bool Pinned { get; set; }
        public string PinnedIp { get; set; }
        public DateTimeOffset? PinnedUtc { get; set; }
        public string PinnedBy { get; set; }
        public string PinnedNote { get; set; }
        public string UnpinnedIp { get; set; }
        public DateTimeOffset? UnpinnedUtc { get; set; }
        public string UnpinnedBy { get; set; }
        public string UnpinnedNote { get; set; }
        public bool Locked { get; set; }
        public string LockedIp { get; set; }
        public DateTimeOffset? LockedUtc { get; set; }
        public string LockedBy { get; set; }
        public string LockedNote { get; set; }
        public string UnlockedIp { get; set; }
        public DateTimeOffset? UnlockedUtc { get; set; }
        public string UnlockedBy { get; set; }
        public string UnlockedNote { get; set; }
        public string CreatedIp { get; set; }
        public DateTimeOffset CreatedUtc { get; set; }
        public string CreatedBy { get; set; }
        public bool Updated { get; set; }
        public string UpdatedIp { get; set; }
        public DateTimeOffset? UpdatedUtc { get; set; }
        public string UpdatedBy { get; set; }
        public bool Deleted { get; set; }
        public string DeletedIp { get; set; }
        public DateTimeOffset? DeletedUtc { get; set; }
        public string DeletedBy { get; set; }

        public virtual ThreadStatus Status { get; set; }
    }
}
