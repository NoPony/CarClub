using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NoPony.CarClub.Api.Features.Forum.Dto;
using Serilog;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.Forum
{
    [ApiController]
    [Route("[controller]")]
    public class ForumController : ControllerBase
    {
        private readonly ILogger _log;
        private readonly IForumService _service;

        public ForumController(ILogger log, IForumService userService)
        {
            _log = log ?? throw new ArgumentNullException(nameof(log));

            _service = userService ?? throw new ArgumentNullException(nameof(userService));
        }

        [HttpPost]
        [Route("Board")]
        public async Task<ActionResult<BoardListDto>> BoardCreate([FromBody] BoardDto request)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                var response = await _service.BoardCreate(clientKey, HttpContext.Connection.RemoteIpAddress, request);

                if (response == null)
                    return StatusCode(StatusCodes.Status400BadRequest);

                return StatusCode(StatusCodes.Status200OK, response);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(ForumController), nameof(BoardCreate));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpGet]
        [Route("Board/{key:Guid}")]
        public async Task<ActionResult<BoardDto>> BoardRead([FromRoute] Guid key)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                var response = await _service.BoardRead(clientKey, key);

                if (response == null)
                    return StatusCode(StatusCodes.Status400BadRequest);

                return StatusCode(StatusCodes.Status200OK, response);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(ForumController), nameof(BoardRead));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpPatch]
        [Route("Board")]
        public async Task<ActionResult<BoardDto>> BoardUpdate([FromBody] BoardDto request)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                var response = await _service.BoardUpdate(clientKey, HttpContext.Connection.RemoteIpAddress, request);

                if (response == null)
                    return StatusCode(StatusCodes.Status400BadRequest);

                return StatusCode(StatusCodes.Status200OK, response);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(ForumController), nameof(BoardUpdate));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpDelete]
        [Route("Board/{key:Guid}")]
        public async Task<ActionResult> BoardDelete([FromRoute] Guid key)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                await _service.BoardDelete(clientKey, HttpContext.Connection.RemoteIpAddress, key);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(ForumController), nameof(BoardDelete));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpGet]
        [Route("Board")]
        public async Task<ActionResult<IEnumerable<BoardListDto>>> BoardList()
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                IEnumerable<BoardListDto> response = await _service.BoardList(clientKey);

                if (response == null)
                    return StatusCode(StatusCodes.Status400BadRequest);

                return StatusCode(StatusCodes.Status200OK, response);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(ForumController), nameof(BoardList));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpGet]
        [Route("Board/{key:Guid}/Post")]
        public async Task<ActionResult<IEnumerable<PostDto>>> BoardPostList([FromRoute] Guid key)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                await _service.BoardPostList(clientKey, key);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(ForumController), nameof(BoardPostList));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpPost]
        [Route("Post")]
        public async Task<ActionResult<PostDto>> PostCreate([FromRoute] Guid key)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                await _service.BoardDelete(clientKey, HttpContext.Connection.RemoteIpAddress, key);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(ForumController), nameof(PostCreate));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpGet]
        [Route("Post/{key:Guid}")]
        public async Task<ActionResult<PostDto>> PostRead([FromRoute] Guid key)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                await _service.BoardDelete(clientKey, HttpContext.Connection.RemoteIpAddress, key);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(ForumController), nameof(PostRead));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpPatch]
        [Route("Post/{key:Guid}")]
        public async Task<ActionResult<PostDto>> PostUpdate([FromRoute] Guid key)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                await _service.BoardDelete(clientKey, HttpContext.Connection.RemoteIpAddress, key);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(ForumController), nameof(PostUpdate));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpDelete]
        [Route("Post/{key:Guid}")]
        public async Task<ActionResult<PostDto>> PostDelete([FromRoute] Guid key)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                await _service.BoardDelete(clientKey, HttpContext.Connection.RemoteIpAddress, key);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(ForumController), nameof(PostDelete));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpPost]
        [Route("Post/{key:Guid}/Reaction")]
        public async Task<ActionResult<IEnumerable<CommentDto>>> PostReactionCreate([FromRoute] Guid key)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                await _service.BoardDelete(clientKey, HttpContext.Connection.RemoteIpAddress, key);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(ForumController), nameof(PostReactionCreate));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpPost]
        [Route("Post/{key:Guid}/Attachment")]
        public async Task<ActionResult<IEnumerable<CommentDto>>> PostAttachmentCreate([FromRoute] Guid key)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                await _service.BoardDelete(clientKey, HttpContext.Connection.RemoteIpAddress, key);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(ForumController), nameof(PostAttachmentCreate));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpDelete]
        [Route("Post/{postKey:Guid}/Attachment/{attachmentKey:Guid}")]
        public async Task<ActionResult<IEnumerable<CommentDto>>> PostAttachmentDelete([FromRoute] Guid key)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                await _service.BoardDelete(clientKey, HttpContext.Connection.RemoteIpAddress, key);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(ForumController), nameof(PostAttachmentDelete));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpGet]
        [Route("Post/{key:Guid}/Comment")]
        public async Task<ActionResult<IEnumerable<PostDto>>> PostCommentList([FromRoute] Guid key)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                await _service.BoardDelete(clientKey, HttpContext.Connection.RemoteIpAddress, key);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(ForumController), nameof(PostCommentList));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpGet]
        [Route("Comment/{key:Guid}/Comment")]
        public async Task<ActionResult<IEnumerable<PostDto>>> CommentList([FromRoute] Guid key)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                await _service.BoardDelete(clientKey, HttpContext.Connection.RemoteIpAddress, key);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(ForumController), nameof(CommentList));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpPost]
        [Route("Comment/{key:Guid}")]
        public async Task<ActionResult<IEnumerable<CommentDto>>> CommentCreate([FromRoute] Guid key)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                await _service.BoardDelete(clientKey, HttpContext.Connection.RemoteIpAddress, key);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(ForumController), nameof(CommentCreate));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpGet]
        [Route("Comment/{key:Guid}")]
        public async Task<ActionResult<IEnumerable<CommentDto>>> CommentRead([FromRoute] Guid key)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                await _service.BoardDelete(clientKey, HttpContext.Connection.RemoteIpAddress, key);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(ForumController), nameof(CommentRead));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpPatch]
        [Route("Comment/{key:Guid}")]
        public async Task<ActionResult<IEnumerable<CommentDto>>> CommentUpdate([FromRoute] Guid key)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                await _service.BoardDelete(clientKey, HttpContext.Connection.RemoteIpAddress, key);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(ForumController), nameof(CommentUpdate));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpDelete]
        [Route("Comment/{key:Guid}")]
        public async Task<ActionResult<IEnumerable<CommentDto>>> CommentDelete([FromRoute] Guid key)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                await _service.BoardDelete(clientKey, HttpContext.Connection.RemoteIpAddress, key);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(ForumController), nameof(CommentDelete));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpPost]
        [Route("Comment/{key:Guid}/Reaction")]
        public async Task<ActionResult<IEnumerable<CommentDto>>> CommentReaction([FromRoute] Guid key)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                await _service.BoardDelete(clientKey, HttpContext.Connection.RemoteIpAddress, key);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(ForumController), nameof(CommentReaction));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }


        [HttpPost]
        [Route("Comment/{key:Guid}/Attachment")]
        public async Task<ActionResult<IEnumerable<CommentDto>>> CommentAttachmentCreate([FromRoute] Guid key)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                await _service.BoardDelete(clientKey, HttpContext.Connection.RemoteIpAddress, key);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(ForumController), nameof(CommentAttachmentCreate));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpDelete]
        [Route("Comment/{commentKey:Guid}/Attachment/{attachmentKey:Guid}")]
        public async Task<ActionResult<IEnumerable<CommentDto>>> CommentAttachmentDelete([FromRoute] Guid attachmentKey)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                await _service.BoardDelete(clientKey, HttpContext.Connection.RemoteIpAddress, attachmentKey);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(ForumController), nameof(CommentAttachmentDelete));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

    }
}
