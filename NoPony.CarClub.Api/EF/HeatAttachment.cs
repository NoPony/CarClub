using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class HeatAttachment
    {
        public long Id { get; set; }
        public long HeatId { get; set; }
        public string UploadIp { get; set; }
        public DateTimeOffset? UploadUtc { get; set; }
        public string Title { get; set; }
        public string Filename { get; set; }
        public string Url { get; set; }
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
        public virtual Heat Heat { get; set; }
        public virtual User UpdatedUser { get; set; }
    }
}
