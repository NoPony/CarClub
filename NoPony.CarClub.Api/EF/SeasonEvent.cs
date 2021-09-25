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

        public virtual Event Event { get; set; }
        public virtual Season Season { get; set; }
        public virtual ICollection<SeasonEventReward> SeasonEventReward { get; set; }
    }
}
