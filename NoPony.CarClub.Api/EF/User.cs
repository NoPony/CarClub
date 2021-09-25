using System;
using System.Collections.Generic;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class User
    {
        public User()
        {
            BoardCreatedUser = new HashSet<Board>();
            BoardDeletedUser = new HashSet<Board>();
            BoardRolePermissionCreatedUser = new HashSet<BoardRolePermission>();
            BoardRolePermissionDeletedUser = new HashSet<BoardRolePermission>();
            BoardRolePermissionUpdatedUser = new HashSet<BoardRolePermission>();
            BoardUpdatedUser = new HashSet<Board>();
            CommentAttachmentCreatedUser = new HashSet<CommentAttachment>();
            CommentAttachmentDeletedUser = new HashSet<CommentAttachment>();
            CommentAttachmentUpdatedUser = new HashSet<CommentAttachment>();
            CommentCreatedUser = new HashSet<Comment>();
            CommentDeletedUser = new HashSet<Comment>();
            CommentReactionCreatedUser = new HashSet<CommentReaction>();
            CommentReactionDeletedUser = new HashSet<CommentReaction>();
            CommentReactionUpdatedUser = new HashSet<CommentReaction>();
            CommentUpdatedUser = new HashSet<Comment>();
            EventAttachmentCreatedUser = new HashSet<EventAttachment>();
            EventAttachmentDeletedUser = new HashSet<EventAttachment>();
            EventAttachmentUpdatedUser = new HashSet<EventAttachment>();
            EventCreatedUser = new HashSet<Event>();
            EventDeletedUser = new HashSet<Event>();
            EventMemberRoleCreatedUser = new HashSet<EventMemberRole>();
            EventMemberRoleDeletedUser = new HashSet<EventMemberRole>();
            EventMemberRoleUpdatedUser = new HashSet<EventMemberRole>();
            EventReactionCreatedUser = new HashSet<EventReaction>();
            EventReactionDeletedUser = new HashSet<EventReaction>();
            EventReactionUpdatedUser = new HashSet<EventReaction>();
            EventStatusCreatedUser = new HashSet<EventStatus>();
            EventStatusDeletedUser = new HashSet<EventStatus>();
            EventStatusUpdatedUser = new HashSet<EventStatus>();
            EventTagCreatedUser = new HashSet<EventTag>();
            EventTagDeletedUser = new HashSet<EventTag>();
            EventTagUpdatedUser = new HashSet<EventTag>();
            EventUpdatedUser = new HashSet<Event>();
            GridCreatedUser = new HashSet<Grid>();
            GridDeletedUser = new HashSet<Grid>();
            GridReactionCreatedUser = new HashSet<GridReaction>();
            GridReactionDeletedUser = new HashSet<GridReaction>();
            GridReactionUpdatedUser = new HashSet<GridReaction>();
            GridUpdatedUser = new HashSet<Grid>();
            HeatAttachmentCreatedUser = new HashSet<HeatAttachment>();
            HeatAttachmentDeletedUser = new HashSet<HeatAttachment>();
            HeatAttachmentUpdatedUser = new HashSet<HeatAttachment>();
            HeatCreatedUser = new HashSet<Heat>();
            HeatDeletedUser = new HashSet<Heat>();
            HeatReactionCreatedUser = new HashSet<HeatReaction>();
            HeatReactionDeletedUser = new HashSet<HeatReaction>();
            HeatReactionUpdatedUser = new HashSet<HeatReaction>();
            HeatStatusCreatedUser = new HashSet<HeatStatus>();
            HeatStatusDeletedUser = new HashSet<HeatStatus>();
            HeatStatusUpdatedUser = new HashSet<HeatStatus>();
            HeatTagCreatedUser = new HashSet<HeatTag>();
            HeatTagDeletedUser = new HashSet<HeatTag>();
            HeatTagUpdatedUser = new HashSet<HeatTag>();
            HeatUpdatedUser = new HashSet<Heat>();
            InverseDeletedUser = new HashSet<User>();
            InverseUpdatedUser = new HashSet<User>();
            InvoiceCreatedUser = new HashSet<Invoice>();
            InvoiceDeletedUser = new HashSet<Invoice>();
            InvoiceDetailCreatedUser = new HashSet<InvoiceDetail>();
            InvoiceDetailDeletedUser = new HashSet<InvoiceDetail>();
            InvoiceDetailUpdatedUser = new HashSet<InvoiceDetail>();
            InvoiceStatusCreatedUser = new HashSet<InvoiceStatus>();
            InvoiceStatusDeletedUser = new HashSet<InvoiceStatus>();
            InvoiceStatusUpdatedUser = new HashSet<InvoiceStatus>();
            InvoiceUpdatedUser = new HashSet<Invoice>();
            LapCreatedUser = new HashSet<Lap>();
            LapDeletedUser = new HashSet<Lap>();
            LapReactionCreatedUser = new HashSet<LapReaction>();
            LapReactionDeletedUser = new HashSet<LapReaction>();
            LapReactionUpdatedUser = new HashSet<LapReaction>();
            LapStatusCreatedUser = new HashSet<LapStatus>();
            LapStatusDeletedUser = new HashSet<LapStatus>();
            LapStatusUpdatedUser = new HashSet<LapStatus>();
            LapTagCreatedUser = new HashSet<LapTag>();
            LapTagDeletedUser = new HashSet<LapTag>();
            LapTagUpdatedUser = new HashSet<LapTag>();
            LapUpdatedUser = new HashSet<Lap>();
            MeetAttachmentCreatedUser = new HashSet<MeetAttachment>();
            MeetAttachmentDeletedUser = new HashSet<MeetAttachment>();
            MeetAttachmentUpdatedUser = new HashSet<MeetAttachment>();
            MeetCreatedUser = new HashSet<Meet>();
            MeetDeletedUser = new HashSet<Meet>();
            MeetOfficialCreatedUser = new HashSet<MeetOfficial>();
            MeetOfficialDeletedUser = new HashSet<MeetOfficial>();
            MeetOfficialUpdatedUser = new HashSet<MeetOfficial>();
            MeetReactionCreatedUser = new HashSet<MeetReaction>();
            MeetReactionDeletedUser = new HashSet<MeetReaction>();
            MeetReactionUpdatedUser = new HashSet<MeetReaction>();
            MeetStatusCreatedUser = new HashSet<MeetStatus>();
            MeetStatusDeletedUser = new HashSet<MeetStatus>();
            MeetStatusUpdatedUser = new HashSet<MeetStatus>();
            MeetTagCreatedUser = new HashSet<MeetTag>();
            MeetTagDeletedUser = new HashSet<MeetTag>();
            MeetTagUpdatedUser = new HashSet<MeetTag>();
            MeetUpdatedUser = new HashSet<Meet>();
            PermissionCreatedUser = new HashSet<Permission>();
            PermissionDeletedUser = new HashSet<Permission>();
            PermissionUpdatedUser = new HashSet<Permission>();
            PostCreatedUser = new HashSet<Post>();
            PostDeletedUser = new HashSet<Post>();
            PostLockedUser = new HashSet<Post>();
            PostPinnedUser = new HashSet<Post>();
            PostUnlockedUser = new HashSet<Post>();
            PostUnpinnedUser = new HashSet<Post>();
            PostUpdatedUser = new HashSet<Post>();
            Role1CreatedUser = new HashSet<Role1>();
            Role1DeletedUser = new HashSet<Role1>();
            Role1UpdatedUser = new HashSet<Role1>();
            RoleCreatedUser = new HashSet<Role>();
            RoleDeletedUser = new HashSet<Role>();
            RolePermissionCreatedUser = new HashSet<RolePermission>();
            RolePermissionDeletedUser = new HashSet<RolePermission>();
            RolePermissionUpdatedUser = new HashSet<RolePermission>();
            RoleUpdatedUser = new HashSet<Role>();
            UserRoleCreatedUser = new HashSet<UserRole>();
            UserRoleDeletedUser = new HashSet<UserRole>();
            UserRoleUpdatedUser = new HashSet<UserRole>();
            UserRoleUser = new HashSet<UserRole>();
        }

        public long Id { get; set; }
        public Guid Key { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public bool MfaEnabled { get; set; }
        public byte[] MfaEnabledIp { get; set; }
        public DateTime? MfaEnabledUtc { get; set; }
        public string MfaKey { get; set; }
        public bool EmailVerified { get; set; }
        public byte[] EmailVerifiedIp { get; set; }
        public DateTimeOffset? EmailVerifiedUtc { get; set; }
        public Guid? EmailVerifyKey { get; set; }
        public bool ForgotPassword { get; set; }
        public byte[] ForgotPasswordIp { get; set; }
        public Guid? ForgotPasswordUtc { get; set; }
        public Guid? ForgotPasswordKey { get; set; }
        public DateTimeOffset? ForgotPasswordExpiryUtc { get; set; }
        public byte[] ForgotResetIp { get; set; }
        public DateTimeOffset? ForgotResetUtc { get; set; }
        public byte[] LastLoginIp { get; set; }
        public DateTimeOffset? LastLoginUtc { get; set; }
        public bool FailedLogin { get; set; }
        public byte[] FailedLoginIp { get; set; }
        public DateTimeOffset? FailedLoginUtc { get; set; }
        public byte FailedLoginCount { get; set; }
        public byte[] CreatedIp { get; set; }
        public DateTimeOffset CreatedUtc { get; set; }
        public bool Updated { get; set; }
        public byte[] UpdatedIp { get; set; }
        public DateTimeOffset? UpdatedUtc { get; set; }
        public long? UpdatedUserId { get; set; }
        public bool Deleted { get; set; }
        public byte[] DeletedIp { get; set; }
        public DateTimeOffset? DeletedUtc { get; set; }
        public long? DeletedUserId { get; set; }

        public virtual User DeletedUser { get; set; }
        public virtual User UpdatedUser { get; set; }
        public virtual ICollection<Board> BoardCreatedUser { get; set; }
        public virtual ICollection<Board> BoardDeletedUser { get; set; }
        public virtual ICollection<BoardRolePermission> BoardRolePermissionCreatedUser { get; set; }
        public virtual ICollection<BoardRolePermission> BoardRolePermissionDeletedUser { get; set; }
        public virtual ICollection<BoardRolePermission> BoardRolePermissionUpdatedUser { get; set; }
        public virtual ICollection<Board> BoardUpdatedUser { get; set; }
        public virtual ICollection<CommentAttachment> CommentAttachmentCreatedUser { get; set; }
        public virtual ICollection<CommentAttachment> CommentAttachmentDeletedUser { get; set; }
        public virtual ICollection<CommentAttachment> CommentAttachmentUpdatedUser { get; set; }
        public virtual ICollection<Comment> CommentCreatedUser { get; set; }
        public virtual ICollection<Comment> CommentDeletedUser { get; set; }
        public virtual ICollection<CommentReaction> CommentReactionCreatedUser { get; set; }
        public virtual ICollection<CommentReaction> CommentReactionDeletedUser { get; set; }
        public virtual ICollection<CommentReaction> CommentReactionUpdatedUser { get; set; }
        public virtual ICollection<Comment> CommentUpdatedUser { get; set; }
        public virtual ICollection<EventAttachment> EventAttachmentCreatedUser { get; set; }
        public virtual ICollection<EventAttachment> EventAttachmentDeletedUser { get; set; }
        public virtual ICollection<EventAttachment> EventAttachmentUpdatedUser { get; set; }
        public virtual ICollection<Event> EventCreatedUser { get; set; }
        public virtual ICollection<Event> EventDeletedUser { get; set; }
        public virtual ICollection<EventMemberRole> EventMemberRoleCreatedUser { get; set; }
        public virtual ICollection<EventMemberRole> EventMemberRoleDeletedUser { get; set; }
        public virtual ICollection<EventMemberRole> EventMemberRoleUpdatedUser { get; set; }
        public virtual ICollection<EventReaction> EventReactionCreatedUser { get; set; }
        public virtual ICollection<EventReaction> EventReactionDeletedUser { get; set; }
        public virtual ICollection<EventReaction> EventReactionUpdatedUser { get; set; }
        public virtual ICollection<EventStatus> EventStatusCreatedUser { get; set; }
        public virtual ICollection<EventStatus> EventStatusDeletedUser { get; set; }
        public virtual ICollection<EventStatus> EventStatusUpdatedUser { get; set; }
        public virtual ICollection<EventTag> EventTagCreatedUser { get; set; }
        public virtual ICollection<EventTag> EventTagDeletedUser { get; set; }
        public virtual ICollection<EventTag> EventTagUpdatedUser { get; set; }
        public virtual ICollection<Event> EventUpdatedUser { get; set; }
        public virtual ICollection<Grid> GridCreatedUser { get; set; }
        public virtual ICollection<Grid> GridDeletedUser { get; set; }
        public virtual ICollection<GridReaction> GridReactionCreatedUser { get; set; }
        public virtual ICollection<GridReaction> GridReactionDeletedUser { get; set; }
        public virtual ICollection<GridReaction> GridReactionUpdatedUser { get; set; }
        public virtual ICollection<Grid> GridUpdatedUser { get; set; }
        public virtual ICollection<HeatAttachment> HeatAttachmentCreatedUser { get; set; }
        public virtual ICollection<HeatAttachment> HeatAttachmentDeletedUser { get; set; }
        public virtual ICollection<HeatAttachment> HeatAttachmentUpdatedUser { get; set; }
        public virtual ICollection<Heat> HeatCreatedUser { get; set; }
        public virtual ICollection<Heat> HeatDeletedUser { get; set; }
        public virtual ICollection<HeatReaction> HeatReactionCreatedUser { get; set; }
        public virtual ICollection<HeatReaction> HeatReactionDeletedUser { get; set; }
        public virtual ICollection<HeatReaction> HeatReactionUpdatedUser { get; set; }
        public virtual ICollection<HeatStatus> HeatStatusCreatedUser { get; set; }
        public virtual ICollection<HeatStatus> HeatStatusDeletedUser { get; set; }
        public virtual ICollection<HeatStatus> HeatStatusUpdatedUser { get; set; }
        public virtual ICollection<HeatTag> HeatTagCreatedUser { get; set; }
        public virtual ICollection<HeatTag> HeatTagDeletedUser { get; set; }
        public virtual ICollection<HeatTag> HeatTagUpdatedUser { get; set; }
        public virtual ICollection<Heat> HeatUpdatedUser { get; set; }
        public virtual ICollection<User> InverseDeletedUser { get; set; }
        public virtual ICollection<User> InverseUpdatedUser { get; set; }
        public virtual ICollection<Invoice> InvoiceCreatedUser { get; set; }
        public virtual ICollection<Invoice> InvoiceDeletedUser { get; set; }
        public virtual ICollection<InvoiceDetail> InvoiceDetailCreatedUser { get; set; }
        public virtual ICollection<InvoiceDetail> InvoiceDetailDeletedUser { get; set; }
        public virtual ICollection<InvoiceDetail> InvoiceDetailUpdatedUser { get; set; }
        public virtual ICollection<InvoiceStatus> InvoiceStatusCreatedUser { get; set; }
        public virtual ICollection<InvoiceStatus> InvoiceStatusDeletedUser { get; set; }
        public virtual ICollection<InvoiceStatus> InvoiceStatusUpdatedUser { get; set; }
        public virtual ICollection<Invoice> InvoiceUpdatedUser { get; set; }
        public virtual ICollection<Lap> LapCreatedUser { get; set; }
        public virtual ICollection<Lap> LapDeletedUser { get; set; }
        public virtual ICollection<LapReaction> LapReactionCreatedUser { get; set; }
        public virtual ICollection<LapReaction> LapReactionDeletedUser { get; set; }
        public virtual ICollection<LapReaction> LapReactionUpdatedUser { get; set; }
        public virtual ICollection<LapStatus> LapStatusCreatedUser { get; set; }
        public virtual ICollection<LapStatus> LapStatusDeletedUser { get; set; }
        public virtual ICollection<LapStatus> LapStatusUpdatedUser { get; set; }
        public virtual ICollection<LapTag> LapTagCreatedUser { get; set; }
        public virtual ICollection<LapTag> LapTagDeletedUser { get; set; }
        public virtual ICollection<LapTag> LapTagUpdatedUser { get; set; }
        public virtual ICollection<Lap> LapUpdatedUser { get; set; }
        public virtual ICollection<MeetAttachment> MeetAttachmentCreatedUser { get; set; }
        public virtual ICollection<MeetAttachment> MeetAttachmentDeletedUser { get; set; }
        public virtual ICollection<MeetAttachment> MeetAttachmentUpdatedUser { get; set; }
        public virtual ICollection<Meet> MeetCreatedUser { get; set; }
        public virtual ICollection<Meet> MeetDeletedUser { get; set; }
        public virtual ICollection<MeetOfficial> MeetOfficialCreatedUser { get; set; }
        public virtual ICollection<MeetOfficial> MeetOfficialDeletedUser { get; set; }
        public virtual ICollection<MeetOfficial> MeetOfficialUpdatedUser { get; set; }
        public virtual ICollection<MeetReaction> MeetReactionCreatedUser { get; set; }
        public virtual ICollection<MeetReaction> MeetReactionDeletedUser { get; set; }
        public virtual ICollection<MeetReaction> MeetReactionUpdatedUser { get; set; }
        public virtual ICollection<MeetStatus> MeetStatusCreatedUser { get; set; }
        public virtual ICollection<MeetStatus> MeetStatusDeletedUser { get; set; }
        public virtual ICollection<MeetStatus> MeetStatusUpdatedUser { get; set; }
        public virtual ICollection<MeetTag> MeetTagCreatedUser { get; set; }
        public virtual ICollection<MeetTag> MeetTagDeletedUser { get; set; }
        public virtual ICollection<MeetTag> MeetTagUpdatedUser { get; set; }
        public virtual ICollection<Meet> MeetUpdatedUser { get; set; }
        public virtual ICollection<Permission> PermissionCreatedUser { get; set; }
        public virtual ICollection<Permission> PermissionDeletedUser { get; set; }
        public virtual ICollection<Permission> PermissionUpdatedUser { get; set; }
        public virtual ICollection<Post> PostCreatedUser { get; set; }
        public virtual ICollection<Post> PostDeletedUser { get; set; }
        public virtual ICollection<Post> PostLockedUser { get; set; }
        public virtual ICollection<Post> PostPinnedUser { get; set; }
        public virtual ICollection<Post> PostUnlockedUser { get; set; }
        public virtual ICollection<Post> PostUnpinnedUser { get; set; }
        public virtual ICollection<Post> PostUpdatedUser { get; set; }
        public virtual ICollection<Role1> Role1CreatedUser { get; set; }
        public virtual ICollection<Role1> Role1DeletedUser { get; set; }
        public virtual ICollection<Role1> Role1UpdatedUser { get; set; }
        public virtual ICollection<Role> RoleCreatedUser { get; set; }
        public virtual ICollection<Role> RoleDeletedUser { get; set; }
        public virtual ICollection<RolePermission> RolePermissionCreatedUser { get; set; }
        public virtual ICollection<RolePermission> RolePermissionDeletedUser { get; set; }
        public virtual ICollection<RolePermission> RolePermissionUpdatedUser { get; set; }
        public virtual ICollection<Role> RoleUpdatedUser { get; set; }
        public virtual ICollection<UserRole> UserRoleCreatedUser { get; set; }
        public virtual ICollection<UserRole> UserRoleDeletedUser { get; set; }
        public virtual ICollection<UserRole> UserRoleUpdatedUser { get; set; }
        public virtual ICollection<UserRole> UserRoleUser { get; set; }
    }
}
