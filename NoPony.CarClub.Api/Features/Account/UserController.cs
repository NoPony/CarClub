using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NoPony.CarClub.Api.Features.User.Dto;
using System;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.User
{
    [ApiController]
    [Route("[controller]")]
    public class UserController : ControllerBase
    {
        private readonly IAccountService _userService;

        public UserController(IAccountService userService)
        {
            _userService = userService ?? throw new ArgumentNullException(nameof(userService));
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("Register")]
        public async Task<ActionResult<AccountLoginResponseDto>> Register(AccountRegisterRequestDto request)
        {
            if (request == null)
                return StatusCode(StatusCodes.Status400BadRequest);

            try
            {
                TryResult<AccountLoginResponseDto> r = await _userService.TryRegister(request);

                if (!r.Outcome)
                    return StatusCode(StatusCodes.Status400BadRequest);

                return StatusCode(StatusCodes.Status200OK, r.Result);
            }

            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("VerifyEmail")]
        public async Task<ActionResult<AccountLoginResponseDto>> VerifyEmail(AccountEmailVerifyRequestDto request)
        {
            if (request == null)
                return StatusCode(StatusCodes.Status400BadRequest);

            try
            {
                TryResult<AccountLoginResponseDto> r = await _userService.TryVerifyEmail(request);

                if (!r.Outcome)
                    return StatusCode(StatusCodes.Status400BadRequest);

                return StatusCode(StatusCodes.Status200OK, r.Result);
            }

            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex);
            }
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("Login")]
        public async Task<ActionResult<AccountLoginResponseDto>> Login(AccountLoginRequestDto Request)
        {
            if (Request == null)
                return StatusCode(StatusCodes.Status400BadRequest);

            try
            {
                TryResult<AccountLoginResponseDto> r = await _userService.TryLogin(Request);

                if (!r.Outcome)
                    return StatusCode(StatusCodes.Status401Unauthorized);

                return StatusCode(StatusCodes.Status200OK, r.Result);
            }

            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        // Update
    }
}
