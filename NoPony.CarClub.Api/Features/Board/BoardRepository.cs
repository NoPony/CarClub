using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using NoPony.CarClub.Api.Features.Board.Dto;
using NoPony.CarClub.Api.Utility.PagedList;
using Serilog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.Board
{
    public class BoardRepository : IBoardRepository
    {
        private readonly ILogger _log;
        private readonly EF.Context _context;

        public BoardRepository(ILogger log, EF.Context context)
        {
            _log = log ?? throw new ArgumentNullException(nameof(log));
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public async Task BoardCreate(Guid? clientKey, IPAddress clientIp, BoardCreateRequestDto request)
        {
            long clientId = await _context.User
                .Where(i => i.Deleted == false)
                .Where(i => i.Key == clientKey)
                .Select(i => i.Id)
                .SingleAsync();

            _context.Board.Add(new EF.Board
            {
                Key = Guid.NewGuid(),
                Title = request.Title,
                Note = request.Note,

                CreatedIp = clientIp,
                CreatedUtc = DateTime.UtcNow,
                CreatedUserId = clientId,
            });

            await _context.SaveChangesAsync();
        }

        public async Task<BoardDto> BoardRead(Guid? clientKey, Guid? boardKey)
        {
            return await _context.Board
                .Where(i => i.Key == boardKey)
                .Select(i => new BoardDto
                {
                    Title = i.Title,
                    Note = i.Note,
                })
                .SingleAsync();
        }

        public async Task<bool> BoardUpdate(Guid? clientKey, IPAddress clientIp, BoardDto request)
        {
            using (IDbContextTransaction transaction = _context.Database.BeginTransaction())
            {
                EF.Board board = _context.Board.Single(i => i.Key == request.Key);

                board.Title = request.Title;
                board.Note = request.Note;

                await _context.SaveChangesAsync();
                await transaction.CommitAsync();

                return true;
            }
        }

        public async Task<bool> BoardDelete(Guid? clientKey, IPAddress clientIp, Guid? boardKey)
        {
            using (IDbContextTransaction transaction = _context.Database.BeginTransaction())
            {
                long clientId = await _context.User
                    .Where(i => i.Deleted == false)
                    .Where(i => i.Key == clientKey)
                    .Select(i => i.Id)
                    .SingleAsync();

                EF.Board board = await _context.Board
                    .Where(i => i.Deleted == false)
                    .Where(i => i.Key == boardKey)
                    .SingleAsync();

                board.Deleted = true;
                board.DeletedIp = clientIp;
                board.DeletedUserId = clientId;
                board.DeletedUtc = DateTime.UtcNow;

                await _context.SaveChangesAsync();
                await transaction.CommitAsync();

                return true;
            }
        }

        public async Task<PageResponseDto<BoardSearchDto>> BoardSearch(Guid? clientKey, PageRequestDto request)
        {
            int count = await _context.Board
                .Where(i => i.Deleted == false)
                .CountAsync();

            List<BoardSearchDto> boards = await _context.Board
                .Where(i => i.Deleted == false)
                //.OrderBy(i => i.Ordinal)
                .Skip(((request.Page ?? 1) - 1) * request.Size ?? 10)
                .Take(request.Size ?? 10)
                .Select(i => new BoardSearchDto
                {
                    Key = i.Key,
                    Ordinal = i.Ordinal,
                    Title = i.Title,
                    Note = i.Note,
                    Threads = 0,
                    Messages = 0,
                })
                .ToListAsync();

            return new PageResponseDto<BoardSearchDto>
            {
                Page = request.Page,
                Count = count,
                Items = boards,
            };
        }
    }
}
