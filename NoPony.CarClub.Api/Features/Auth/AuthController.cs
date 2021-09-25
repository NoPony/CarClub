using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NoPony.CarClub.Api.Features.Auth.Dto;
using Serilog;
using System;

namespace NoPony.CarClub.Api.Features.Auth
{
    [ApiController]
    [Route("[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly ILogger _log;
        private readonly IAuthService _authService;

        public AuthController(ILogger log, IAuthService userService)
        {
            _log = log ?? throw new ArgumentNullException(nameof(log));

            _authService = userService ?? throw new ArgumentNullException(nameof(userService));
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("Register")]
        public ActionResult Register([FromBody] AuthRegisterRequestDto request)
        {
            if (request == null)
            {
                return StatusCode(StatusCodes.Status400BadRequest);
            }

            try
            {
                if (!_authService.TryRegister(HttpContext.Connection.RemoteIpAddress, request))
                {
                    return StatusCode(StatusCodes.Status409Conflict);
                }

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(AuthController), nameof(Register));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("EmailVerify/{key:Guid}")]
        public ActionResult VerifyEmail([FromRoute] Guid key)
        {
            try
            {
                if (!_authService.TryVerify(HttpContext.Connection.RemoteIpAddress, key))
                {
                    return StatusCode(StatusCodes.Status400BadRequest);
                }

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(AuthController), nameof(VerifyEmail));

                return StatusCode(StatusCodes.Status500InternalServerError, ex);
            }
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("Login")]
        public ActionResult<AuthLoginResponseDto> Login([FromBody] AuthLoginRequestDto Request)
        {
            if (Request == null)
            {
                return StatusCode(StatusCodes.Status400BadRequest);
            }

            try
            {
                if (!_authService.TryLogin(HttpContext.Connection.RemoteIpAddress, Request, out AuthLoginResponseDto response))
                {
                    return StatusCode(StatusCodes.Status400BadRequest);
                }

                return StatusCode(StatusCodes.Status200OK, response);
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(AuthController), nameof(Login));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        // reset password
        // Update?  Shouldn't need it...
    }
}
