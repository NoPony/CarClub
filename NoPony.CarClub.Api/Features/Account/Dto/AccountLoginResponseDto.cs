using System.Collections.Generic;

namespace NoPony.CarClub.Api.Features.User.Dto
{
    public class AccountLoginResponseDto
    {
        public string Token { get; set; }

        public string FullName { get; set; }
        public string PreferredName { get; set; }

        public IEnumerable<string> Permissions { get; set; }
    }
}
