using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Event
    {
        public Event()
        {
            EventAttachment = new HashSet<EventAttachment>();
            EventMemberRole = new HashSet<EventMemberRole>();
            EventReaction = new HashSet<EventReaction>();
            Heat = new HashSet<Heat>();
            MemberEvent = new HashSet<MemberEvent>();
            SeasonEvent = new HashSet<SeasonEvent>();
        }

        public long Id { get; set; }
        public long MeetId { get; set; }
        public long StatusId { get; set; }
        public string Title { get; set; }
        public string Note { get; set; }
        public DateTimeOffset? StartUtc { get; set; }
        public int? DurationMinutes { get; set; }
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
        public virtual Meet Meet { get; set; }
        public virtual EventStatus Status { get; set; }
        public virtual User UpdatedUser { get; set; }
        public virtual ICollection<EventAttachment> EventAttachment { get; set; }
        public virtual ICollection<EventMemberRole> EventMemberRole { get; set; }
        public virtual ICollection<EventReaction> EventReaction { get; set; }
        public virtual ICollection<Heat> Heat { get; set; }
        public virtual ICollection<MemberEvent> MemberEvent { get; set; }
        public virtual ICollection<SeasonEvent> SeasonEvent { get; set; }
    }
}
