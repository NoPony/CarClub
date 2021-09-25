using System.Collections.Generic;

namespace NoPony.CarClub.Api.Utility.PagedList
{
    public class PageResponseDto<T> where T : class
    {
        public int? Page { get; set; }
        public int? Count { get; set; }
        public IEnumerable<T> Items { get; set; }
    }
}
