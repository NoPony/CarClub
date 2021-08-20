namespace NoPony.CarClub.Api.Features.Auth.Dto
{
    public class AuthRegisterRequestDto
    {
        public string Login { get; set; }
        public string Password { get; set; }
        public string PasswordConfirm { get; set; }
    }
}
