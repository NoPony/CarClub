using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.Post.Dto
{
    public class PostSearchDto
    {
        public Guid? Key { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
    }
}
