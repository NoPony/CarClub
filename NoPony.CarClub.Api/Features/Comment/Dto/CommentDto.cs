﻿using System;

namespace NoPony.CarClub.Api.Features.Comment.Dto
{
    public class CommentDto
    {
        public Guid? Key { get; set; }
        public Guid? ParentKey { get; set; }
        
        public string Title { get; set; }
        public string Content { get; set; }

        public string CreatedIp { get; set; }
        public DateTimeOffset? CreatedUtc { get; set; }
        public string CreatedBy { get; set; }

        public bool? Updated { get; set; }
        public string UpdatedIp { get; set; }
        public DateTimeOffset? UpdatedUtc { get; set; }
        public string UpdatedBy { get; set; }

        public bool? Deleted { get; set; }
        public string DeletedIp { get; set; }
        public DateTimeOffset? DeletedUtc { get; set; }
        public string DeletedBy { get; set; }
    }
}
