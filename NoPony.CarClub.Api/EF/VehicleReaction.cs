using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class VehicleReaction
    {
        public long Id { get; set; }
        public long VehicleId { get; set; }
        public long MemberId { get; set; }
        public long ReactionId { get; set; }
        public DateTimeOffset WhenUtc { get; set; }
        public DateTimeOffset CreatedUtc { get; set; }
        public string CreatedBy { get; set; }
        public DateTimeOffset? UpdatedUtc { get; set; }
        public string UpdatedBy { get; set; }

        public virtual Member Member { get; set; }
        public virtual Reaction Reaction { get; set; }
        public virtual Vehicle Vehicle { get; set; }
    }
}
