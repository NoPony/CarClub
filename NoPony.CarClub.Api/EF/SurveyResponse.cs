using System;
using System.Collections.Generic;
using System.Net;

namespace NoPony.CarClub.Api.EF
{
    public partial class SurveyResponse
    {
        public long Id { get; set; }
        public long SurveyQuestionId { get; set; }
        public long MemberId { get; set; }
        public long? OptionId { get; set; }
        public short? IntValue { get; set; }
        public string Note { get; set; }
        public DateTime CreatedUtc { get; set; }
        public IPAddress CreatedIp { get; set; }
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
