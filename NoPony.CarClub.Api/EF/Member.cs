using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Member
    {
        public Member()
        {
            BoardCreator = new HashSet<Board>();
            BoardOwner = new HashSet<Board>();
            EventOfficial = new HashSet<EventOfficial>();
            EventReaction = new HashSet<EventReaction>();
            GridReaction = new HashSet<GridReaction>();
            HeatReaction = new HashSet<HeatReaction>();
            LapReaction = new HashSet<LapReaction>();
            MeetOfficial = new HashSet<MeetOfficial>();
            MeetReaction = new HashSet<MeetReaction>();
            MemberEvent = new HashSet<MemberEvent>();
            MemberMeet = new HashSet<MemberMeet>();
            MemberRole = new HashSet<MemberRole>();
            MemberTransaction = new HashSet<MemberTransaction>();
            Penalty = new HashSet<Penalty>();
            PenaltyReaction = new HashSet<PenaltyReaction>();
            PostReaction = new HashSet<PostReaction>();
            SurveyCreator = new HashSet<Survey>();
            SurveyOwner = new HashSet<Survey>();
            SurveyResponse = new HashSet<SurveyResponse>();
            TagCreator = new HashSet<Tag>();
            TagOwner = new HashSet<Tag>();
            VehicleReaction = new HashSet<VehicleReaction>();
        }

        public long Id { get; set; }
        public Guid? UserKey { get; set; }
        public string FullName { get; set; }
        public string PreferredName { get; set; }
        public string Phone { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
        public string PrimaryAddressStreet1 { get; set; }
        public string PrimaryAddressStreet2 { get; set; }
        public string PrimaryAddressSuburb { get; set; }
        public string PrimaryAddressPostcode { get; set; }
        public string PrimaryAddressState { get; set; }
        public decimal? PrimaryAddressLatitude { get; set; }
        public decimal? PrimaryAddressLongitude { get; set; }
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

        public virtual ICollection<Board> BoardCreator { get; set; }
        public virtual ICollection<Board> BoardOwner { get; set; }
        public virtual ICollection<EventOfficial> EventOfficial { get; set; }
        public virtual ICollection<EventReaction> EventReaction { get; set; }
        public virtual ICollection<GridReaction> GridReaction { get; set; }
        public virtual ICollection<HeatReaction> HeatReaction { get; set; }
        public virtual ICollection<LapReaction> LapReaction { get; set; }
        public virtual ICollection<MeetOfficial> MeetOfficial { get; set; }
        public virtual ICollection<MeetReaction> MeetReaction { get; set; }
        public virtual ICollection<MemberEvent> MemberEvent { get; set; }
        public virtual ICollection<MemberMeet> MemberMeet { get; set; }
        public virtual ICollection<MemberRole> MemberRole { get; set; }
        public virtual ICollection<MemberTransaction> MemberTransaction { get; set; }
        public virtual ICollection<Penalty> Penalty { get; set; }
        public virtual ICollection<PenaltyReaction> PenaltyReaction { get; set; }
        public virtual ICollection<PostReaction> PostReaction { get; set; }
        public virtual ICollection<Survey> SurveyCreator { get; set; }
        public virtual ICollection<Survey> SurveyOwner { get; set; }
        public virtual ICollection<SurveyResponse> SurveyResponse { get; set; }
        public virtual ICollection<Tag> TagCreator { get; set; }
        public virtual ICollection<Tag> TagOwner { get; set; }
        public virtual ICollection<VehicleReaction> VehicleReaction { get; set; }
    }
}
