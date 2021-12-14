using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NoPony.CarClub.Api.Exceptions;
using NoPony.CarClub.Api.Features.Board.Dto;
using NoPony.CarClub.Api.Utility;
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
    public class BoardController : CustomControllerBase
    {
        private readonly ILogger _log;
        private readonly IBoardService _service;

        public BoardController(ILogger log, IBoardService boardService)
        {
            _log = log ?? throw new ArgumentNullException(nameof(log));
            _service = boardService ?? throw new ArgumentNullException(nameof(boardService));
        }

        [HttpPost]
        public async Task<ActionResult<BoardDto>> BoardCreate([FromBody] BoardCreateRequestDto request)
        {
            try
            {
                await _service.BoardCreate(GetUserKey(), GetUserIp(), request);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (InvalidRequestException)
            {
                return StatusCode(StatusCodes.Status400BadRequest);
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
                return base.StatusCode(StatusCodes.Status200OK, await _service.BoardRead(GetUserKey(), key));
            }

            catch (InvalidRequestException)
            {
                return StatusCode(StatusCodes.Status400BadRequest);
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
                return StatusCode(StatusCodes.Status200OK, await _service.BoardUpdate(GetUserKey(), GetUserIp(), request));
            }

            catch (InvalidRequestException)
            {
                return StatusCode(StatusCodes.Status400BadRequest);
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
                await _service.BoardDelete(GetUserKey(), GetUserIp(), key);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (InvalidRequestException)
            {
                return StatusCode(StatusCodes.Status400BadRequest);
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
                PageResponseDto<BoardSearchDto> response = await _service.BoardSearch(GetUserKey(), request);

                return StatusCode(StatusCodes.Status200OK, response);
            }

            catch (InvalidRequestException)
            {
                return StatusCode(StatusCodes.Status400BadRequest);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(BoardController), nameof(BoardSearch));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }
    }
}
