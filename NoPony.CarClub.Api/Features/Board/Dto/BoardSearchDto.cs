using System;

namespace NoPony.CarClub.Api.Features.Board.Dto
{
    public class BoardSearchDto
    {
        public Guid? Key { get; set; }
        public int? Ordinal { get; set; }
        public string Title { get; set; }
        public string Note { get; set; }
        public int? Threads { get; set; }
        public int? Messages { get; set; }
    }
}
