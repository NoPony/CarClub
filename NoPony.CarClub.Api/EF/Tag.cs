﻿using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Tag
    {
        public long Id { get; set; }
        public long CreatorId { get; set; }
        public long OwnerId { get; set; }
        public long StatusId { get; set; }
        public string Title { get; set; }
        public string Note { get; set; }
        public string CreatedIp { get; set; }
        public DateTimeOffset CreatedUtc { get; set; }
        public string CreatedBy { get; set; }
        public bool Updated { get; set; }
        public string UpdatedIp { get; set; }
        public DateTimeOffset? UpdatedUtc { get; set; }
        public string UpdatedBy { get; set; }
        public bool Deleted { get; set; }
        public string DeletedIp { get; set; }
        public DateTimeOffset? DeletedUtc { get; set; }
        public string DeletedBy { get; set; }

        public virtual Member Creator { get; set; }
        public virtual Member Owner { get; set; }
        public virtual TagStatus Status { get; set; }
    }
}
