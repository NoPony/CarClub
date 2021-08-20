using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class HeatReaction
    {
        public long Id { get; set; }
        public long HeatId { get; set; }
        public long MemberId { get; set; }
        public long ReactionId { get; set; }
        public DateTimeOffset WhenUtc { get; set; }
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
        public string DeletedBy { get; set; }

        public virtual Heat Heat { get; set; }
        public virtual Member Member { get; set; }
        public virtual Reaction Reaction { get; set; }
    }
}
