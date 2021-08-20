using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class SeasonEventReward
    {
        public long Id { get; set; }
        public long SeasonEventId { get; set; }
        public byte? Position { get; set; }
        public double? Percentile { get; set; }
        public short? Value { get; set; }
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
        public bool? DeletedBy { get; set; }

        public virtual SeasonEvent SeasonEvent { get; set; }
    }
}
