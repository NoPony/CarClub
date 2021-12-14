using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NoPony.CarClub.Api.Exceptions;
using NoPony.CarClub.Api.Features.Post.Dto;
using NoPony.CarClub.Api.Utility;
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
    public class PostController : CustomControllerBase
    {
        private readonly ILogger _log;
        private readonly IPostService _service;

        public PostController(ILogger log, IPostService postService)
        {
            _log = log ?? throw new ArgumentNullException(nameof(log));
            _service = postService ?? throw new ArgumentNullException(nameof(postService));
        }

        [HttpPost]
        public async Task<ActionResult<PostDto>> PostCreate([FromBody] PostDto request)
        {
            try
            {
                await _service.PostCreate(GetUserKey(), GetUserIp(), request);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (InvalidRequestException)
            {
                return StatusCode(StatusCodes.Status400BadRequest);
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
                return StatusCode(StatusCodes.Status200OK, await _service.PostRead(GetUserKey(), key));
            }

            catch (InvalidRequestException)
            {
                return StatusCode(StatusCodes.Status400BadRequest);
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
                await _service.PostUpdate(GetUserKey(), GetUserIp(), request);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (InvalidRequestException)
            {
                return StatusCode(StatusCodes.Status400BadRequest);
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
                await _service.PostDelete(GetUserKey(), GetUserIp(), key);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (InvalidRequestException)
            {
                return StatusCode(StatusCodes.Status400BadRequest);
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
                return base.StatusCode(StatusCodes.Status200OK, await _service.PostSearch(GetUserKey(), request));
            }

            catch (InvalidRequestException)
            {
                return StatusCode(StatusCodes.Status400BadRequest);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(PostController), nameof(PostSearch));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }
    }
}
