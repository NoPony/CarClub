using System;
using System.Collections.Generic;

#nullable disable

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
        public DateTimeOffset CreatedUtc { get; set; }
        public byte[] CreatedIp { get; set; }
        public long CreatedUserId { get; set; }
        public bool Updated { get; set; }
        public byte[] UpdatedIp { get; set; }
        public DateTimeOffset? UpdatedUtc { get; set; }
        public long? UpdatedUserId { get; set; }
        public bool Deleted { get; set; }
        public byte[] DeletedIp { get; set; }
        public DateTimeOffset? DeletedUtc { get; set; }
        public long? DeletedUserId { get; set; }

        public virtual Member Member { get; set; }
        public virtual SurveyQuestion SurveyQuestion { get; set; }
    }
}
