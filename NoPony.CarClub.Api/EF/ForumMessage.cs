using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class ForumMessage
    {
        public long Id { get; set; }
        public long ForumPostId { get; set; }
        public long? ParentMessageId { get; set; }
        public long UserId { get; set; }
        public string Content { get; set; }
        public DateTimeOffset CreatedUtc { get; set; }
        public long CreatedUserId { get; set; }
        public DateTimeOffset? UpdatedUtc { get; set; }
        public long? UpdatedUserId { get; set; }
    }
}
