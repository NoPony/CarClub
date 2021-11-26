using NoPony.CarClub.Api.Features.Board.Dto;
using NoPony.CarClub.Api.Utility.PagedList;
using System;
using System.Net;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.Board
{
    public class BoardService : IBoardService
    {
        private readonly IBoardRepository _repository;

        public BoardService(IBoardRepository repository)
        {
            _repository = repository ?? throw new ArgumentNullException(nameof(repository));
        }

        public async Task BoardCreate(Guid? clientKey, IPAddress clientIp, BoardCreateRequestDto request)
        {
            await _repository.BoardCreate(clientKey, clientIp, request);
        }

        public async Task<BoardDto> BoardRead(Guid? clientKey, Guid? key)
        {
            return await _repository.BoardRead(clientKey, key);
        }

        public async Task<bool> BoardUpdate(Guid? clientKey, IPAddress clientIp, BoardDto request)
        {
            return await _repository.BoardUpdate(clientKey, clientIp, request);
        }

        public async Task<bool> BoardDelete(Guid? clientKey, IPAddress clientIp, Guid? boardKey)
        {
            return await _repository.BoardDelete(clientKey, clientIp, boardKey);
        }

        public async Task<PageResponseDto<BoardSearchDto>> BoardSearch(Guid? clientKey, PageRequestDto request)
        {
            return await _repository.BoardSearch(clientKey, request);
        }
    }
}
