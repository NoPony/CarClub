using System;
using System.Collections.Generic;
using System.Net;

namespace NoPony.CarClub.Api.EF
{
    public partial class MemberEvent
    {
        public long Id { get; set; }
        public long MemberId { get; set; }
        public long EventId { get; set; }
        public bool Register { get; set; }
        public IPAddress RegisterIp { get; set; }
        public DateTime? RegisterUtc { get; set; }
        public string RegisterBy { get; set; }
        public bool Checkin { get; set; }
        public IPAddress CheckinIp { get; set; }
        public DateTime? CheckinUtc { get; set; }
        public string CheckinBy { get; set; }
        public bool OnTrack { get; set; }
        public IPAddress OnTrackIp { get; set; }
        public DateTime? OnTrackUtc { get; set; }
        public string OnTrackBy { get; set; }
        public bool OffTrack { get; set; }
        public IPAddress OffTrackIp { get; set; }
        public DateTime? OffTrackUtc { get; set; }
        public string OffTrackBy { get; set; }
        public bool Checkout { get; set; }
        public IPAddress CheckoutIp { get; set; }
        public DateTime? CheckoutUtc { get; set; }
        public string CheckoutBy { get; set; }
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
