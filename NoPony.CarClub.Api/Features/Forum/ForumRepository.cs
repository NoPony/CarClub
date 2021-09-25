using Microsoft.EntityFrameworkCore;
using NoPony.CarClub.Api.EF;
using NoPony.CarClub.Api.Features.Forum.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.Forum
{
    public class ForumRepository : IForumRepository
    {
        public async Task<IEnumerable<BoardListDto>> BoardList(Guid? clientKey)
        {
            using (CarClubContext context = new CarClubContext())
            {
                return await context.Board
                    .Where(i => i.Deleted == false)
                    .Select(i => new BoardListDto
                    {
                        Key = i.Key,
                        Ordinal = i.Ordinal,
                        Title = i.Title,
                        Note = i.Note,
                        // Threads
                        // Messages
                    })
                    .ToListAsync();
            }
        }

        public async Task<BoardDto> BoardCreate(Guid? clientKey, IPAddress clientIp, BoardDto request)
        {
            using (CarClubContext context = new CarClubContext())
            {
                context.Board.Add(new Board
                {
                    Key = Guid.NewGuid(),
                    Title = request.Title,
                    Note = request.Note,

                    CreatedIp = clientIp.GetAddressBytes(),
                    CreatedUtc=DateTime.UtcNow,
                    CreatedUserId = context.User.Single(i => i.Key == clientKey).Id,
                });

                await context.SaveChangesAsync();

            }
                return null;
        }

        public async Task<BoardDto> BoardRead(Guid? clientKey, Guid? key)
        {
            return null;
        }

        public async Task<BoardDto> BoardUpdate(Guid? clientKey, IPAddress clientIp, BoardDto request)
        {
            return null;
        }

        public async Task BoardDelete(Guid? clientKey, IPAddress clientIp, Guid? key)
        {

        }

    }
}
