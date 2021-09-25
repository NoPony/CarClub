using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Lap
    {
        public Lap()
        {
            LapReaction = new HashSet<LapReaction>();
        }

        public long Id { get; set; }
        public long HeatId { get; set; }
        public long? VehicleId { get; set; }
        public long? DriverId { get; set; }
        public long? StatusId { get; set; }
        public bool StartTime { get; set; }
        public decimal? StartTimeMs { get; set; }
        public byte[] StartTimeIp { get; set; }
        public DateTimeOffset StartTimeUtc { get; set; }
        public string StartTimeBy { get; set; }
        public bool EndTime { get; set; }
        public decimal? EndTimeMs { get; set; }
        public byte[] EndTimeIp { get; set; }
        public DateTimeOffset EndTimeUtc { get; set; }
        public string EndTimeBy { get; set; }
        public bool Time { get; set; }
        public decimal? TimeMs { get; set; }
        public byte[] TimeIp { get; set; }
        public DateTimeOffset TimeUtc { get; set; }
        public string TimeBy { get; set; }
        public bool Position { get; set; }
        public byte? PositionNumber { get; set; }
        public byte[] PositionIp { get; set; }
        public DateTimeOffset PositionUtc { get; set; }
        public string PositionBy { get; set; }
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

        public virtual User CreatedUser { get; set; }
        public virtual User DeletedUser { get; set; }
        public virtual Heat Heat { get; set; }
        public virtual User UpdatedUser { get; set; }
        public virtual ICollection<LapReaction> LapReaction { get; set; }
    }
}
