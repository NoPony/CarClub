using System;

namespace NoPony.CarClub.Api.Features.Forum.Dto
{
    public class CommentDto
    {
        public Guid? Key { get; set; }
        public long? ParentId { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }

        public int? Replies { get; set; }
    }
}
