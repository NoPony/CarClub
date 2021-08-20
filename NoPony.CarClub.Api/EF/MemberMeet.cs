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
        public string EnterIp { get; set; }
        public DateTimeOffset? EnterUtc { get; set; }
        public string EnterBy { get; set; }
        public bool Checkin { get; set; }
        public string CheckinIp { get; set; }
        public DateTimeOffset CheckinUtc { get; set; }
        public string CheckinBy { get; set; }
        public bool Checkout { get; set; }
        public string CheckoutIp { get; set; }
        public DateTimeOffset CheckoutUtc { get; set; }
        public string CheckoutBy { get; set; }
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
        public bool? DeletedBy { get; set; }

        public virtual Meet Meet { get; set; }
        public virtual Member Member { get; set; }
        public virtual ICollection<MemberMeetAttachment> MemberMeetAttachment { get; set; }
    }
}
