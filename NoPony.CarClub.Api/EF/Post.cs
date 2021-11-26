using System;
using System.Collections.Generic;
using System.Net;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Post
    {
        public long Id { get; set; }
        public Guid Key { get; set; }
        public long BoardId { get; set; }
        public long ThreadId { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public bool Pinned { get; set; }
        public IPAddress PinnedIp { get; set; }
        public DateTime? PinnedUtc { get; set; }
        public long? PinnedUserId { get; set; }
        public string PinnedNote { get; set; }
        public IPAddress UnpinnedIp { get; set; }
        public DateTime? UnpinnedUtc { get; set; }
        public long? UnpinnedUserId { get; set; }
        public string UnpinnedNote { get; set; }
        public bool Locked { get; set; }
        public IPAddress LockedIp { get; set; }
        public DateTime? LockedUtc { get; set; }
        public long? LockedUserId { get; set; }
        public string LockedNote { get; set; }
        public IPAddress UnlockedIp { get; set; }
        public DateTime? UnlockedUtc { get; set; }
        public long? UnlockedUserId { get; set; }
        public string UnlockedNote { get; set; }
        public IPAddress CreatedIp { get; set; }
        public DateTime CreatedUtc { get; set; }
        public long CreatedUserId { get; set; }
        public bool Updated { get; set; }
        public IPAddress UpdatedIp { get; set; }
        public DateTime? UpdatedUtc { get; set; }
        public long? UpdatedUserId { get; set; }
        public bool Deleted { get; set; }
        public IPAddress DeletedIp { get; set; }
        public DateTime? DeletedUtc { get; set; }
        public long? DeletedUserId { get; set; }

        public virtual Board Board { get; set; }
        public virtual User CreatedUser { get; set; }
        public virtual User DeletedUser { get; set; }
        public virtual User LockedUser { get; set; }
        public virtual User PinnedUser { get; set; }
        public virtual Thread Thread { get; set; }
        public virtual User UnlockedUser { get; set; }
        public virtual User UnpinnedUser { get; set; }
        public virtual User UpdatedUser { get; set; }
    }
}
