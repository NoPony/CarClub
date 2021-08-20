using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Heat
    {
        public Heat()
        {
            Grid = new HashSet<Grid>();
            HeatAttachment = new HashSet<HeatAttachment>();
            HeatReaction = new HashSet<HeatReaction>();
            Lap = new HashSet<Lap>();
        }

        public long Id { get; set; }
        public long EventId { get; set; }
        public long? StatusId { get; set; }
        public string Code { get; set; }
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
        public bool? DeletedBy { get; set; }

        public virtual Event Event { get; set; }
        public virtual ICollection<Grid> Grid { get; set; }
        public virtual ICollection<HeatAttachment> HeatAttachment { get; set; }
        public virtual ICollection<HeatReaction> HeatReaction { get; set; }
        public virtual ICollection<Lap> Lap { get; set; }
    }
}
