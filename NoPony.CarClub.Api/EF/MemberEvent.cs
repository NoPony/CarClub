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
        public byte[] RegisterIp { get; set; }
        public DateTimeOffset? RegisterUtc { get; set; }
        public string RegisterBy { get; set; }
        public bool Checkin { get; set; }
        public byte[] CheckinIp { get; set; }
        public DateTimeOffset? CheckinUtc { get; set; }
        public string CheckinBy { get; set; }
        public bool OnTrack { get; set; }
        public byte[] OnTrackIp { get; set; }
        public DateTimeOffset? OnTrackUtc { get; set; }
        public string OnTrackBy { get; set; }
        public bool OffTrack { get; set; }
        public byte[] OffTrackIp { get; set; }
        public DateTimeOffset? OffTrackUtc { get; set; }
        public string OffTrackBy { get; set; }
        public bool Checkout { get; set; }
        public byte[] CheckoutIp { get; set; }
        public DateTimeOffset? CheckoutUtc { get; set; }
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
        public long? DeletedUserId { get; set; }

        public virtual Event Event { get; set; }
        public virtual Member Member { get; set; }
        public virtual ICollection<MemberEventAttachment> MemberEventAttachment { get; set; }
    }
}
