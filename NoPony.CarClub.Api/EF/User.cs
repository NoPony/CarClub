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
            BoardUpdatedUser = new HashSet<Board>();
            BoardrolepermissionCreatedUser = new HashSet<Boardrolepermission>();
            BoardrolepermissionDeletedUser = new HashSet<Boardrolepermission>();
            BoardrolepermissionUpdatedUser = new HashSet<Boardrolepermission>();
            CommentCreatedUser = new HashSet<Comment>();
            CommentDeletedUser = new HashSet<Comment>();
            CommentUpdatedUser = new HashSet<Comment>();
            CommentattachmentCreatedUser = new HashSet<Commentattachment>();
            CommentattachmentDeletedUser = new HashSet<Commentattachment>();
            CommentattachmentUpdatedUser = new HashSet<Commentattachment>();
            CommentreactionCreatedUser = new HashSet<Commentreaction>();
            CommentreactionDeletedUser = new HashSet<Commentreaction>();
            CommentreactionUpdatedUser = new HashSet<Commentreaction>();
            InverseDeletedUser = new HashSet<User>();
            InverseUpdatedUser = new HashSet<User>();
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
            RoleCreatedUser = new HashSet<Role>();
            RoleDeletedUser = new HashSet<Role>();
            RoleUpdatedUser = new HashSet<Role>();
            RolepermissionCreatedUser = new HashSet<Rolepermission>();
            RolepermissionDeletedUser = new HashSet<Rolepermission>();
            RolepermissionUpdatedUser = new HashSet<Rolepermission>();
            SurveyCreatedUser = new HashSet<Survey>();
            SurveyDeletedUser = new HashSet<Survey>();
            SurveyUpdatedUser = new HashSet<Survey>();
            UserroleCreatedUser = new HashSet<Userrole>();
            UserroleDeletedUser = new HashSet<Userrole>();
            UserroleUpdatedUser = new HashSet<Userrole>();
            UserroleUser = new HashSet<Userrole>();
        }

        public long Id { get; set; }
        public byte[] Key { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public bool MfaEnabled { get; set; }
        public byte[] MfaEnabledIp { get; set; }
        public DateTime? MfaEnabledUtc { get; set; }
        public string MfaKey { get; set; }
        public bool EmailVerified { get; set; }
        public byte[] EmailVerifiedIp { get; set; }
        public DateTime? EmailVerifiedUtc { get; set; }
        public byte[] EmailVerifyKey { get; set; }
        public bool ForgotPassword { get; set; }
        public byte[] ForgotPasswordIp { get; set; }
        public string ForgotPasswordUtc { get; set; }
        public string ForgotPasswordKey { get; set; }
        public DateTime? ForgotPasswordExpiryUtc { get; set; }
        public byte[] ForgotResetIp { get; set; }
        public DateTime? ForgotResetUtc { get; set; }
        public byte[] LastLoginIp { get; set; }
        public DateTime? LastLoginUtc { get; set; }
        public bool FailedLogin { get; set; }
        public byte[] FailedLoginIp { get; set; }
        public DateTime? FailedLoginUtc { get; set; }
        public byte FailedLoginCount { get; set; }
        public byte[] CreatedIp { get; set; }
        public DateTime CreatedUtc { get; set; }
        public bool Updated { get; set; }
        public byte[] UpdatedIp { get; set; }
        public DateTime? UpdatedUtc { get; set; }
        public long? UpdatedUserId { get; set; }
        public bool Deleted { get; set; }
        public byte[] DeletedIp { get; set; }
        public DateTime? DeletedUtc { get; set; }
        public long? DeletedUserId { get; set; }
        public long CreatedUserId { get; set; }

        public virtual User DeletedUser { get; set; }
        public virtual User UpdatedUser { get; set; }
        public virtual ICollection<Board> BoardCreatedUser { get; set; }
        public virtual ICollection<Board> BoardDeletedUser { get; set; }
        public virtual ICollection<Board> BoardUpdatedUser { get; set; }
        public virtual ICollection<Boardrolepermission> BoardrolepermissionCreatedUser { get; set; }
        public virtual ICollection<Boardrolepermission> BoardrolepermissionDeletedUser { get; set; }
        public virtual ICollection<Boardrolepermission> BoardrolepermissionUpdatedUser { get; set; }
        public virtual ICollection<Comment> CommentCreatedUser { get; set; }
        public virtual ICollection<Comment> CommentDeletedUser { get; set; }
        public virtual ICollection<Comment> CommentUpdatedUser { get; set; }
        public virtual ICollection<Commentattachment> CommentattachmentCreatedUser { get; set; }
        public virtual ICollection<Commentattachment> CommentattachmentDeletedUser { get; set; }
        public virtual ICollection<Commentattachment> CommentattachmentUpdatedUser { get; set; }
        public virtual ICollection<Commentreaction> CommentreactionCreatedUser { get; set; }
        public virtual ICollection<Commentreaction> CommentreactionDeletedUser { get; set; }
        public virtual ICollection<Commentreaction> CommentreactionUpdatedUser { get; set; }
        public virtual ICollection<User> InverseDeletedUser { get; set; }
        public virtual ICollection<User> InverseUpdatedUser { get; set; }
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
        public virtual ICollection<Role> RoleCreatedUser { get; set; }
        public virtual ICollection<Role> RoleDeletedUser { get; set; }
        public virtual ICollection<Role> RoleUpdatedUser { get; set; }
        public virtual ICollection<Rolepermission> RolepermissionCreatedUser { get; set; }
        public virtual ICollection<Rolepermission> RolepermissionDeletedUser { get; set; }
        public virtual ICollection<Rolepermission> RolepermissionUpdatedUser { get; set; }
        public virtual ICollection<Survey> SurveyCreatedUser { get; set; }
        public virtual ICollection<Survey> SurveyDeletedUser { get; set; }
        public virtual ICollection<Survey> SurveyUpdatedUser { get; set; }
        public virtual ICollection<Userrole> UserroleCreatedUser { get; set; }
        public virtual ICollection<Userrole> UserroleDeletedUser { get; set; }
        public virtual ICollection<Userrole> UserroleUpdatedUser { get; set; }
        public virtual ICollection<Userrole> UserroleUser { get; set; }
    }
}
