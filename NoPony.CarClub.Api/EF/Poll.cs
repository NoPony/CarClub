using System;
using System.Collections.Generic;
using System.Net;

namespace NoPony.CarClub.Api.EF
{
    public partial class Poll
    {
        public Poll()
        {
            PollOption = new HashSet<PollOption>();
        }

        public long Id { get; set; }
        public long BoardId { get; set; }
        public long ThreadId { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public bool Open { get; set; }
        public IPAddress OpenIp { get; set; }
        public DateTime? OpenUtc { get; set; }
        public string OpenBy { get; set; }
        public bool Closed { get; set; }
        public IPAddress ClosedIp { get; set; }
        public DateTime? ClosedUtc { get; set; }
        public string ClosedBy { get; set; }
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
        public virtual Thread Thread { get; set; }
        public virtual User UpdatedUser { get; set; }
        public virtual ICollection<PollOption> PollOption { get; set; }
    }
}
