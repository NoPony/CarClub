using NoPony.CarClub.Api.Features.Forum.Dto;
using System;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.Forum
{
    public class ForumService : IForumService
    {
        public async Task<IEnumerable<BoardListDto>> BoardList(Guid? clientKey)
        {
            return null;
        }

        public async Task<BoardDto> BoardCreate(Guid? clientKey, IPAddress clientIp, BoardDto request)
        {
            return null;
        }

        public async Task<BoardDto >BoardRead(Guid? clientKey, Guid? key)
        {
            return null;
        }

        public async Task<BoardDto >BoardUpdate(Guid? clientKey, IPAddress clientIp, BoardDto request)
        {
            return null;
        }

        public async Task BoardDelete(Guid? clientKey, IPAddress clientIp, Guid? key)
        {
        }
    }
}
