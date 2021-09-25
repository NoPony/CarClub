using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NoPony.CarClub.Api.Features.Forum.Dto;
using Serilog;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.Forum
{
    [ApiController]
    [Route("[controller]")]
    public class ForumController : ControllerBase
    {
        private readonly ILogger _log;
        private readonly IForumService _forumService;

        public ForumController(ILogger log, IForumService userService)
        {
            _log = log ?? throw new ArgumentNullException(nameof(log));

            _forumService = userService ?? throw new ArgumentNullException(nameof(userService));
        }

        [HttpPost]
        [Route("Board")]
        public async Task<ActionResult<IEnumerable<BoardListDto>>> BoardList()
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status401Unauthorized);

                IEnumerable<BoardListDto> response = await _forumService.BoardList(clientKey);

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

        [HttpPost]
        [Route("Board")]
        public async Task<ActionResult<BoardListDto>> BoardCreate([FromBody] BoardDto request)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status401Unauthorized);

                var response = await _forumService.BoardCreate(clientKey, HttpContext.Connection.RemoteIpAddress, request);

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
        [Route("Board/{key:Guid}")]
        public async Task<ActionResult<BoardDto>> BoardRead([FromRoute] Guid key)
        {
            return StatusCode(StatusCodes.Status200OK, "Noice");
        }

        [HttpPatch]
        [Route("Board/{key:Guid}")]
        public async Task<ActionResult<BoardDto>> BoardUpdate([FromRoute] Guid key)
        {
            return StatusCode(StatusCodes.Status200OK, "Noice");
        }

        [HttpDelete]
        [Route("Board/{key:Guid}")]
        public async Task<ActionResult> BoardDelete([FromRoute] Guid key)
        {
            return StatusCode(StatusCodes.Status200OK, "Noice");
        }

        [HttpGet]
        [Route("Post/{key:Guid}")]
        public ActionResult<IEnumerable<CommentDto>> Post([FromRoute] Guid key)
        {
            return StatusCode(StatusCodes.Status200OK, "Noice");
        }

        [HttpGet]
        [Route("Comment/{key:Guid}")]
        public ActionResult<IEnumerable<CommentDto>> Comment([FromRoute] Guid key)
        {
            return StatusCode(StatusCodes.Status200OK, "Noice");
        }
    }
}
