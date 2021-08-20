using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Poll
    {
        public Poll()
        {
            PollAttachment = new HashSet<PollAttachment>();
            PollOption = new HashSet<PollOption>();
        }

        public long Id { get; set; }
        public long StatusId { get; set; }
        public string Title { get; set; }
        public string Note { get; set; }
        public bool Open { get; set; }
        public string OpenIp { get; set; }
        public DateTimeOffset? OpenUtc { get; set; }
        public string OpenBy { get; set; }
        public short? Duration { get; set; }
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

        public virtual PollStatus Status { get; set; }
        public virtual ICollection<PollAttachment> PollAttachment { get; set; }
        public virtual ICollection<PollOption> PollOption { get; set; }
    }
}
