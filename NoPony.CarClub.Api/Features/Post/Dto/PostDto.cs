namespace NoPony.CarClub.Api.Features.Forum.Dto
{
    public class PostDto
    {
        public long? ParentId { get; set; }
        public string Title { get; set; }
        public string Note { get; set; }
    }
}
