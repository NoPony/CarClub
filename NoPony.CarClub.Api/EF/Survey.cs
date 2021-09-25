using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Survey
    {
        public Survey()
        {
            Post = new HashSet<Post>();
            SurveyQuestion = new HashSet<SurveyQuestion>();
        }

        public long Id { get; set; }
        public long CreatorId { get; set; }
        public long OwnerId { get; set; }
        public long StatusId { get; set; }
        public string Title { get; set; }
        public string Note { get; set; }
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

        public virtual Member Creator { get; set; }
        public virtual Member Owner { get; set; }
        public virtual SurveyStatus Status { get; set; }
        public virtual ICollection<Post> Post { get; set; }
        public virtual ICollection<SurveyQuestion> SurveyQuestion { get; set; }
    }
}
