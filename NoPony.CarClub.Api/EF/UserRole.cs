﻿using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class UserRole
    {
        public long Id { get; set; }
        public long UserId { get; set; }
        public long RoleId { get; set; }
        public DateTimeOffset CreatedUtc { get; set; }
        public byte[] CreatedIp { get; set; }
        public long CreatedUserId { get; set; }
        public bool Updated { get; set; }
        public byte[] UpdatedIp { get; set; }
        public DateTimeOffset? UpdatedUtc { get; set; }
        public long? UpdatedUserId { get; set; }
        public bool Deleted { get; set; }
        public byte[] DeletedIp { get; set; }
        public DateTimeOffset? DeletedUtc { get; set; }
        public long? DeletedUserId { get; set; }

        public virtual User CreatedUser { get; set; }
        public virtual User DeletedUser { get; set; }
        public virtual Role Role { get; set; }
        public virtual User UpdatedUser { get; set; }
        public virtual User User { get; set; }
    }
}
