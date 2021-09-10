using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NoPony.CarClub.Api.Features.Auth.Dto;
using System;

namespace NoPony.CarClub.Api.Features.User
{
    [ApiController]
    [Route("[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly IAuthService _userService;

        public AuthController(IAuthService userService)
        {
            _userService = userService ?? throw new ArgumentNullException(nameof(userService));
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("Register")]
        public ActionResult<AuthLoginResponseDto> Register(AuthRegisterRequestDto request)
        {
            if (request == null)
                return StatusCode(StatusCodes.Status400BadRequest);

            try
            {
                AuthRegisterResponseDto response = _userService.Register(HttpContext.Connection.RemoteIpAddress?.ToString(), request);
                
                if (response == null)
                    return StatusCode(StatusCodes.Status400BadRequest);

                return StatusCode(StatusCodes.Status200OK, response);
            }

            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("VerifyEmail")]
        public ActionResult<AuthLoginResponseDto> VerifyEmail(AuthVerifyRequestDto request)
        {
            if (request == null)
                return StatusCode(StatusCodes.Status400BadRequest);

            try
            {
                AuthVerifyResponseDto response = _userService.Verify(HttpContext.Connection.RemoteIpAddress?.ToString(), request);

                if (response == null)
                    return StatusCode(StatusCodes.Status400BadRequest);

                return StatusCode(StatusCodes.Status200OK, response);
            }

            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex);
            }
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("Login")]
        public ActionResult<AuthLoginResponseDto> Login(AuthLoginRequestDto Request)
        {
            if (Request == null)
                return StatusCode(StatusCodes.Status400BadRequest);

            try
            {
                AuthLoginResponseDto r = _userService.Login(HttpContext.Connection.RemoteIpAddress?.ToString(), Request);

                if (r == null)
                    return StatusCode(StatusCodes.Status401Unauthorized);

                return StatusCode(StatusCodes.Status200OK, r);
            }

            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        // Update
    }
}
