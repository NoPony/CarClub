using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Boardtag
    {
        public int Id { get; set; }
        public long? BoardId { get; set; }
        public long? TagId { get; set; }
        public byte[] CreatedIp { get; set; }
        public DateTime? CreatedUtc { get; set; }
        public long CreatedUserId { get; set; }
        public byte[] UpdatedIp { get; set; }
        public DateTime? UpdatedUtc { get; set; }
        public long? UpdatedUserId { get; set; }
        public byte[] DeletedIp { get; set; }
        public DateTime? DeletedUtc { get; set; }
        public long? DeletedUserId { get; set; }

        public virtual Board Board { get; set; }
    }
}
