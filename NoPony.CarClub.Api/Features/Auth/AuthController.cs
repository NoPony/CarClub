using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NoPony.CarClub.Api.Exceptions;
using NoPony.CarClub.Api.Features.Auth.Dto;
using NoPony.CarClub.Api.Utility;
using Serilog;
using System;
using System.Net;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.Auth
{
    [ApiController]
    [Route("[controller]")]
    public class AuthController : CustomControllerBase
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
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> Register([FromBody] AuthRegisterRequestDto request)
        {
            try
            {
                IPAddress ip = GetUserIp();

                await _authService.Register(ip, request);

                return StatusCode(StatusCodes.Status200OK);
            }

            catch (InvalidKeyException)
            {
                return StatusCode(StatusCodes.Status400BadRequest);
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
        public async Task<IActionResult> VerifyEmail([FromRoute] Guid key)
        {
            try
            {
                IPAddress ip = GetUserIp();

                await _authService.Verify(ip, key);

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
        public async Task<IActionResult> Login([FromBody] AuthLoginRequestDto Request)
        {
            try
            {
                IPAddress ip = GetUserIp();

                Model.AuthLoginResponseModel responseModel = await _authService.Login(ip, Request);

                return StatusCode(StatusCodes.Status200OK, new AuthLoginResponseDto
                {
                    RefreshToken = responseModel.RefreshToken,
                    AccessToken = responseModel.AccessToken,
                });
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(AuthController), nameof(Login));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpGet]
        [Route("Refresh")]
        public async Task<IActionResult> Refresh()
        {
            try
            {
                Guid clientKey = GetUserKey();
                IPAddress clientIp = GetUserIp();

                Model.AuthLoginResponseModel responseModel = await _authService.Refresh(clientKey, clientIp);

                return StatusCode(StatusCodes.Status200OK, new AuthLoginResponseDto
                {
                    RefreshToken = responseModel.RefreshToken,
                    AccessToken = responseModel.AccessToken,
                });
            }

            catch (Exception ex)
            {
                _log.Error(ex, "Unhandled exception in '{controller}'.'{method}'", nameof(AuthController), nameof(Refresh));

                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }
        // reset password
        // Update?  Shouldn't need it...
    }
}
