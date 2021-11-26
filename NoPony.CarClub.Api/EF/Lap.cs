using System;
using System.Collections.Generic;
using System.Net;

namespace NoPony.CarClub.Api.EF
{
    public partial class Lap
    {
        public long Id { get; set; }
        public long HeatId { get; set; }
        public long? VehicleId { get; set; }
        public long? DriverId { get; set; }
        public long? StatusId { get; set; }
        public bool StartTime { get; set; }
        public decimal? StartTimeMs { get; set; }
        public IPAddress StartTimeIp { get; set; }
        public DateTime StartTimeUtc { get; set; }
        public string StartTimeBy { get; set; }
        public bool EndTime { get; set; }
        public decimal? EndTimeMs { get; set; }
        public IPAddress EndTimeIp { get; set; }
        public DateTime EndTimeUtc { get; set; }
        public string EndTimeBy { get; set; }
        public bool Time { get; set; }
        public decimal? TimeMs { get; set; }
        public IPAddress TimeIp { get; set; }
        public DateTime TimeUtc { get; set; }
        public string TimeBy { get; set; }
        public bool Position { get; set; }
        public short? PositionNumber { get; set; }
        public IPAddress PositionIp { get; set; }
        public DateTime PositionUtc { get; set; }
        public string PositionBy { get; set; }
        public IPAddress CreatedIp { get; set; }
        public DateTime CreatedUtc { get; set; }
        public long CreatedUserId { get; set; }
        public bool Updated { get; set; }
        public IPAddress UpdatedIp { get; set; }
        public DateTime? UpdatedUtc { get; set; }
        public long? UpdatedUserId { get; set; }
        public bool Deleted { get; set; }
        public IPAddress DeletedIp { get; set; }
        public DateTime? DeletedUtc { get; set; }
        public long? DeletedUserId { get; set; }
    }
}
