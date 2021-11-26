using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NoPony.CarClub.Api.Features.Board.Dto;
using NoPony.CarClub.Api.Utility.PagedList;
using Serilog;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.Board
{
    [ApiController]
    [Route("[controller]")]
    public class BoardController : ControllerBase
    {
        private readonly ILogger _log;
        private readonly IBoardService _service;

        public BoardController(ILogger log, IBoardService userService)
        {
            _log = log ?? throw new ArgumentNullException(nameof(log));

            _service = userService ?? throw new ArgumentNullException(nameof(userService));
        }

        [HttpPost]
        public async Task<ActionResult<BoardDto>> BoardCreate([FromBody] BoardCreateRequestDto request)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier").Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                await _service.BoardCreate(clientKey, HttpContext.Connection.RemoteIpAddress, request);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(BoardController), nameof(BoardCreate));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpGet]
        [Route("{key:Guid}")]
        public async Task<ActionResult<BoardDto>> BoardRead([FromRoute] Guid key)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier").Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                var response = await _service.BoardRead(clientKey, key);

                if (response == null)
                    return StatusCode(StatusCodes.Status400BadRequest);

                return StatusCode(StatusCodes.Status200OK, response);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(BoardController), nameof(BoardRead));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpPatch]
        [Route("{key:Guid}")]
        public async Task<ActionResult<BoardDto>> BoardUpdate([FromRoute] Guid key, [FromBody] BoardDto request)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier").Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);


                return StatusCode(StatusCodes.Status200OK, await _service.BoardUpdate(clientKey, HttpContext.Connection.RemoteIpAddress, request));
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(BoardController), nameof(BoardUpdate));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpDelete]
        [Route("{key:Guid}")]
        public async Task<ActionResult> BoardDelete([FromRoute] Guid key)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier").Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                await _service.BoardDelete(clientKey, HttpContext.Connection.RemoteIpAddress, key);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(BoardController), nameof(BoardDelete));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpGet]
        [Route("Search")]
        public async Task<ActionResult<PageResponseDto<BoardSearchDto>>> BoardSearch([FromQuery] PageRequestDto request)
        {
            try
            {
                if (!Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier").Value, out Guid clientKey))
                    return StatusCode(StatusCodes.Status400BadRequest);

                PageResponseDto<BoardSearchDto> response = await _service.BoardSearch(clientKey, request);

                if (response == null)
                    return StatusCode(StatusCodes.Status400BadRequest);

                return StatusCode(StatusCodes.Status200OK, response);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(BoardController), nameof(BoardSearch));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

    }
}
