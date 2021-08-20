using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class SurveyQuestion
    {
        public SurveyQuestion()
        {
            SurveyOption = new HashSet<SurveyOption>();
            SurveyResponse = new HashSet<SurveyResponse>();
        }

        public long Id { get; set; }
        public long SurveyId { get; set; }
        public byte? Position { get; set; }
        public string Title { get; set; }
        public string Note { get; set; }
        public bool? Text { get; set; }
        public bool? Int { get; set; }
        public short? IntMin { get; set; }
        public short? IntMax { get; set; }
        public byte? IntSteps { get; set; }
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
        public string DeletedBy { get; set; }

        public virtual Survey Survey { get; set; }
        public virtual ICollection<SurveyOption> SurveyOption { get; set; }
        public virtual ICollection<SurveyResponse> SurveyResponse { get; set; }
    }
}
