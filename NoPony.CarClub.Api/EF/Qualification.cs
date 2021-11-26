using System;
using System.Collections.Generic;
using System.Net;

namespace NoPony.CarClub.Api.EF
{
    public partial class Qualification
    {
        public int Id { get; set; }
        public IPAddress CreatedIp { get; set; }
        public DateTime? CreatedUtc { get; set; }
        public IPAddress UpdatedIp { get; set; }
        public DateTime? UpdatedUtc { get; set; }
        public IPAddress DeletedIp { get; set; }
        public DateTime? DeletedUtc { get; set; }
        public long CreatedUserId { get; set; }
        public long? UpdatedUserId { get; set; }
        public long? DeletedUserId { get; set; }
    }
}
