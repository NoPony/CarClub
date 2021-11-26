using NoPony.CarClub.Api.Features.Post.Dto;
using NoPony.CarClub.Api.Utility.PagedList;
using System;
using System.Net;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.Post
{
    public interface IPostService
    {
        Task<Guid?> PostCreate(Guid clientKey, IPAddress clientIp, PostDto request);
        Task<PostDto> PostRead(Guid clientKey, Guid? key);
        Task<bool> PostUpdate(Guid clientKey, IPAddress clientIp, PostDto request);
        Task<bool> PostDelete(Guid clientKey, IPAddress clientIp, Guid? key);
        Task<PageResponseDto<PostSearchDto>> PostSearch(Guid clientKey, PageRequestDto request);
    }
}
