using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class BoardPost
    {
        public long Id { get; set; }
        public long BoardId { get; set; }
        public long? SurveyId { get; set; }
        public long? PollId { get; set; }
        public long? MessageId { get; set; }
        public bool Pinned { get; set; }
        public byte[] PinnedIp { get; set; }
        public DateTimeOffset? PinnedUtc { get; set; }
        public long? PinnedUserId { get; set; }
        public string PinnedNote { get; set; }
        public byte[] UnpinnedIp { get; set; }
        public DateTimeOffset? UnpinnedUtc { get; set; }
        public long? UnpinnedUserId { get; set; }
        public string UnpinnedNote { get; set; }
        public bool Locked { get; set; }
        public byte[] LockedIp { get; set; }
        public DateTimeOffset? LockedUtc { get; set; }
        public long? LockedUserId { get; set; }
        public string LockedNote { get; set; }
        public byte[] UnlockedIp { get; set; }
        public DateTimeOffset? UnlockedUtc { get; set; }
        public long? UnlockedUserId { get; set; }
        public string UnlockedNote { get; set; }
        public byte[] CreatedIp { get; set; }
        public DateTimeOffset CreatedUtc { get; set; }
        public long CreatedUserId { get; set; }
        public bool Updated { get; set; }
        public byte[] UpdatedIp { get; set; }
        public DateTimeOffset? UpdatedUtc { get; set; }
        public long? UpdatedUserId { get; set; }
        public bool Deleted { get; set; }
        public byte[] DeletedIp { get; set; }
        public DateTimeOffset? DeletedUtc { get; set; }
        public long? DeletedUserId { get; set; }

        public virtual Board Board { get; set; }
        public virtual User CreatedUser { get; set; }
        public virtual User DeletedUser { get; set; }
        public virtual User LockedUser { get; set; }
        public virtual Message Message { get; set; }
        public virtual User PinnedUser { get; set; }
        public virtual Poll Poll { get; set; }
        public virtual Survey Survey { get; set; }
        public virtual User UnlockedUser { get; set; }
        public virtual User UnpinnedUser { get; set; }
        public virtual User UpdatedUser { get; set; }
    }
}
