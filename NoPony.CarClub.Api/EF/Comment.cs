﻿using System;
using System.Collections.Generic;
using System.Net;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Comment
    {
        public Comment()
        {
            CommentAttachment = new HashSet<CommentAttachment>();
            CommentReaction = new HashSet<CommentReaction>();
        }

        public long Id { get; set; }
        public Guid Key { get; set; }
        public long ThreadId { get; set; }
        public string Content { get; set; }
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

        public virtual User CreatedUser { get; set; }
        public virtual User DeletedUser { get; set; }
        public virtual Thread Thread { get; set; }
        public virtual User UpdatedUser { get; set; }
        public virtual ICollection<CommentAttachment> CommentAttachment { get; set; }
        public virtual ICollection<CommentReaction> CommentReaction { get; set; }
    }
}
