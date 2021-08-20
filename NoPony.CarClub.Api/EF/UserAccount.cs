using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class UserAccount
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public string Debit { get; set; }
        public string Credit { get; set; }
        public string CreatedUtc { get; set; }
        public string CreatedUserId { get; set; }
        public string UpdatedUtc { get; set; }
        public string UpdatedUserId { get; set; }
    }
}
