﻿using System;
using System.Collections.Generic;
using System.Net;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Role
    {
        public Role()
        {
            BoardRolePermission = new HashSet<BoardRolePermission>();
            RolePermissionSecurable = new HashSet<RolePermissionSecurable>();
            UserRole = new HashSet<UserRole>();
        }

        public long Id { get; set; }
        public string Code { get; set; }
        public string Title { get; set; }
        public string Note { get; set; }
        public IPAddress CreatedIp { get; set; }
        public DateTime CreatedUtc { get; set; }
        public long CreatedUserId { get; set; }
        public IPAddress UpdatedIp { get; set; }
        public DateTime? UpdatedUtc { get; set; }
        public long? UpdatedUserId { get; set; }
        public bool Deleted { get; set; }
        public IPAddress DeletedIp { get; set; }
        public DateTime? DeletedUtc { get; set; }
        public long? DeletedUserId { get; set; }

        public virtual User CreatedUser { get; set; }
        public virtual User DeletedUser { get; set; }
        public virtual User UpdatedUser { get; set; }
        public virtual ICollection<BoardRolePermission> BoardRolePermission { get; set; }
        public virtual ICollection<RolePermissionSecurable> RolePermissionSecurable { get; set; }
        public virtual ICollection<UserRole> UserRole { get; set; }
    }
}
