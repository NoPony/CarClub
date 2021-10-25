﻿using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Survey
    {
        public Survey()
        {
            Post = new HashSet<Post>();
        }

        public long Id { get; set; }
        public long StatusId { get; set; }
        public string Title { get; set; }
        public string Note { get; set; }
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

        public virtual User CreatedUser { get; set; }
        public virtual User DeletedUser { get; set; }
        public virtual User UpdatedUser { get; set; }
        public virtual ICollection<Post> Post { get; set; }
    }
}
