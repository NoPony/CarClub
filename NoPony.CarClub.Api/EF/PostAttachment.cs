using System;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class PostAttachment
    {
        public long Id { get; set; }
        public long PostId { get; set; }
        public string Filename { get; set; }
        public string Url { get; set; }
        public byte[] CreatedIp { get; set; }
        public DateTimeOffset CreatedUtc { get; set; }
        public long CreatedBy { get; set; }
        public bool Updated { get; set; }
        public byte[] UpdatedIp { get; set; }
        public DateTimeOffset? UpdatedUtc { get; set; }
        public long? UpdatedBy { get; set; }
        public bool Deleted { get; set; }
        public byte[] DeletedIp { get; set; }
        public DateTimeOffset? DeletedUtc { get; set; }
        public long? DeletedBy { get; set; }

        public virtual Post Post { get; set; }
    }
}
