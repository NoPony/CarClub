using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Vehicle
    {
        public Vehicle()
        {
            Penalty = new HashSet<Penalty>();
            VehicleAttachment = new HashSet<VehicleAttachment>();
            VehicleReaction = new HashSet<VehicleReaction>();
        }

        public long Id { get; set; }
        public long StatusId { get; set; }
        public long? MakeId { get; set; }
        public long? ModelId { get; set; }
        public long? VariantId { get; set; }
        public short? Year { get; set; }
        public string Title { get; set; }
        public string Note { get; set; }
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

        public virtual VehicleMake Make { get; set; }
        public virtual VehicleModel Model { get; set; }
        public virtual VehicleStatus Status { get; set; }
        public virtual VehicleVariant Variant { get; set; }
        public virtual ICollection<Penalty> Penalty { get; set; }
        public virtual ICollection<VehicleAttachment> VehicleAttachment { get; set; }
        public virtual ICollection<VehicleReaction> VehicleReaction { get; set; }
    }
}
