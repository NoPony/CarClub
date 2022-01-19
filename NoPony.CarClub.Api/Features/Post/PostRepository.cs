using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using NoPony.CarClub.Api.Features.Post.Dto;
using NoPony.CarClub.Api.Utility.PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.Post
{
    public class PostRepository : IPostRepository
    {
        private readonly EF.Context _context;

        public PostRepository(EF.Context context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public async Task PostCreate(Guid clientKey, IPAddress clientIp, PostDto request)
        {
            using (IDbContextTransaction transaction = _context.Database.BeginTransaction())
            {
                DateTime now = DateTime.UtcNow;

                long userId = await _context.User
                    .Where(i => i.Key == clientKey)
                    .Where(i => i.Deleted == false)
                    .Select(i => i.Id)
                    .SingleAsync();

                long boardId = await _context.Board
                    .Where(i => i.Deleted == false)
                    .Where(i => i.Key == request.Key)
                    .Select(i => i.Id)
                    .SingleAsync();

                Guid postKey = Guid.NewGuid();

                _context.Post.Add(new EF.Post
                {
                    Key = postKey,
                    BoardId = boardId,

                    Title = request.Title,
                    Content = request.Content,

                    Thread = new EF.Thread
                    {
                        CreatedIp = clientIp,
                        CreatedUtc = now,
                        CreatedUserId = userId,
                    },

                    CreatedIp = clientIp,
                    CreatedUtc = now,
                    CreatedUserId = userId,
                });

                await _context.SaveChangesAsync();
                await transaction.CommitAsync();
            }
        }

        public async Task<PostDto> PostRead(Guid clientKey, Guid? postKey)
        {
            return await _context.Post
                .Where(i => i.Key == postKey)
                .Select(i => new PostDto
                {
                    Key=i.Key,
                    Board=i.Board.Key,
                    Title=i.Title,
                    Content =   i.Content,
                })
                .SingleAsync();
        }

        public async Task PostUpdate(Guid clientKey, IPAddress clientIp, PostDto request)
        {
            using (IDbContextTransaction transaction = _context.Database.BeginTransaction())
            {
                EF.Post b = _context.Post.Single(i => i.Key == request.Key);

                b.Title = request.Title;
                b.Content = request.Content;

                await _context.SaveChangesAsync();
                await transaction.CommitAsync();
            }
        }

        public async Task PostDelete(Guid clientKey, IPAddress clientIp, Guid? key)
        {
            using (IDbContextTransaction transaction = _context.Database.BeginTransaction())
            {
                long clientId = await _context.User
                    .Where(i => i.Deleted == false)
                    .Where(i => i.Key == clientKey)
                    .Select(i => i.Id)
                    .SingleAsync();

                EF.Post post = await _context.Post
                    .Where(i => i.Deleted == false)
                    .Where(i => i.Key == clientKey)
                    .SingleAsync();

                post.Deleted = true;
                post.DeletedIp = clientIp;
                post.DeletedUserId = clientId;
                post.DeletedUtc = DateTime.UtcNow;

                await _context.SaveChangesAsync();
                await transaction.CommitAsync();
            }
        }

        public async Task<PageResponseDto<PostSearchDto>> PostSearch(Guid clientKey, PageRequestDto request)
        {
            int count = await _context.Post
                .Where(i => i.Deleted == false)
                .CountAsync();

            List<PostSearchDto> items = await _context.Post
                .Where(i => i.Deleted == false)
                .OrderByDescending(i => i.CreatedUtc)
                .Skip(((request.Page ?? 1) - 1) * request.Size ?? 10)
                .Take(request.Size ?? 10)
                .Select(i => new PostSearchDto
                {
                    Key = i.Key,
                    Title = i.Title,
                    Content = i.Content,
                })
                .ToListAsync();

            return new PageResponseDto<PostSearchDto>
            {
                Page = request.Page,
                Count = count,
                Items = items,
            };
        }
    }
}
