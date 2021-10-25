using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Role
    {
        public Role()
        {
            Boardrolepermission = new HashSet<Boardrolepermission>();
            Rolepermission = new HashSet<Rolepermission>();
            Userrole = new HashSet<Userrole>();
        }

        public long Id { get; set; }
        public string Code { get; set; }
        public string Title { get; set; }
        public string Note { get; set; }
        public byte[] CreatedIp { get; set; }
        public DateTime CreatedUtc { get; set; }
        public long CreatedUserId { get; set; }
        public byte[] UpdatedIp { get; set; }
        public DateTime? UpdatedUtc { get; set; }
        public long? UpdatedUserId { get; set; }
        public bool Deleted { get; set; }
        public byte[] DeletedIp { get; set; }
        public DateTime? DeletedUtc { get; set; }
        public long? DeletedUserId { get; set; }

        public virtual User CreatedUser { get; set; }
        public virtual User DeletedUser { get; set; }
        public virtual User UpdatedUser { get; set; }
        public virtual ICollection<Boardrolepermission> Boardrolepermission { get; set; }
        public virtual ICollection<Rolepermission> Rolepermission { get; set; }
        public virtual ICollection<Userrole> Userrole { get; set; }
    }
}
