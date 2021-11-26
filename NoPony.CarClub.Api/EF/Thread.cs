using System;
using System.Collections.Generic;
using System.Net;

namespace NoPony.CarClub.Api.EF
{
    public partial class Thread
    {
        public Thread()
        {
            Comment = new HashSet<Comment>();
            Poll = new HashSet<Poll>();
            Post = new HashSet<Post>();
            Survey = new HashSet<Survey>();
        }

        public long Id { get; set; }
        public IPAddress CreatedIp { get; set; }
        public DateTime CreatedUtc { get; set; }
        public long CreatedUserId { get; set; }
        public bool Deleted { get; set; }
        public IPAddress DeletedIp { get; set; }
        public DateTime? DeletedUtc { get; set; }
        public long? DeletedUserId { get; set; }

        public virtual User CreatedUser { get; set; }
        public virtual User DeletedUser { get; set; }
        public virtual ICollection<Comment> Comment { get; set; }
        public virtual ICollection<Poll> Poll { get; set; }
        public virtual ICollection<Post> Post { get; set; }
        public virtual ICollection<Survey> Survey { get; set; }
    }
}
