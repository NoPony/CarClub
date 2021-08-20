using System;

namespace NoPony.CarClub.Api.Features.Auth.Dto
{
    public class AuthEmailVerifyRequestDto
    {
        public Guid? Key { get; set; }
    }
}
