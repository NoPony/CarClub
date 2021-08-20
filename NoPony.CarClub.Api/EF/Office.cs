using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Office
    {
        public Office()
        {
            EventOfficial = new HashSet<EventOfficial>();
            MeetOfficial = new HashSet<MeetOfficial>();
        }

        public long Id { get; set; }
        public string Code { get; set; }
        public string Title { get; set; }
        public string Note { get; set; }
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

        public virtual ICollection<EventOfficial> EventOfficial { get; set; }
        public virtual ICollection<MeetOfficial> MeetOfficial { get; set; }
    }
}
