using System;
using System.Collections.Generic;
using System.Net;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Board
    {
        public Board()
        {
            BoardRolePermission = new HashSet<BoardRolePermission>();
            BoardTag = new HashSet<BoardTag>();
            Poll = new HashSet<Poll>();
            Post = new HashSet<Post>();
            Survey = new HashSet<Survey>();
        }

        public long Id { get; set; }
        public Guid Key { get; set; }
        public int Ordinal { get; set; }
        public string Title { get; set; }
        public string Note { get; set; }
        public bool Pinned { get; set; }
        public IPAddress PinnedIp { get; set; }
        public DateTime? PinnedUtc { get; set; }
        public long? PinnedUserId { get; set; }
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
        public virtual User PinnedUser { get; set; }
        public virtual User UpdatedUser { get; set; }
        public virtual ICollection<BoardRolePermission> BoardRolePermission { get; set; }
        public virtual ICollection<BoardTag> BoardTag { get; set; }
        public virtual ICollection<Poll> Poll { get; set; }
        public virtual ICollection<Post> Post { get; set; }
        public virtual ICollection<Survey> Survey { get; set; }
    }
}
