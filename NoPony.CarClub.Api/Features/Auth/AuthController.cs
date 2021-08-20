using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NoPony.CarClub.Api.Features.Auth.Dto;
using SendGrid;
using SendGrid.Helpers.Mail;
using System;
using System.Threading.Tasks;

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
        public async Task<ActionResult<AuthLoginResponseDto>> Register(AuthRegisterRequestDto request)
        {
            if (request == null)
                return StatusCode(StatusCodes.Status400BadRequest);

            try
            {
                if (await _userService.Register(request) == null)
                    return StatusCode(StatusCodes.Status400BadRequest);

                Response response = await new SendGridClient(Constants.SendingApiKey).SendEmailAsync(MailHelper.CreateSingleEmail(
                    new EmailAddress("admin@nopony.com.au", "NoPony Admin"),
                    new EmailAddress("squishbot@gmail.com", "Squishbot"),
                    "CarClub Registration",
                    "",
                    "<strong>Yes</strong>"));

                return base.StatusCode(StatusCodes.Status200OK, await _userService.Register(request));
            }

            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("VerifyEmail")]
        public async Task<ActionResult<AuthLoginResponseDto>> VerifyEmail(AuthEmailVerifyRequestDto request)
        {
            if (request == null)
                return StatusCode(StatusCodes.Status400BadRequest);

            try
            {
                AuthEmailVerifyResponseDto response = await _userService.EmailVerify(request);

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
        public async Task<ActionResult<AuthLoginResponseDto>> Login(AuthLoginRequestDto Request)
        {
            if (Request == null)
                return StatusCode(StatusCodes.Status400BadRequest);

            try
            {
                AuthLoginResponseDto r = await _userService.Login(Request);

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
