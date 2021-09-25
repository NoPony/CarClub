using System.Collections.Generic;

namespace NoPony.CarClub.Api.Features.Auth.Dto
{
    public class AuthLoginResponseDto
    {
        public string Name { get; set; }
        public string Token { get; set; }

        public IEnumerable<string> Permissions { get; set; }
    }
}
