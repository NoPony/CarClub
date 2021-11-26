using System;

namespace NoPony.CarClub.Api.Features.Comment.Dto
{
    public class CommentSearchDto
    {
        public Guid? Key { get; set; }
        public Guid? ParentKey { get; set; }

        public string Title { get; set; }
        public string Content { get; set; }

        public int? Replies { get; set; }
    }
}
