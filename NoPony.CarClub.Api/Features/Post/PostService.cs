using NoPony.CarClub.Api.Features.Post.Dto;
using NoPony.CarClub.Api.Utility.PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.Post
{
    public class PostService : IPostService
    {
        private readonly IPostRepository _repository;

        public PostService(IPostRepository repository)
        {
            _repository = repository ?? throw new ArgumentNullException(nameof(repository));
        }

        public async Task PostCreate(Guid clientKey, IPAddress clientIp, PostDto request)
        {
            await _repository.PostCreate(clientKey, clientIp, request);
        }

        public async Task<PostDto> PostRead(Guid clientKey, Guid? key)
        {
            return await _repository.PostRead(clientKey, key);
        }

        public async Task PostUpdate(Guid clientKey, IPAddress clientIp, PostDto request)
        {
            await _repository.PostUpdate(clientKey, clientIp, request);
        }

        public async Task PostDelete(Guid clientKey, IPAddress clientIp, Guid? PostKey)
        {
            await _repository.PostDelete(clientKey, clientIp, PostKey);
        }

        public async Task<PageResponseDto<PostSearchDto>> PostSearch(Guid clientKey, PageRequestDto request)
        {
            return await _repository.PostSearch(clientKey, request);
        }
    }
}
