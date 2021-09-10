using System.ComponentModel.DataAnnotations;

namespace NoPony.CarClub.Api.Features.Auth.Dto
{
    public class AuthRegisterRequestDto
    {
        [Required]
        [StringLength(128)]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [StringLength(128, MinimumLength = 8)]
        public string Password { get; set; }

        [Required]
        [StringLength(128)]
        [Compare(nameof(Password))]
        public string Verify { get; set; }
    }
}
