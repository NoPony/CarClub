using System;
using System.Collections.Generic;
using System.Net;

namespace NoPony.CarClub.Api.EF
{
    public partial class User
    {
        public User()
        {
            BoardCreatedUser = new HashSet<Board>();
            BoardDeletedUser = new HashSet<Board>();
            BoardPinnedUser = new HashSet<Board>();
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
            InverseDeletedUser = new HashSet<User>();
            InverseUpdatedUser = new HashSet<User>();
            PermissionCreatedUser = new HashSet<Permission>();
            PermissionDeletedUser = new HashSet<Permission>();
            PermissionUpdatedUser = new HashSet<Permission>();
            PollCreatedUser = new HashSet<Poll>();
            PollDeletedUser = new HashSet<Poll>();
            PollUpdatedUser = new HashSet<Poll>();
            PostCreatedUser = new HashSet<Post>();
            PostDeletedUser = new HashSet<Post>();
            PostLockedUser = new HashSet<Post>();
            PostPinnedUser = new HashSet<Post>();
            PostUnlockedUser = new HashSet<Post>();
            PostUnpinnedUser = new HashSet<Post>();
            PostUpdatedUser = new HashSet<Post>();
            RoleCreatedUser = new HashSet<Role>();
            RoleDeletedUser = new HashSet<Role>();
            RolePermissionSecurableCreatedUser = new HashSet<RolePermissionSecurable>();
            RolePermissionSecurableDeletedUser = new HashSet<RolePermissionSecurable>();
            RolePermissionSecurableUpdatedUser = new HashSet<RolePermissionSecurable>();
            RoleUpdatedUser = new HashSet<Role>();
            SecurableCategoryCreatedUser = new HashSet<SecurableCategory>();
            SecurableCategoryDeletedUser = new HashSet<SecurableCategory>();
            SecurableCategoryUpdatedUser = new HashSet<SecurableCategory>();
            SecurableCreatedUser = new HashSet<Securable>();
            SecurableDeletedUser = new HashSet<Securable>();
            SecurableUpdatedUser = new HashSet<Securable>();
            SurveyCreatedUser = new HashSet<Survey>();
            SurveyDeletedUser = new HashSet<Survey>();
            SurveyUpdatedUser = new HashSet<Survey>();
            ThreadCreatedUser = new HashSet<Thread>();
            ThreadDeletedUser = new HashSet<Thread>();
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
        public IPAddress MfaEnabledIp { get; set; }
        public DateTime? MfaEnabledUtc { get; set; }
        public Guid? MfaKey { get; set; }
        public bool EmailVerified { get; set; }
        public IPAddress EmailVerifiedIp { get; set; }
        public DateTime? EmailVerifiedUtc { get; set; }
        public Guid? EmailVerifyKey { get; set; }
        public bool ForgotPassword { get; set; }
        public IPAddress ForgotPasswordIp { get; set; }
        public string ForgotPasswordUtc { get; set; }
        public string ForgotPasswordKey { get; set; }
        public DateTime? ForgotPasswordExpiryUtc { get; set; }
        public IPAddress ForgotResetIp { get; set; }
        public DateTime? ForgotResetUtc { get; set; }
        public IPAddress LastLoginIp { get; set; }
        public DateTime? LastLoginUtc { get; set; }
        public bool FailedLogin { get; set; }
        public IPAddress FailedLoginIp { get; set; }
        public DateTime? FailedLoginUtc { get; set; }
        public short FailedLoginCount { get; set; }
        public IPAddress CreatedIp { get; set; }
        public DateTime CreatedUtc { get; set; }
        public bool Updated { get; set; }
        public IPAddress UpdatedIp { get; set; }
        public DateTime? UpdatedUtc { get; set; }
        public long? UpdatedUserId { get; set; }
        public bool Deleted { get; set; }
        public IPAddress DeletedIp { get; set; }
        public DateTime? DeletedUtc { get; set; }
        public long? DeletedUserId { get; set; }

        public virtual User DeletedUser { get; set; }
        public virtual User UpdatedUser { get; set; }
        public virtual ICollection<Board> BoardCreatedUser { get; set; }
        public virtual ICollection<Board> BoardDeletedUser { get; set; }
        public virtual ICollection<Board> BoardPinnedUser { get; set; }
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
        public virtual ICollection<User> InverseDeletedUser { get; set; }
        public virtual ICollection<User> InverseUpdatedUser { get; set; }
        public virtual ICollection<Permission> PermissionCreatedUser { get; set; }
        public virtual ICollection<Permission> PermissionDeletedUser { get; set; }
        public virtual ICollection<Permission> PermissionUpdatedUser { get; set; }
        public virtual ICollection<Poll> PollCreatedUser { get; set; }
        public virtual ICollection<Poll> PollDeletedUser { get; set; }
        public virtual ICollection<Poll> PollUpdatedUser { get; set; }
        public virtual ICollection<Post> PostCreatedUser { get; set; }
        public virtual ICollection<Post> PostDeletedUser { get; set; }
        public virtual ICollection<Post> PostLockedUser { get; set; }
        public virtual ICollection<Post> PostPinnedUser { get; set; }
        public virtual ICollection<Post> PostUnlockedUser { get; set; }
        public virtual ICollection<Post> PostUnpinnedUser { get; set; }
        public virtual ICollection<Post> PostUpdatedUser { get; set; }
        public virtual ICollection<Role> RoleCreatedUser { get; set; }
        public virtual ICollection<Role> RoleDeletedUser { get; set; }
        public virtual ICollection<RolePermissionSecurable> RolePermissionSecurableCreatedUser { get; set; }
        public virtual ICollection<RolePermissionSecurable> RolePermissionSecurableDeletedUser { get; set; }
        public virtual ICollection<RolePermissionSecurable> RolePermissionSecurableUpdatedUser { get; set; }
        public virtual ICollection<Role> RoleUpdatedUser { get; set; }
        public virtual ICollection<SecurableCategory> SecurableCategoryCreatedUser { get; set; }
        public virtual ICollection<SecurableCategory> SecurableCategoryDeletedUser { get; set; }
        public virtual ICollection<SecurableCategory> SecurableCategoryUpdatedUser { get; set; }
        public virtual ICollection<Securable> SecurableCreatedUser { get; set; }
        public virtual ICollection<Securable> SecurableDeletedUser { get; set; }
        public virtual ICollection<Securable> SecurableUpdatedUser { get; set; }
        public virtual ICollection<Survey> SurveyCreatedUser { get; set; }
        public virtual ICollection<Survey> SurveyDeletedUser { get; set; }
        public virtual ICollection<Survey> SurveyUpdatedUser { get; set; }
        public virtual ICollection<Thread> ThreadCreatedUser { get; set; }
        public virtual ICollection<Thread> ThreadDeletedUser { get; set; }
        public virtual ICollection<UserRole> UserRoleCreatedUser { get; set; }
        public virtual ICollection<UserRole> UserRoleDeletedUser { get; set; }
        public virtual ICollection<UserRole> UserRoleUpdatedUser { get; set; }
        public virtual ICollection<UserRole> UserRoleUser { get; set; }
    }
}
