using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class MemberMeet
    {
        public MemberMeet()
        {
            MemberMeetAttachment = new HashSet<MemberMeetAttachment>();
        }

        public long Id { get; set; }
        public long MemberId { get; set; }
        public long MeetId { get; set; }
        public bool Enter { get; set; }
        public byte[] EnterIp { get; set; }
        public DateTimeOffset? EnterUtc { get; set; }
        public string EnterBy { get; set; }
        public bool Checkin { get; set; }
        public byte[] CheckinIp { get; set; }
        public DateTimeOffset CheckinUtc { get; set; }
        public string CheckinBy { get; set; }
        public bool Checkout { get; set; }
        public byte[] CheckoutIp { get; set; }
        public DateTimeOffset CheckoutUtc { get; set; }
        public string CheckoutBy { get; set; }
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
        public bool? DeletedBy { get; set; }

        public virtual Meet Meet { get; set; }
        public virtual Member Member { get; set; }
        public virtual ICollection<MemberMeetAttachment> MemberMeetAttachment { get; set; }
    }
}
