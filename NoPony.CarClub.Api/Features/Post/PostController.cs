using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NoPony.CarClub.Api.Features.Post.Dto;
using NoPony.CarClub.Api.Utility.PagedList;
using Serilog;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.Post
{
    [ApiController]
    [Route("[controller]")]
    public class PostController : ControllerBase
    {
        private readonly ILogger _log;
        private readonly IPostService _service;

        public PostController(ILogger log, IPostService userService)
        {
            _log = log ?? throw new ArgumentNullException(nameof(log));

            _service = userService ?? throw new ArgumentNullException(nameof(userService));
        }

        [HttpPost]
        public async Task<ActionResult<PostDto>> PostCreate([FromBody] PostDto request)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                var response = await _service.PostCreate(clientKey, HttpContext.Connection.RemoteIpAddress, request);

                if (response == null)
                    return StatusCode(StatusCodes.Status400BadRequest);

                return StatusCode(StatusCodes.Status200OK, response);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(PostController), nameof(PostCreate));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpGet]
        [Route("{key:Guid}")]
        public async Task<ActionResult<PostDto>> PostRead([FromRoute] Guid key)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                var response = await _service.PostRead(clientKey, key);

                if (response == null)
                    return StatusCode(StatusCodes.Status400BadRequest);

                return StatusCode(StatusCodes.Status200OK, response);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(PostController), nameof(PostRead));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpPatch]
        [Route("{key:Guid}")]
        public async Task<ActionResult<PostDto>> PostUpdate([FromRoute] Guid key, [FromBody] PostDto request)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                var response = await _service.PostUpdate(clientKey, HttpContext.Connection.RemoteIpAddress, request);

                if (response == null)
                    return StatusCode(StatusCodes.Status400BadRequest);

                return StatusCode(StatusCodes.Status200OK, response);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(PostController), nameof(PostUpdate));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpDelete]
        [Route("{key:Guid}")]
        public async Task<ActionResult> PostDelete([FromRoute] Guid key)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub).Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                await _service.PostDelete(clientKey, HttpContext.Connection.RemoteIpAddress, key);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(PostController), nameof(PostDelete));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpGet]
        [Route("Search")]
        public async Task<ActionResult<PageResponseDto<PostSearchDto>>> PostSearch([FromQuery] PageRequestDto request)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier").Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                PageResponseDto<PostSearchDto> response = await _service.PostSearch(clientKey, request);

                if (response == null)
                    return StatusCode(StatusCodes.Status400BadRequest);

                return StatusCode(StatusCodes.Status200OK, response);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(PostController), nameof(PostSearch));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }
    }
}
