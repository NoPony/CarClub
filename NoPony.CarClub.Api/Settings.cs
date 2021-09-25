namespace NoPony.CarClub.Api
{
    public class Settings
    {
        public string JwtIssuer { get; set; }
        public string JwtAudience { get; set; }
        public string JwtKey { get; set; }

        public string SendgridKey { get; set; }
        public string FromEmail { get; set; }
        public string FromName { get; set; }
    }
}
