using System;

namespace NoPony.CarClub.Api.Features.Forum.Dto
{
    public class BoardListDto
    {
        public Guid? Key { get; set; }
        public int? Ordinal { get; set; }
        public string Title { get; set; }
        public string Note { get; set; }
        public int? Threads { get; set; }
        public int? Messages { get; set; }

        //public string LastThreadTitle { get; set; }
        //public string LastThreadUrl { get; set; }
        //public DateTimeOffset? LastThreadDate { get; set; }
        //public string LastThreadAuthorName { get; set; }
        //public string LastThreadAuthorUrl { get; set; }
    }
}
