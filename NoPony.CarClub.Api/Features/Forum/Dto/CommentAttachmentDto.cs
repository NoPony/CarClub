using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.Forum.Dto
{
    public class CommentAttachmentDto
    {
        public Guid? CommentKey { get; set; }
        public string Filename { get; set; }
        public string Url { get; set; }
    }
}
