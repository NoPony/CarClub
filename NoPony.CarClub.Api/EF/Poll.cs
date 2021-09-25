using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Poll
    {
        public Poll()
        {
            PollOption = new HashSet<PollOption>();
            Post = new HashSet<Post>();
        }

        public long Id { get; set; }
        public string Title { get; set; }
        public string Note { get; set; }
        public bool Open { get; set; }
        public byte[] OpenIp { get; set; }
        public DateTimeOffset? OpenUtc { get; set; }
        public string OpenBy { get; set; }
        public bool Closed { get; set; }
        public byte[] ClosedIp { get; set; }
        public DateTimeOffset? ClosedUtc { get; set; }
        public string ClosedBy { get; set; }
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

        public virtual ICollection<PollOption> PollOption { get; set; }
        public virtual ICollection<Post> Post { get; set; }
    }
}
