using NoPony.CarClub.Api.Features.Forum.Dto;
using System;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.Forum
{
    public interface IForumRepository
    {
        Task<IEnumerable<BoardListDto>> BoardList(Guid? clientKey);
        Task<BoardDto> BoardCreate(Guid? clientKey, IPAddress clientIp, BoardDto request);
        Task<BoardDto> BoardRead(Guid? clientKey, Guid? key);
        Task<BoardDto> BoardUpdate(Guid? clientKey, IPAddress clientIp, BoardDto request);
        Task BoardDelete(Guid? clientKey, IPAddress clientIp, Guid? key);
    }
}
