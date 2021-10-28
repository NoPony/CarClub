using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
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
                        Key = new Guid(i.Key),
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
            byte[] k = clientKey?.ToByteArray();

            if (k == null)
                return null;

            using (CarClubContext context = new CarClubContext())
            {
                context.Board.Add(new Board
                {
                    Key = Guid.NewGuid().ToByteArray(),
                    Title = request.Title,
                    Note = request.Note,

                    CreatedIp = clientIp.GetAddressBytes(),
                    CreatedUtc = DateTime.UtcNow,
                    CreatedUserId = context.User.Single(i => i.Key == k).Id,
                });

                await context.SaveChangesAsync();
            }

            return null;
        }

        public async Task<BoardDto> BoardRead(Guid? clientKey, Guid? key)
        {
            using (CarClubContext context = new CarClubContext())
            {
                byte[] k = key.Value.ToByteArray();

                return await context.Board
                    .Where(i => i.Key == k)
                    .Select(i => new BoardDto
                    {

                    })
                    .SingleAsync();
            }
        }

        public async Task<bool> BoardUpdate(Guid? clientKey, IPAddress clientIp, BoardDto request)
        {
            byte[] k = request.Key?.ToByteArray();

            if (k == null)
                return false;

            using (CarClubContext context = new CarClubContext())
            {
                using (IDbContextTransaction transaction = context.Database.BeginTransaction())
                {
                    Board b = context.Board.Single(i => i.Key == k);

                    b.Title = request.Title;
                    b.Note = request.Note;

                    await context.SaveChangesAsync();
                    await transaction.CommitAsync();

                    return true;
                }
            }
        }

        public async Task<bool> BoardDelete(Guid? clientKey, IPAddress clientIp, Guid? key)
        {
            byte[] k = key?.ToByteArray();

            if (k == null)
                return false;

            using (CarClubContext context = new CarClubContext())
            {
                using (IDbContextTransaction transaction = context.Database.BeginTransaction())
                {
                    Board b = context.Board
                        .Where(i => i.Key == k)
                        .Where(i => i.Deleted == false)
                        .Single();

                    b.Deleted = true;
                    b.DeletedIp = clientIp.GetAddressBytes();
                    b.DeletedUserId = context.User.Single(i => i.Key == k).Id;
                    b.DeletedUtc = DateTime.UtcNow;

                    await context.SaveChangesAsync();
                    await transaction.CommitAsync();

                    return true;
                }
            }
        }

        public async Task<IEnumerable<PostDto>> BoardPostList(Guid? clientKey, Guid? boardKey)
        {
            byte[] k = boardKey?.ToByteArray();

            if (k == null)
                return null;

            using (CarClubContext context = new CarClubContext())
            {
                return context.Post
                    .Where(i => i.Board.Key == k)
                    .OrderByDescending(i => i.CreatedUtc)
                    .Select(i => new PostDto
                    {

                    });
            }
        }

        //public async Task<PostDto> PostCreate(Guid? clientKey, IPAddress clientIp, PostDto request)
        //{
        //    return null;
        //}

        //public async Task<PostDto> PostRead(Guid? clientKey, Guid? key)
        //{
        //    return null;
        //}

        //public async Task<PostDto> PostUpdate(Guid? clientKey, IPAddress clientIp, PostDto request)
        //{
        //    return null;
        //}

        //public async Task<bool> PostDelete(Guid? clientKey, IPAddress clientIp, Guid? key)
        //{
        //    return null;
        //}

        //public async Task<bool> PostReaction(Guid? clientKey, IPAddress clientIp, Guid? postKey, string emoji)
        //{
        //    return null;
        //}

        //public async Task<CommentAttachmentDto> PostAttachmentCreate(Guid? clientKey, IPAddress clientIp, CommentAttachmentDto request)
        //{
        //    return null;
        //}

        //public async Task<bool> PostAttachmentDelete(Guid? clientKey, IPAddress clientIp)
        //{
        //    return null;
        //}

        //public async Task<IEnumerable<PostDto>> PostCommentList(Guid? clientKey)
        //{
        //    return null;
        //}


        //public async Task<CommentDto> CommentCreate(Guid? clientKey, IPAddress clientIp, CommentDto request)
        //{
        //    return null;
        //}

        //public async Task<CommentDto> CommentRead(Guid? clientKey, Guid? key)
        //{
        //    return null;
        //}

        //public async Task<CommentDto> CommentUpdate(Guid? clientKey, IPAddress clientIp, CommentDto request)
        //{
        //    return null;
        //}

        //public async Task<bool> CommentDelete(Guid? clientKey, IPAddress clientIp, Guid? key)
        //{
        //    return null;
        //}

        //public async Task<bool> CommentReaction(Guid? clientKey, IPAddress clientIp, Guid? comentKey, string emoji)
        //{
        //    return null;
        //}

        //public async Task<IEnumerable<CommentDto>> CommentChildList(Guid? clientKey)
        //{
        //    return null;
        //}

        //public async Task<bool> CommentAttachmentCreate(Guid? clientKey, IPAddress clientIp, CommentAttachmentDto request)
        //{
        //    return null;
        //}

        //public async Task<bool> CommentAttachmentDelete(Guid? clientKey, IPAddress clientIp, Guid? commentAttachmentKey)
        //{
        //    return null;
        //}


        //public async Task<PollDto> PollCreate(Guid? clientKey, IPAddress clientIp, PollDto request)
        //{
        //    return null;
        //}

        //public async Task<PollDto> PollRead(Guid? clientKey, Guid? key)
        //{
        //    return null;
        //}

        //public async Task<PollDto> PollUpdate(Guid? clientKey, IPAddress clientIp, PollDto request)
        //{
        //    return null;
        //}

        //public async Task<bool> PollDelete(Guid? clientKey, IPAddress clientIp, Guid? key)
        //{
        //    return null;
        //}

        //public async Task<bool> PollReaction(Guid? clientKey, IPAddress clientIp, Guid? PollKey, string emoji)
        //{
        //    return null;
        //}

        //public async Task<CommentAttachmentDto> PollAttachmentCreate(Guid? clientKey, IPAddress clientIp, CommentAttachmentDto request)
        //{
        //    return null;
        //}

        //public async Task<bool> PollAttachmentDelete(Guid? clientKey, IPAddress clientIp)
        //{
        //    return null;
        //}

        //public async Task<IEnumerable<PollDto>> PollCommentList(Guid? clientKey, Guid? pollKey)
        //{
        //    return null;
        //}


        //public async Task<SurveyDto> SurveyCreate(Guid? clientKey, IPAddress clientIp, SurveyDto request)
        //{
        //    return null;
        //}

        //public async Task<SurveyDto> SurveyRead(Guid? clientKey, Guid? key)
        //{
        //    return null;
        //}

        //public async Task<SurveyDto> SurveyUpdate(Guid? clientKey, IPAddress clientIp, SurveyDto request)
        //{
        //    return null;
        //}

        //public async Task<bool> SurveyDelete(Guid? clientKey, IPAddress clientIp, Guid? key)
        //{
        //    return null;
        //}

        //public async Task<bool> SurveyReaction(Guid? clientKey, IPAddress clientIp, Guid? SurveyKey, string emoji)
        //{
        //    return null;
        //}

        //public async Task<CommentAttachmentDto> SurveyAttachmentCreate(Guid? clientKey, IPAddress clientIp, CommentAttachmentDto request)
        //{
        //    return null;
        //}

        //public async Task<bool> SurveyAttachmentDelete(Guid? clientKey, IPAddress clientIp)
        //{
        //    return null;
        //}

        //public async Task<IEnumerable<SurveyDto>> SurveyCommentList(Guid? clientKey, Guid? surveyKey)
        //{
        //    return null;
        //}
    }
}
