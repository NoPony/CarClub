using System;

namespace NoPony.CarClub.Api.Features.User.Record
{
    public class AccountRegisterRequestRecord
    {
        public Guid Key { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

        public string FullName { get; set; }
        public string PreferredName { get; set; }

        public string Phone { get; set; }
        public string Mobile { get; set; }

        public string Street { get; set; }
        public string Suburb { get; set; }
        public string Postcode { get; set; }
        public string State { get; set; }
    }
}
