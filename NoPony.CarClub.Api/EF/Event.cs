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
            EventOfficial = new HashSet<EventOfficial>();
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
        public bool? DeletedBy { get; set; }

        public virtual Meet Meet { get; set; }
        public virtual EventStatus Status { get; set; }
        public virtual ICollection<EventAttachment> EventAttachment { get; set; }
        public virtual ICollection<EventOfficial> EventOfficial { get; set; }
        public virtual ICollection<EventReaction> EventReaction { get; set; }
        public virtual ICollection<Heat> Heat { get; set; }
        public virtual ICollection<MemberEvent> MemberEvent { get; set; }
        public virtual ICollection<SeasonEvent> SeasonEvent { get; set; }
    }
}
