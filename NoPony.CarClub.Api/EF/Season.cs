﻿using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Season
    {
        public Season()
        {
            SeasonAttachment = new HashSet<SeasonAttachment>();
            SeasonEvent = new HashSet<SeasonEvent>();
        }

        public long Id { get; set; }
        public long StatusId { get; set; }
        public string Title { get; set; }
        public string Note { get; set; }
        public DateTimeOffset? StartUtc { get; set; }
        public DateTimeOffset? EndUtc { get; set; }
        public byte[] CreatedIp { get; set; }
        public DateTimeOffset CreatedUtc { get; set; }
        public long CreatedUserId { get; set; }
        public bool Updated { get; set; }
        public byte[] UpdatedIp { get; set; }
        public DateTimeOffset? UpdatedUtc { get; set; }
        public long? UpdatedUserId { get; set; }
        public bool Deleted { get; set; }
        public byte[] DeletedIp { get; set; }
        public DateTimeOffset? DeletedUtc { get; set; }
        public long? DeletedUserId { get; set; }

        public virtual SeasonStatus Status { get; set; }
        public virtual ICollection<SeasonAttachment> SeasonAttachment { get; set; }
        public virtual ICollection<SeasonEvent> SeasonEvent { get; set; }
    }
}
