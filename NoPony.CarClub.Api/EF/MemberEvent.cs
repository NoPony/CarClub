using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class MemberEvent
    {
        public MemberEvent()
        {
            MemberEventAttachment = new HashSet<MemberEventAttachment>();
        }

        public long Id { get; set; }
        public long MemberId { get; set; }
        public long EventId { get; set; }
        public bool Register { get; set; }
        public string RegisterIp { get; set; }
        public DateTimeOffset? RegisterUtc { get; set; }
        public string RegisterBy { get; set; }
        public bool Checkin { get; set; }
        public string CheckinIp { get; set; }
        public DateTimeOffset? CheckinUtc { get; set; }
        public string CheckinBy { get; set; }
        public bool OnTrack { get; set; }
        public string OnTrackIp { get; set; }
        public DateTimeOffset? OnTrackUtc { get; set; }
        public string OnTrackBy { get; set; }
        public bool OffTrack { get; set; }
        public string OffTrackIp { get; set; }
        public DateTimeOffset? OffTrackUtc { get; set; }
        public string OffTrackBy { get; set; }
        public bool Checkout { get; set; }
        public string CheckoutIp { get; set; }
        public DateTimeOffset? CheckoutUtc { get; set; }
        public string CheckoutBy { get; set; }
        public DateTimeOffset CreatedUtc { get; set; }
        public string CreatedIp { get; set; }
        public string CreatedBy { get; set; }
        public bool Updated { get; set; }
        public string UpdatedIp { get; set; }
        public DateTimeOffset? UpdatedUtc { get; set; }
        public string UpdatedBy { get; set; }
        public bool Deleted { get; set; }
        public string DeletedIp { get; set; }
        public DateTimeOffset? DeletedUtc { get; set; }
        public string DeletedBy { get; set; }

        public virtual Event Event { get; set; }
        public virtual Member Member { get; set; }
        public virtual ICollection<MemberEventAttachment> MemberEventAttachment { get; set; }
    }
}
