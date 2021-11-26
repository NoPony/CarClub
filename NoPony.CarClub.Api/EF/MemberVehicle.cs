﻿using System;
using System.Collections.Generic;
using System.Net;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class MemberVehicle
    {
        public long Id { get; set; }
        public long MemberId { get; set; }
        public long VehicleId { get; set; }
        public IPAddress CreatedIp { get; set; }
        public DateTime CreatedUtc { get; set; }
        public long CreatedUserId { get; set; }
        public bool Updated { get; set; }
        public IPAddress UpdatedIp { get; set; }
        public DateTime? UpdatedUtc { get; set; }
        public long? UpdatedUserId { get; set; }
        public bool Deleted { get; set; }
        public IPAddress DeletedIp { get; set; }
        public DateTime? DeletedUtc { get; set; }
        public long? DeletedUserId { get; set; }
    }
}
