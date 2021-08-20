using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Reaction
    {
        public Reaction()
        {
            EventReaction = new HashSet<EventReaction>();
            GridReaction = new HashSet<GridReaction>();
            HeatReaction = new HashSet<HeatReaction>();
            LapReaction = new HashSet<LapReaction>();
            MeetReaction = new HashSet<MeetReaction>();
            PenaltyReaction = new HashSet<PenaltyReaction>();
            PostReaction = new HashSet<PostReaction>();
            VehicleReaction = new HashSet<VehicleReaction>();
        }

        public long Id { get; set; }
        public string Code { get; set; }
        public string Title { get; set; }
        public string ImageUrl { get; set; }
        public string Filename { get; set; }
        public string Url { get; set; }
        public DateTimeOffset CreatedUtc { get; set; }
        public string CreatedBy { get; set; }
        public DateTimeOffset? UpdatedUtc { get; set; }
        public string UpdatedBy { get; set; }

        public virtual ICollection<EventReaction> EventReaction { get; set; }
        public virtual ICollection<GridReaction> GridReaction { get; set; }
        public virtual ICollection<HeatReaction> HeatReaction { get; set; }
        public virtual ICollection<LapReaction> LapReaction { get; set; }
        public virtual ICollection<MeetReaction> MeetReaction { get; set; }
        public virtual ICollection<PenaltyReaction> PenaltyReaction { get; set; }
        public virtual ICollection<PostReaction> PostReaction { get; set; }
        public virtual ICollection<VehicleReaction> VehicleReaction { get; set; }
    }
}
