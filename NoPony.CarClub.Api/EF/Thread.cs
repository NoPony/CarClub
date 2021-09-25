using System;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Thread
    {
        public long Id { get; set; }
        public long BoardId { get; set; }
        public long? PostId { get; set; }
        public bool Pinned { get; set; }
        public byte[] PinnedIp { get; set; }
        public DateTimeOffset? PinnedUtc { get; set; }
        public string PinnedBy { get; set; }
        public string PinnedNote { get; set; }
        public byte[] UnpinnedIp { get; set; }
        public DateTimeOffset? UnpinnedUtc { get; set; }
        public string UnpinnedBy { get; set; }
        public string UnpinnedNote { get; set; }
        public bool Locked { get; set; }
        public byte[] LockedIp { get; set; }
        public DateTimeOffset? LockedUtc { get; set; }
        public string LockedBy { get; set; }
        public string LockedNote { get; set; }
        public byte[] UnlockedIp { get; set; }
        public DateTimeOffset? UnlockedUtc { get; set; }
        public string UnlockedBy { get; set; }
        public string UnlockedNote { get; set; }
        public byte[] CreatedIp { get; set; }
        public DateTimeOffset CreatedUtc { get; set; }
        public long CreatedBy { get; set; }
        public bool Updated { get; set; }
        public byte[] UpdatedIp { get; set; }
        public DateTimeOffset? UpdatedUtc { get; set; }
        public long? UpdatedBy { get; set; }
        public bool Deleted { get; set; }
        public byte[] DeletedIp { get; set; }
        public DateTimeOffset? DeletedUtc { get; set; }
        public long? DeletedBy { get; set; }

        public virtual Board Board { get; set; }
        public virtual Post Post { get; set; }
    }
}
