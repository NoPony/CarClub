using System.Collections.Generic;

namespace NoPony.CarClub.Api.Features.Auth.Dto
{
    public class AuthLoginResponseDto
    {
        public string RefreshToken { get; set; }
        public string AccessToken { get; set; }
    }
}
