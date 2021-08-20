using System.Collections.Generic;

namespace NoPony.CarClub.Api.Features.User.Record
{
    public class AccountDetailsRecord
    {
        public string FullName { get; set; }
        public string PreferredName { get; set; }

        public IEnumerable<string> Permissions { get; set; }
    }
}
