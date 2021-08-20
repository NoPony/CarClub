using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class ForumBoardRole
    {
        public long Id { get; set; }
        public long ForumBoardId { get; set; }
        public long RoleId { get; set; }
        public bool Create { get; set; }
        public bool Read { get; set; }
        public bool Delete { get; set; }
        public bool Ban { get; set; }
        public bool ShaddowBan { get; set; }
        public DateTimeOffset CreatedUtc { get; set; }
        public long CreatedUserId { get; set; }
        public DateTimeOffset? UpdatedUtc { get; set; }
        public long? UpdatedUserId { get; set; }
    }
}
