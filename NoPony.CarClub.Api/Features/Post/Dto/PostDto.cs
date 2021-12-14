using System;

namespace NoPony.CarClub.Api.Features.Post.Dto
{
    public class PostDto
    {
        public Guid? Key { get; set; }
        public Guid? Board { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
    }
}
