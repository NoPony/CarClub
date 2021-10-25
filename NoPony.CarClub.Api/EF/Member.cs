using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Member
    {
        public Member()
        {
            Commentreaction = new HashSet<Commentreaction>();
        }

        public long Id { get; set; }
        public string UserKey { get; set; }
        public string FullName { get; set; }
        public string PreferredName { get; set; }
        public string Phone { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
        public string PrimaryAddressStreet1 { get; set; }
        public string PrimaryAddressStreet2 { get; set; }
        public string PrimaryAddressSuburb { get; set; }
        public string PrimaryAddressPostcode { get; set; }
        public string PrimaryAddressState { get; set; }
        public decimal? PrimaryAddressLatitude { get; set; }
        public decimal? PrimaryAddressLongitude { get; set; }
        public byte[] CreatedIp { get; set; }
        public DateTime CreatedUtc { get; set; }
        public long CreatedUserId { get; set; }
        public bool Updated { get; set; }
        public byte[] UpdatedIp { get; set; }
        public DateTime? UpdatedUtc { get; set; }
        public long? UpdatedUserId { get; set; }
        public bool Deleted { get; set; }
        public byte[] DeletedIp { get; set; }
        public DateTime? DeletedUtc { get; set; }
        public long? DeletedUserId { get; set; }

        public virtual ICollection<Commentreaction> Commentreaction { get; set; }
    }
}
