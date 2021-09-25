using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Comment
    {
        public Comment()
        {
            CommentAttachment = new HashSet<CommentAttachment>();
            CommentReaction = new HashSet<CommentReaction>();
            InverseParent = new HashSet<Comment>();
            Post = new HashSet<Post>();
        }

        public long Id { get; set; }
        public Guid Key { get; set; }
        public long? ParentId { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
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
        public virtual Comment Parent { get; set; }
        public virtual User UpdatedUser { get; set; }
        public virtual ICollection<CommentAttachment> CommentAttachment { get; set; }
        public virtual ICollection<CommentReaction> CommentReaction { get; set; }
        public virtual ICollection<Comment> InverseParent { get; set; }
        public virtual ICollection<Post> Post { get; set; }
    }
}
