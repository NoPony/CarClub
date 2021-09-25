using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Meet
    {
        public Meet()
        {
            Event = new HashSet<Event>();
            MeetAttachment = new HashSet<MeetAttachment>();
            MeetOfficial = new HashSet<MeetOfficial>();
            MeetReaction = new HashSet<MeetReaction>();
            MemberMeet = new HashSet<MemberMeet>();
        }

        public long Id { get; set; }
        public long MeetStatusId { get; set; }
        public DateTimeOffset? StartUtc { get; set; }
        public int? DurationMinutes { get; set; }
        public string Title { get; set; }
        public string Note { get; set; }
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

        public virtual User CreatedUser { get; set; }
        public virtual User DeletedUser { get; set; }
        public virtual MeetStatus MeetStatus { get; set; }
        public virtual User UpdatedUser { get; set; }
        public virtual ICollection<Event> Event { get; set; }
        public virtual ICollection<MeetAttachment> MeetAttachment { get; set; }
        public virtual ICollection<MeetOfficial> MeetOfficial { get; set; }
        public virtual ICollection<MeetReaction> MeetReaction { get; set; }
        public virtual ICollection<MemberMeet> MemberMeet { get; set; }
    }
}
