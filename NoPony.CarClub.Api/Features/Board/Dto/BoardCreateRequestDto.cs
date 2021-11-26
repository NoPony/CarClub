using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.Board.Dto
{
    public class BoardCreateRequestDto
    {
        public string Title { get; set; }
        public string Note { get; set; }
    }
}
