using System;
using System.Collections.Generic;
using System.Net;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class MemberMeet
    {
        public long Id { get; set; }
        public long MemberId { get; set; }
        public long MeetId { get; set; }
        public bool Enter { get; set; }
        public IPAddress EnterIp { get; set; }
        public DateTime? EnterUtc { get; set; }
        public string EnterBy { get; set; }
        public bool Checkin { get; set; }
        public IPAddress CheckinIp { get; set; }
        public DateTime CheckinUtc { get; set; }
        public string CheckinBy { get; set; }
        public bool Checkout { get; set; }
        public IPAddress CheckoutIp { get; set; }
        public DateTime CheckoutUtc { get; set; }
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
        public bool? DeletedBy { get; set; }
        public long? DeletedUserId { get; set; }
    }
}
