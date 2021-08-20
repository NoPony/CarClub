using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class SeasonEvent
    {
        public SeasonEvent()
        {
            SeasonEventReward = new HashSet<SeasonEventReward>();
        }

        public long Id { get; set; }
        public long SeasonId { get; set; }
        public long EventId { get; set; }
        public DateTimeOffset CreatedUtc { get; set; }
        public string CreatedBy { get; set; }
        public DateTimeOffset? UpdatedUtc { get; set; }
        public string UpdatedBy { get; set; }

        public virtual Event Event { get; set; }
        public virtual Season Season { get; set; }
        public virtual ICollection<SeasonEventReward> SeasonEventReward { get; set; }
    }
}
