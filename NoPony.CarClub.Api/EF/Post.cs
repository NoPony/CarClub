using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Post
    {
        public Post()
        {
            InverseParent = new HashSet<Post>();
            PostAttachment = new HashSet<PostAttachment>();
            PostReaction = new HashSet<PostReaction>();
        }

        public long Id { get; set; }
        public long? ParentId { get; set; }
        public string Title { get; set; }
        public string Note { get; set; }
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

        public virtual Post Parent { get; set; }
        public virtual ICollection<Post> InverseParent { get; set; }
        public virtual ICollection<PostAttachment> PostAttachment { get; set; }
        public virtual ICollection<PostReaction> PostReaction { get; set; }
    }
}
