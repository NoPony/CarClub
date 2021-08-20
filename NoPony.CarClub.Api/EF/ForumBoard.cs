using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class ForumBoard
    {
        public long Id { get; set; }
        public string Title { get; set; }
        public DateTimeOffset CreatedUtc { get; set; }
        public long CreatedUserId { get; set; }
        public DateTimeOffset? UpdatedUtc { get; set; }
        public long? UpdatedUserId { get; set; }

        public virtual User CreatedUser { get; set; }
        public virtual User UpdatedUser { get; set; }
    }
}
