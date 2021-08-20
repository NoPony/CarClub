using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class MemberMeetAttachment
    {
        public long Id { get; set; }
        public long MemberMeetId { get; set; }
        public string UploadIp { get; set; }
        public DateTimeOffset? UploadUtc { get; set; }
        public string UploadBy { get; set; }
        public string Filename { get; set; }
        public string Url { get; set; }
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

        public virtual MemberMeet MemberMeet { get; set; }
    }
}
