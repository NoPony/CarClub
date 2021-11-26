namespace NoPony.CarClub.Api.Utility.PagedList
{
    public class PageRequestDto
    {
        public int? Page { get; set; }
        public int? Size { get; set; }
        public string Query { get; set; }
        public string Filter { get; set; }

        public PageRequestDto()
        { }
    }
}
