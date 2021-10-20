using NoPony.CarClub.Api.Features.Forum.Dto;
using System;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.Forum
{
    public class ForumService : IForumService
    {
        private readonly IForumRepository _repository;

        public ForumService(IForumRepository repository)
        {
            _repository = repository ?? throw new ArgumentNullException(nameof(repository));
        }

        public async Task<IEnumerable<BoardListDto>> BoardList(Guid? clientKey)
        {
            return await _repository.BoardList(clientKey);
        }


        public async Task<BoardDto> BoardCreate(Guid? clientKey, IPAddress clientIp, BoardDto request)
        {
            return await _repository.BoardCreate(clientKey, clientIp, request);
        }

        public async Task<BoardDto> BoardRead(Guid? clientKey, Guid? key)
        {
            return await _repository.BoardRead(clientKey, key);
        }

        public async Task<BoardDto> BoardUpdate(Guid? clientKey, IPAddress clientIp, BoardDto request)
        {
            return await _repository.BoardUpdate(clientKey, clientIp, request);
        }

        public async Task<bool> BoardDelete(Guid? clientKey, IPAddress clientIp, Guid? boardKey)
        {
            return await _repository.BoardDelete(clientKey, clientIp, boardKey);
        }

        public async Task<IEnumerable<PostDto>> BoardPostList(Guid? clientKey, Guid? boardKey)
        {
            return await _repository.BoardPostList(clientKey, boardKey);
        }

        //// Post
        //public async Task<PostDto> PostCreate(Guid? clientKey, IPAddress clientIp, PostDto request)
        //{
        //    return await _repository.PostCreate(clientKey, clientIp, request);
        //}

        //public async Task<PostDto> PostRead(Guid? clientKey, Guid? key)
        //{
        //    return await _repository.PostRead(clientKey, key);
        //}

        //public async Task<PostDto> PostUpdate(Guid? clientKey, IPAddress clientIp, PostDto request)
        //{
        //    return await _repository.PostUpdate(clientKey, clientIp, request);
        //}

        //public async Task<bool> PostDelete(Guid? clientKey, IPAddress clientIp, Guid? key)
        //{
        //    return await _repository.PostDelete(clientKey, clientIp, key);
        //}

        //public async Task<bool> PostReaction(Guid? clientKey, IPAddress clientIp, Guid? postKey, string emoji)
        //{
        //    return await _repository.PostReaction(clientKey, clientIp, postKey, emoji);
        //}

        //public async Task<CommentAttachmentDto> PostAttachmentCreate(Guid? clientKey, IPAddress clientIp, CommentAttachmentDto request)
        //{
        //    return await _repository.PostAttachmentCreate(clientKey, clientIp, request);
        //}

        //public async Task<bool> PostAttachmentDelete(Guid? clientKey, IPAddress clientIp)
        //{
        //    return await _repository.PostAttachmentDelete(clientKey, clientIp);
        //}

        //public async Task<IEnumerable<PostDto>> PostCommentList(Guid? clientKey)
        //{
        //    return await _repository.PostCommentList(clientKey);
        //}


        //// Comment
        //public async Task<CommentDto> CommentCreate(Guid? clientKey, IPAddress clientIp, CommentDto request)
        //{
        //    return await _repository.CommentCreate(clientKey, clientIp, request);
        //}

        //public async Task<CommentDto> CommentRead(Guid? clientKey, Guid? key)
        //{
        //    return await _repository.CommentRead(clientKey, key);
        //}

        //public async Task<CommentDto> CommentUpdate(Guid? clientKey, IPAddress clientIp, CommentDto request)
        //{
        //    return await _repository.CommentUpdate(clientKey, clientIp, request);
        //}

        //public async Task<bool> CommentDelete(Guid? clientKey, IPAddress clientIp, Guid? key)
        //{
        //    return await _repository.CommentDelete(clientKey, clientIp, key);
        //}

        //public async Task<bool> CommentReaction(Guid? clientKey, IPAddress clientIp, Guid? postKey, string emoji)
        //{
        //    return await _repository.CommentReaction(clientKey, clientIp, postKey, emoji);
        //}

        //public async Task<IEnumerable<CommentDto>> CommentChildList(Guid? clientKey)
        //{
        //    return await _repository.CommentChildList(clientKey);
        //}

        //public async Task<bool> CommentAttachmentCreate(Guid? clientKey, IPAddress clientIp, CommentAttachmentDto request)
        //{
        //    return await _repository.CommentAttachmentCreate(clientKey, clientIp, request);
        //}

        //public async Task<bool> CommentAttachmentDelete(Guid? clientKey, IPAddress clientIp, Guid? commentAttachmentKey)
        //{
        //    return await _repository.CommentAttachmentDelete(clientKey, clientIp, commentAttachmentKey);
        //}

        //// Poll
        //public async Task<PollDto> PollCreate(Guid? clientKey, IPAddress clientIp, PollDto request)
        //{
        //    return await _repository.PollCreate(clientKey, clientIp, request);
        //}

        //public async Task<PollDto> PollRead(Guid? clientKey, Guid? key)
        //{
        //    return await _repository.PollRead(clientKey, key);
        //}

        //public async Task<PollDto> PollUpdate(Guid? clientKey, IPAddress clientIp, PollDto request)
        //{
        //    return await _repository.PollUpdate(clientKey, clientIp, request);
        //}

        //public async Task<bool> PollDelete(Guid? clientKey, IPAddress clientIp, Guid? key)
        //{
        //    return await _repository.PollDelete(clientKey, clientIp, key);
        //}

        //public async Task<bool> PollReaction(Guid? clientKey, IPAddress clientIp, Guid? postKey, string emoji)
        //{
        //    return await _repository.PollReaction(clientKey, clientIp, postKey, emoji);
        //}
        //public async Task<CommentAttachmentDto> PollAttachmentCreate(Guid? clientKey, IPAddress clientIp, CommentAttachmentDto request)
        //{

        //}

        //public async Task<bool> PollAttachmentDelete(Guid? clientKey, IPAddress clientIp)
        //{
        //    return await _repository.PollAttachmentDelete(clientKey, PollKey);
        //}

        //public async Task<IEnumerable<PostDto>> PollCommentList(Guid? clientKey, Guid? PollKey)
        //{
        //    return await _repository.PollCommentList(clientKey, PollKey);
        //}

        //public async Task<bool> CommentAttachmentCreate(Guid? clientKey, IPAddress clientIp, CommentAttachmentDto request)
        //{
        //    return await _repository.CommentAttachmentCreate(clientKey, clientIp, request);
        //}

        //public async Task<bool> CommentAttachmentDelete(Guid? clientKey, IPAddress clientIp, Guid? commentAttachmentKey)
        //{
        //    return await _repository.CommentAttachmentDelete(clientKey, clientIp, commentAttachmentKey);
        //}
        
        ////Survey
        //public async Task<SurveyDto> SurveyCreate(Guid? clientKey, IPAddress clientIp, SurveyDto request)
        //{
        //    return await _repository.SurveyCreate(clientKey, clientIp, request);
        //}

        //public async Task<SurveyDto> SurveyRead(Guid? clientKey, Guid? key)
        //{
        //    return await _repository.SurveyRead(clientKey, key);
        //}

        //public async Task<SurveyDto> SurveyUpdate(Guid? clientKey, IPAddress clientIp, SurveyDto request)
        //{
        //    return await _repository.SurveyUpdate(clientKey, clientIp, request);
        //}

        //public async Task<bool> SurveyDelete(Guid? clientKey, IPAddress clientIp, Guid? key)
        //{
        //    return await _repository.SurveyDelete(clientKey, clientIp, key);
        //}
        //public async Task<bool> SurveyReaction(Guid? clientKey, IPAddress clientIp, Guid? SurveyKey, string emoji)
        //{
        //    return true;
        //}

        //public async Task<CommentAttachmentDto> SurveyAttachmentCreate(Guid? clientKey, IPAddress clientIp, CommentAttachmentDto request)
        //{
        //    return null;
        //}

        //public async Task<bool> SurveyAttachmentDelete(Guid? clientKey, IPAddress clientIp)
        //{
        //    return true;
        //}

        //public async Task<IEnumerable<CommentDto>> SurveyCommentList(Guid? clientKey, Guid? SurveyKey)
        //{
        //    return null;
        //}
    }
}
