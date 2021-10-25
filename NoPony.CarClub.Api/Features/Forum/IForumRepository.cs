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
        Task<bool> BoardUpdate(Guid? clientKey, IPAddress clientIp, BoardDto request);
        Task<bool> BoardDelete(Guid? clientKey, IPAddress clientIp, Guid? key);
        Task<IEnumerable<PostDto>> BoardPostList(Guid? clientKey, Guid? boardKey);
        
        //Task<PostDto> PostCreate(Guid? clientKey, IPAddress clientIp, PostDto request);
        //Task<PostDto> PostRead(Guid? clientKey, Guid? key);
        //Task<PostDto> PostUpdate(Guid? clientKey, IPAddress clientIp, PostDto request);
        //Task<bool> PostDelete(Guid? clientKey, IPAddress clientIp, Guid? key);
        //Task<bool> PostReaction(Guid? clientKey, IPAddress clientIp, Guid? postKey, string emoji);
        //Task<CommentAttachmentDto> PostAttachmentCreate(Guid? clientKey, IPAddress clientIp, CommentAttachmentDto request);
        //Task<bool> PostAttachmentDelete(Guid? clientKey, IPAddress clientIp);
        //Task<IEnumerable<PostDto>> PostCommentList(Guid? clientKey);

        //Task<CommentDto> CommentCreate(Guid? clientKey, IPAddress clientIp, CommentDto request);
        //Task<CommentDto> CommentRead(Guid? clientKey, Guid? key);
        //Task<CommentDto> CommentUpdate(Guid? clientKey, IPAddress clientIp, CommentDto request);
        //Task<bool> CommentDelete(Guid? clientKey, IPAddress clientIp, Guid? key);
        //Task<bool> CommentReaction(Guid? clientKey, IPAddress clientIp, Guid? comentKey, string emoji);
        //Task<IEnumerable<CommentDto>> CommentChildList(Guid? clientKey);
        //Task<bool> CommentAttachmentCreate(Guid? clientKey, IPAddress clientIp, CommentAttachmentDto request);
        //Task<bool> CommentAttachmentDelete(Guid? clientKey, IPAddress clientIp, Guid? commentAttachmentKey);

        //Task<PollDto> PollCreate(Guid? clientKey, IPAddress clientIp, PollDto request);
        //Task<PollDto> PollRead(Guid? clientKey, Guid? key);
        //Task<PollDto> PollUpdate(Guid? clientKey, IPAddress clientIp, PollDto request);
        //Task<bool> PollDelete(Guid? clientKey, IPAddress clientIp, Guid? key);
        //Task<bool> PollReaction(Guid? clientKey, IPAddress clientIp, Guid? PollKey, string emoji);
        //Task<CommentAttachmentDto> PollAttachmentCreate(Guid? clientKey, IPAddress clientIp, CommentAttachmentDto request);
        //Task<bool> PollAttachmentDelete(Guid? clientKey, IPAddress clientIp);
        //Task<IEnumerable<PollDto>> PollCommentList(Guid? clientKey, Guid? pollKey);

        //Task<SurveyDto> SurveyCreate(Guid? clientKey, IPAddress clientIp, SurveyDto request);
        //Task<SurveyDto> SurveyRead(Guid? clientKey, Guid? key);
        //Task<SurveyDto> SurveyUpdate(Guid? clientKey, IPAddress clientIp, SurveyDto request);
        //Task<bool> SurveyDelete(Guid? clientKey, IPAddress clientIp, Guid? key);
        //Task<bool> SurveyReaction(Guid? clientKey, IPAddress clientIp, Guid? SurveyKey, string emoji);
        //Task<CommentAttachmentDto> SurveyAttachmentCreate(Guid? clientKey, IPAddress clientIp, CommentAttachmentDto request);
        //Task<bool> SurveyAttachmentDelete(Guid? clientKey, IPAddress clientIp);
        //Task<IEnumerable<SurveyDto>> SurveyCommentList(Guid? clientKey, Guid? surveyKey);
    }
}
