using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class PostAttachment
    {
        public long Id { get; set; }
        public long PostId { get; set; }
        public string Filename { get; set; }
        public string Url { get; set; }
        public DateTimeOffset CreatedUtc { get; set; }
        public string CreatedBy { get; set; }
        public DateTimeOffset? UpdatedUtc { get; set; }
        public string UpdatedBy { get; set; }

        public virtual Post Post { get; set; }
    }
}
