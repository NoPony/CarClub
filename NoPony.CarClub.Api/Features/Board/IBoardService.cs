using NoPony.CarClub.Api.Features.Board.Dto;
using NoPony.CarClub.Api.Utility.PagedList;
using System;
using System.Net;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.Board
{
    public interface IBoardService
    {
        Task BoardCreate(Guid? clientKey, IPAddress clientIp, BoardCreateRequestDto request);
        Task<BoardDto> BoardRead(Guid? clientKey, Guid? key);
        Task<bool> BoardUpdate(Guid? clientKey, IPAddress clientIp, BoardDto request);
        Task<bool> BoardDelete(Guid? clientKey, IPAddress clientIp, Guid? key);
        Task<PageResponseDto<BoardSearchDto>> BoardSearch(Guid? clientKey, PageRequestDto request);
    }
}
