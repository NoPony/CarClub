using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Penalty
    {
        public Penalty()
        {
            PenaltyAttachment = new HashSet<PenaltyAttachment>();
            PenaltyReaction = new HashSet<PenaltyReaction>();
        }

        public long Id { get; set; }
        public long? HeatId { get; set; }
        public long? DriverId { get; set; }
        public long? VehicleId { get; set; }
        public long? StatusId { get; set; }
        public string Code { get; set; }
        public string Title { get; set; }
        public string Notes { get; set; }
        public short? ValueMs { get; set; }
        public short? ValuePoints { get; set; }
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

        public virtual Member Driver { get; set; }
        public virtual HeatStatus Status { get; set; }
        public virtual Vehicle Vehicle { get; set; }
        public virtual ICollection<PenaltyAttachment> PenaltyAttachment { get; set; }
        public virtual ICollection<PenaltyReaction> PenaltyReaction { get; set; }
    }
}
