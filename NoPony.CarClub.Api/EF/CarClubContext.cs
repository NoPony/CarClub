using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace NoPony.CarClub.Api.EF
{
    public partial class CarClubContext : DbContext
    {
        public CarClubContext()
        {
        }

        public CarClubContext(DbContextOptions<CarClubContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Board> Board { get; set; }
        public virtual DbSet<BoardRolePermission> BoardRolePermission { get; set; }
        public virtual DbSet<BoardTag> BoardTag { get; set; }
        public virtual DbSet<Comment> Comment { get; set; }
        public virtual DbSet<CommentAttachment> CommentAttachment { get; set; }
        public virtual DbSet<CommentReaction> CommentReaction { get; set; }
        public virtual DbSet<Event> Event { get; set; }
        public virtual DbSet<EventAttachment> EventAttachment { get; set; }
        public virtual DbSet<EventMemberRole> EventMemberRole { get; set; }
        public virtual DbSet<EventReaction> EventReaction { get; set; }
        public virtual DbSet<EventStatus> EventStatus { get; set; }
        public virtual DbSet<EventTag> EventTag { get; set; }
        public virtual DbSet<Grid> Grid { get; set; }
        public virtual DbSet<GridReaction> GridReaction { get; set; }
        public virtual DbSet<Heat> Heat { get; set; }
        public virtual DbSet<HeatAttachment> HeatAttachment { get; set; }
        public virtual DbSet<HeatPenaltyStatus> HeatPenaltyStatus { get; set; }
        public virtual DbSet<HeatReaction> HeatReaction { get; set; }
        public virtual DbSet<HeatStatus> HeatStatus { get; set; }
        public virtual DbSet<HeatTag> HeatTag { get; set; }
        public virtual DbSet<Invoice> Invoice { get; set; }
        public virtual DbSet<InvoiceDetail> InvoiceDetail { get; set; }
        public virtual DbSet<InvoiceStatus> InvoiceStatus { get; set; }
        public virtual DbSet<Lap> Lap { get; set; }
        public virtual DbSet<LapReaction> LapReaction { get; set; }
        public virtual DbSet<LapStatus> LapStatus { get; set; }
        public virtual DbSet<LapTag> LapTag { get; set; }
        public virtual DbSet<Meet> Meet { get; set; }
        public virtual DbSet<MeetAttachment> MeetAttachment { get; set; }
        public virtual DbSet<MeetOfficial> MeetOfficial { get; set; }
        public virtual DbSet<MeetReaction> MeetReaction { get; set; }
        public virtual DbSet<MeetStatus> MeetStatus { get; set; }
        public virtual DbSet<MeetTag> MeetTag { get; set; }
        public virtual DbSet<Member> Member { get; set; }
        public virtual DbSet<MemberEvent> MemberEvent { get; set; }
        public virtual DbSet<MemberEventAttachment> MemberEventAttachment { get; set; }
        public virtual DbSet<MemberEventStatus> MemberEventStatus { get; set; }
        public virtual DbSet<MemberMeet> MemberMeet { get; set; }
        public virtual DbSet<MemberMeetAttachment> MemberMeetAttachment { get; set; }
        public virtual DbSet<MemberMeetStatus> MemberMeetStatus { get; set; }
        public virtual DbSet<MemberOffice> MemberOffice { get; set; }
        public virtual DbSet<MemberQualification> MemberQualification { get; set; }
        public virtual DbSet<MemberTransaction> MemberTransaction { get; set; }
        public virtual DbSet<MemberVehicle> MemberVehicle { get; set; }
        public virtual DbSet<Office> Office { get; set; }
        public virtual DbSet<Penalty> Penalty { get; set; }
        public virtual DbSet<PenaltyAttachment> PenaltyAttachment { get; set; }
        public virtual DbSet<PenaltyReaction> PenaltyReaction { get; set; }
        public virtual DbSet<Permission> Permission { get; set; }
        public virtual DbSet<Poll> Poll { get; set; }
        public virtual DbSet<PollOption> PollOption { get; set; }
        public virtual DbSet<Post> Post { get; set; }
        public virtual DbSet<Qualification> Qualification { get; set; }
        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<RolePermissionSecurable> RolePermissionSecurable { get; set; }
        public virtual DbSet<Season> Season { get; set; }
        public virtual DbSet<SeasonAttachment> SeasonAttachment { get; set; }
        public virtual DbSet<SeasonEvent> SeasonEvent { get; set; }
        public virtual DbSet<SeasonEventReward> SeasonEventReward { get; set; }
        public virtual DbSet<SeasonEventStatus> SeasonEventStatus { get; set; }
        public virtual DbSet<SeasonStatus> SeasonStatus { get; set; }
        public virtual DbSet<Securable> Securable { get; set; }
        public virtual DbSet<SecurableCategory> SecurableCategory { get; set; }
        public virtual DbSet<Survey> Survey { get; set; }
        public virtual DbSet<SurveyOption> SurveyOption { get; set; }
        public virtual DbSet<SurveyQuestion> SurveyQuestion { get; set; }
        public virtual DbSet<SurveyResponse> SurveyResponse { get; set; }
        public virtual DbSet<SurveyStatus> SurveyStatus { get; set; }
        public virtual DbSet<Tag> Tag { get; set; }
        public virtual DbSet<TagStatus> TagStatus { get; set; }
        public virtual DbSet<Thread> Thread { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<UserRole> UserRole { get; set; }
        public virtual DbSet<Vehicle> Vehicle { get; set; }
        public virtual DbSet<VehicleAttachment> VehicleAttachment { get; set; }
        public virtual DbSet<VehicleMake> VehicleMake { get; set; }
        public virtual DbSet<VehicleModel> VehicleModel { get; set; }
        public virtual DbSet<VehicleOwner> VehicleOwner { get; set; }
        public virtual DbSet<VehicleReaction> VehicleReaction { get; set; }
        public virtual DbSet<VehicleStatus> VehicleStatus { get; set; }
        public virtual DbSet<VehicleVariant> VehicleVariant { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseNpgsql("Host=localhost;Database=car_club;Uid=car_club_service;Pwd=password;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasPostgresExtension("uuid-ossp");

            modelBuilder.Entity<Board>(entity =>
            {
                entity.ToTable("board");

                entity.HasIndex(e => new { e.Key, e.Deleted }, "IX_Board_Composite");

                entity.HasIndex(e => e.CreatedUserId, "IX_Board_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "IX_Board_DeletedUserId");

                entity.HasIndex(e => e.PinnedUserId, "IX_Board_Pinned");

                entity.HasIndex(e => e.UpdatedUserId, "IX_Board_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.PinnedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.BoardCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Board_User_CreatedUserId");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.BoardDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_Board_User_DeletedUserId");

                entity.HasOne(d => d.PinnedUser)
                    .WithMany(p => p.BoardPinnedUser)
                    .HasForeignKey(d => d.PinnedUserId)
                    .HasConstraintName("FK_Board_User_PinnedUserId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.BoardUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_Board_User_UpdatedUserId");
            });

            modelBuilder.Entity<BoardRolePermission>(entity =>
            {
                entity.ToTable("board_role_permission");

                entity.HasIndex(e => e.BoardId, "IX_BoardRolePermission_BoardId");

                entity.HasIndex(e => new { e.Deleted, e.BoardId, e.RoleId, e.PermissionId }, "IX_BoardRolePermission_Composite");

                entity.HasIndex(e => e.CreatedUserId, "IX_BoardRolePermission_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "IX_BoardRolePermission_DeletedUserId");

                entity.HasIndex(e => e.PermissionId, "IX_BoardRolePermission_PermissionId");

                entity.HasIndex(e => e.RoleId, "IX_BoardRolePermission_RoleId");

                entity.HasIndex(e => e.UpdatedUserId, "IX_BoardRolePermission_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);

                entity.HasOne(d => d.Board)
                    .WithMany(p => p.BoardRolePermission)
                    .HasForeignKey(d => d.BoardId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BoardRolePermission_Board_BoardId");

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.BoardRolePermissionCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BoardRolePermission_User_CreatedUserId");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.BoardRolePermissionDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_BoardRolePermission_User_DeletedUserId");

                entity.HasOne(d => d.Permission)
                    .WithMany(p => p.BoardRolePermission)
                    .HasForeignKey(d => d.PermissionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BoardRolePermission_Permission_PermissionId");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.BoardRolePermission)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BoardRolePermission_Role_RoleId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.BoardRolePermissionUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_BoardRolePermission_User_UpdatedUserId");
            });

            modelBuilder.Entity<BoardTag>(entity =>
            {
                entity.ToTable("board_tag");

                entity.HasIndex(e => e.BoardId, "IX_BoardTag_BoardId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);

                entity.HasOne(d => d.Board)
                    .WithMany(p => p.BoardTag)
                    .HasForeignKey(d => d.BoardId)
                    .HasConstraintName("FK_BoardTag_Board_BoardId");
            });

            modelBuilder.Entity<Comment>(entity =>
            {
                entity.ToTable("comment");

                entity.HasIndex(e => e.Deleted, "IX_Comment_Composite");

                entity.HasIndex(e => e.Key, "IX_Comment_Key");

                entity.HasIndex(e => e.ThreadId, "IX_Comment_Thread_ThreadId");

                entity.HasIndex(e => e.CreatedUserId, "IX_Comment_User_CreatedUserId_idx");

                entity.HasIndex(e => e.DeletedUserId, "IX_Comment_User_DeletedUserId_idx");

                entity.HasIndex(e => e.UpdatedUserId, "IX_Comment_User_UpdatedUserId_idx");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Content).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.CommentCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Comment_User_CreatedUserId");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.CommentDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_Comment_User_DeletedUserId");

                entity.HasOne(d => d.Thread)
                    .WithMany(p => p.Comment)
                    .HasForeignKey(d => d.ThreadId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Comment_Thread_ThreadId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.CommentUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_Comment_User_UpdatedUserId");
            });

            modelBuilder.Entity<CommentAttachment>(entity =>
            {
                entity.ToTable("comment_attachment");

                entity.HasIndex(e => e.CommentId, "FK_CommentAttachment_Comment_CommentId_idx");

                entity.HasIndex(e => e.CreatedUserId, "FK_CommentAttachment_User_CreatedUserId_idx");

                entity.HasIndex(e => e.DeletedUserId, "FK_CommentAttachment_User_DeletedUserId_idx");

                entity.HasIndex(e => e.UpdatedUserId, "FK_CommentAttachment_User_UpdatedUserId_idx");

                entity.HasIndex(e => new { e.Deleted, e.CommentId, e.Filename, e.Url }, "IX_CommentAttachment_Composite");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);

                entity.HasOne(d => d.Comment)
                    .WithMany(p => p.CommentAttachment)
                    .HasForeignKey(d => d.CommentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CommentAttachment_Comment_CommentId");

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.CommentAttachmentCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CommentAttachment_User_CreatedUserId");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.CommentAttachmentDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_CommentAttachment_User_DeletedUserId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.CommentAttachmentUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_CommentAttachment_User_UpdatedUserId");
            });

            modelBuilder.Entity<CommentReaction>(entity =>
            {
                entity.ToTable("comment_reaction");

                entity.HasIndex(e => e.CommentId, "FK_CommentReaction_Comment_CommentId_idx");

                entity.HasIndex(e => e.MemberId, "FK_CommentReaction_Member_idx");

                entity.HasIndex(e => e.CreatedUserId, "FK_CommentReaction_User_CreatedUserId_idx");

                entity.HasIndex(e => e.DeletedUserId, "FK_CommentReaction_User_DeletedUserId_idx");

                entity.HasIndex(e => new { e.Deleted, e.CommentId, e.MemberId, e.Emoji }, "IX_CommentReaction_Composite");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Emoji).HasMaxLength(1);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);

                entity.HasOne(d => d.Comment)
                    .WithMany(p => p.CommentReaction)
                    .HasForeignKey(d => d.CommentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CommentReaction_Comment_CommentId");

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.CommentReactionCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CommentReaction_User_CreatedUserId");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.CommentReactionDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_CommentReaction_User_DeletedUserId");

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.CommentReaction)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CommentReaction_Member");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.CommentReactionUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_CommentReaction_User_UpdatedUserId");
            });

            modelBuilder.Entity<Event>(entity =>
            {
                entity.ToTable("event");

                entity.HasIndex(e => e.CreatedUserId, "FK_Event_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_Event_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_Event_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.StartUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<EventAttachment>(entity =>
            {
                entity.ToTable("event_attachment");

                entity.HasIndex(e => e.CreatedUserId, "FK_EventAttachment_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_EventAttachment_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_EventAttachment_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<EventMemberRole>(entity =>
            {
                entity.ToTable("event_member_role");

                entity.HasIndex(e => e.CreatedUserId, "FK_EventMemberRole_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_EventMemberRole_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_EventMemberRole_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<EventReaction>(entity =>
            {
                entity.ToTable("event_reaction");

                entity.HasIndex(e => e.CreatedUserId, "FK_EventReaction_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_EventReaction_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_EventReaction_User_UpdatedUserId");

                entity.HasIndex(e => e.ReactionId, "IX_EventReaction_ReactionId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Emoji).HasMaxLength(1);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<EventStatus>(entity =>
            {
                entity.ToTable("event_status");

                entity.HasIndex(e => e.CreatedUserId, "FK_EventStatus_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_EventStatus_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_EventStatus_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Code).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<EventTag>(entity =>
            {
                entity.ToTable("event_tag");

                entity.HasIndex(e => e.CreatedUserId, "FK_EventTag_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_EventTag_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_EventTag_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Code).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<Grid>(entity =>
            {
                entity.ToTable("grid");

                entity.HasIndex(e => e.CreatedUserId, "FK_Grid_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_Grid_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_Grid_User_UpdatedUserId");

                entity.HasIndex(e => e.MemberId, "IX_Grid_DriverId");

                entity.HasIndex(e => e.VehicleId, "IX_Grid_Vehicle");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<GridReaction>(entity =>
            {
                entity.ToTable("grid_reaction");

                entity.HasIndex(e => e.CreatedUserId, "FK_GridReaction_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_GridReaction_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_GridReaction_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Emoji).HasMaxLength(1);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<Heat>(entity =>
            {
                entity.ToTable("heat");

                entity.HasIndex(e => e.CreatedUserId, "FK_Heat_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_Heat_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_Heat_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Code).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<HeatAttachment>(entity =>
            {
                entity.ToTable("heat_attachment");

                entity.HasIndex(e => e.CreatedUserId, "FK_HeatAttachment_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_HeatAttachment_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_HeatAttachment_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);

                entity.Property(e => e.UploadUtc).HasPrecision(6);
            });

            modelBuilder.Entity<HeatPenaltyStatus>(entity =>
            {
                entity.ToTable("heat_penalty_status");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Code).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<HeatReaction>(entity =>
            {
                entity.ToTable("heat_reaction");

                entity.HasIndex(e => e.CreatedUserId, "FK_HeatReaction_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_HeatReaction_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_HeatReaction_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Emoji).HasMaxLength(1);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<HeatStatus>(entity =>
            {
                entity.ToTable("heat_status");

                entity.HasIndex(e => e.CreatedUserId, "FK_HeatStatus_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_HeatStatus_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_HeatStatus_User_UpdatedUserId");

                entity.HasIndex(e => new { e.Deleted, e.Code, e.Title, e.Updated }, "IX_HeatStatus_Composite");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Code).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<HeatTag>(entity =>
            {
                entity.ToTable("heat_tag");

                entity.HasIndex(e => e.CreatedUserId, "FK_HeatTag_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_HeatTag_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_HeatTag_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<Invoice>(entity =>
            {
                entity.ToTable("invoice");

                entity.HasIndex(e => e.CreatedUserId, "FK_Invoice_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_Invoice_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_Invoice_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<InvoiceDetail>(entity =>
            {
                entity.ToTable("invoice_detail");

                entity.HasIndex(e => e.CreatedUserId, "FK_InvoiceDetail_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_InvoiceDetail_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_InvoiceDetail_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Quantity).HasPrecision(18, 6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<InvoiceStatus>(entity =>
            {
                entity.ToTable("invoice_status");

                entity.HasIndex(e => e.CreatedUserId, "FK_InvoiceStatus_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_InvoiceStatus_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_InvoiceStatus_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Code).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<Lap>(entity =>
            {
                entity.ToTable("lap");

                entity.HasIndex(e => e.CreatedUserId, "FK_Lap_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_Lap_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_Lap_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.EndTimeBy).IsRequired();

                entity.Property(e => e.EndTimeIp).IsRequired();

                entity.Property(e => e.EndTimeMs).HasPrecision(18, 6);

                entity.Property(e => e.EndTimeUtc).HasPrecision(6);

                entity.Property(e => e.PositionBy).IsRequired();

                entity.Property(e => e.PositionIp).IsRequired();

                entity.Property(e => e.PositionUtc).HasPrecision(6);

                entity.Property(e => e.StartTimeBy).IsRequired();

                entity.Property(e => e.StartTimeIp).IsRequired();

                entity.Property(e => e.StartTimeMs).HasPrecision(18, 6);

                entity.Property(e => e.StartTimeUtc).HasPrecision(6);

                entity.Property(e => e.TimeBy).IsRequired();

                entity.Property(e => e.TimeIp).IsRequired();

                entity.Property(e => e.TimeMs).HasPrecision(18, 6);

                entity.Property(e => e.TimeUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<LapReaction>(entity =>
            {
                entity.ToTable("lap_reaction");

                entity.HasIndex(e => e.CreatedUserId, "FK_LapReaction_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_LapReaction_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_LapReaction_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Emoji).HasMaxLength(1);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<LapStatus>(entity =>
            {
                entity.ToTable("lap_status");

                entity.HasIndex(e => e.CreatedUserId, "FK_LapStatus_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_LapStatus_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_LapStatus_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Code).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<LapTag>(entity =>
            {
                entity.ToTable("lap_tag");

                entity.HasIndex(e => e.CreatedUserId, "FK_LapTag_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_LapTag_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_LapTag_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Code).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<Meet>(entity =>
            {
                entity.ToTable("meet");

                entity.HasIndex(e => e.CreatedUserId, "FK_Meet_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_Meet_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_Meet_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.StartUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<MeetAttachment>(entity =>
            {
                entity.ToTable("meet_attachment");

                entity.HasIndex(e => e.CreatedUserId, "FK_MeetAttachment_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_MeetAttachment_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_MeetAttachment_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<MeetOfficial>(entity =>
            {
                entity.ToTable("meet_official");

                entity.HasIndex(e => e.CreatedUserId, "FK_MeetOfficial_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_MeetOfficial_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_MeetOfficial_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<MeetReaction>(entity =>
            {
                entity.ToTable("meet_reaction");

                entity.HasIndex(e => e.CreatedUserId, "FK_MeetReaction_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_MeetReaction_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_MeetReaction_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Emoji).HasMaxLength(1);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<MeetStatus>(entity =>
            {
                entity.ToTable("meet_status");

                entity.HasIndex(e => e.CreatedUserId, "FK_MeetStatus_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_MeetStatus_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_MeetStatus_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Code).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<MeetTag>(entity =>
            {
                entity.ToTable("meet_tag");

                entity.HasIndex(e => e.CreatedUserId, "FK_MeetTag_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_MeetTag_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_MeetTag_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Code).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<Member>(entity =>
            {
                entity.ToTable("member");

                entity.HasIndex(e => e.UserKey, "IX_Member_Key");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.FullName).IsRequired();

                entity.Property(e => e.PreferredName).IsRequired();

                entity.Property(e => e.PrimaryAddressLatitude)
                    .HasPrecision(18, 6)
                    .HasColumnName("PrimaryAddress_Latitude");

                entity.Property(e => e.PrimaryAddressLongitude)
                    .HasPrecision(18, 6)
                    .HasColumnName("PrimaryAddress_Longitude");

                entity.Property(e => e.PrimaryAddressPostcode).HasColumnName("PrimaryAddress_Postcode");

                entity.Property(e => e.PrimaryAddressState).HasColumnName("PrimaryAddress_State");

                entity.Property(e => e.PrimaryAddressStreet1).HasColumnName("PrimaryAddress_Street1");

                entity.Property(e => e.PrimaryAddressStreet2).HasColumnName("PrimaryAddress_Street2");

                entity.Property(e => e.PrimaryAddressSuburb).HasColumnName("PrimaryAddress_Suburb");

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<MemberEvent>(entity =>
            {
                entity.ToTable("member_event");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CheckinBy).IsRequired();

                entity.Property(e => e.CheckinUtc).HasPrecision(6);

                entity.Property(e => e.CheckoutBy).IsRequired();

                entity.Property(e => e.CheckoutUtc).HasPrecision(6);

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.OffTrackBy).IsRequired();

                entity.Property(e => e.OffTrackUtc).HasPrecision(6);

                entity.Property(e => e.OnTrackBy).IsRequired();

                entity.Property(e => e.OnTrackUtc).HasPrecision(6);

                entity.Property(e => e.RegisterBy).IsRequired();

                entity.Property(e => e.RegisterUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<MemberEventAttachment>(entity =>
            {
                entity.ToTable("member_event_attachment");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<MemberEventStatus>(entity =>
            {
                entity.ToTable("member_event_status");

                entity.HasIndex(e => new { e.Deleted, e.Code, e.Title, e.Updated }, "IX_MemberEventStatus_Code");

                entity.HasIndex(e => new { e.Deleted, e.Code, e.Title, e.Updated }, "IX_MemberEventStatus_Composite");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Code).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<MemberMeet>(entity =>
            {
                entity.ToTable("member_meet");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CheckinBy).IsRequired();

                entity.Property(e => e.CheckinIp).IsRequired();

                entity.Property(e => e.CheckinUtc).HasPrecision(6);

                entity.Property(e => e.CheckoutBy).IsRequired();

                entity.Property(e => e.CheckoutIp).IsRequired();

                entity.Property(e => e.CheckoutUtc).HasPrecision(6);

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.EnterUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<MemberMeetAttachment>(entity =>
            {
                entity.ToTable("member_meet_attachment");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<MemberMeetStatus>(entity =>
            {
                entity.ToTable("member_meet_status");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Code).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<MemberOffice>(entity =>
            {
                entity.ToTable("member_office");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.EndUtc).HasPrecision(6);

                entity.Property(e => e.StartUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<MemberQualification>(entity =>
            {
                entity.ToTable("member_qualification");

                entity.HasIndex(e => e.QualificationId, "IX_QualificationId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<MemberTransaction>(entity =>
            {
                entity.ToTable("member_transaction");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Balance).HasPrecision(19, 4);

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.Credit).HasPrecision(19, 4);

                entity.Property(e => e.Debit).HasPrecision(19, 4);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Description).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);

                entity.Property(e => e.WhenUtc).HasPrecision(6);
            });

            modelBuilder.Entity<MemberVehicle>(entity =>
            {
                entity.ToTable("member_vehicle");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<Office>(entity =>
            {
                entity.ToTable("office");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Code).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<Penalty>(entity =>
            {
                entity.ToTable("penalty");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<PenaltyAttachment>(entity =>
            {
                entity.ToTable("penalty_attachment");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);

                entity.Property(e => e.UploadBy).IsRequired();

                entity.Property(e => e.UploadIp).IsRequired();

                entity.Property(e => e.UploadUtc).HasPrecision(6);
            });

            modelBuilder.Entity<PenaltyReaction>(entity =>
            {
                entity.ToTable("penalty_reaction");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Emoji).HasMaxLength(1);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<Permission>(entity =>
            {
                entity.ToTable("permission");

                entity.HasIndex(e => new { e.Id, e.Code, e.Title, e.Deleted }, "IX_Permission_Composite");

                entity.HasIndex(e => e.CreatedUserId, "IX_Permission_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "IX_Permission_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "IX_Permission_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.PermissionCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Permission_User_CreatedUserId");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.PermissionDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_Permission_User_DeletedUserId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.PermissionUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_Permission_User_UpdatedUserId");
            });

            modelBuilder.Entity<Poll>(entity =>
            {
                entity.ToTable("poll");

                entity.HasIndex(e => e.BoardId, "IX_Poll_BoardId");

                entity.HasIndex(e => e.CreatedUserId, "IX_Poll_CreateUserId");

                entity.HasIndex(e => e.DeletedUserId, "IX_Poll_DeleteUserId");

                entity.HasIndex(e => e.ThreadId, "IX_Poll_ThreadId");

                entity.HasIndex(e => e.UpdatedUserId, "IX_Poll_UpdateUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.ClosedUtc).HasPrecision(6);

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.OpenUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);

                entity.HasOne(d => d.Board)
                    .WithMany(p => p.Poll)
                    .HasForeignKey(d => d.BoardId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Poll_Board_BoardId");

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.PollCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Poll_CreateUserId");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.PollDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_Poll_DeleteUserId");

                entity.HasOne(d => d.Thread)
                    .WithMany(p => p.Poll)
                    .HasForeignKey(d => d.ThreadId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Poll_Thread_ThreadId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.PollUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_Poll_UpdateUserId");
            });

            modelBuilder.Entity<PollOption>(entity =>
            {
                entity.ToTable("poll_option");

                entity.HasIndex(e => e.PollId, "IX_PollOption_PollId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);

                entity.HasOne(d => d.Poll)
                    .WithMany(p => p.PollOption)
                    .HasForeignKey(d => d.PollId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PollOption_Poll_PollId");
            });

            modelBuilder.Entity<Post>(entity =>
            {
                entity.ToTable("post");

                entity.HasIndex(e => e.BoardId, "FK_Post_Board_BoardId_idx");

                entity.HasIndex(e => e.CreatedUserId, "FK_Post_User_CreatedUserId_idx");

                entity.HasIndex(e => e.DeletedUserId, "FK_Post_User_DeletedUserId_idx");

                entity.HasIndex(e => e.LockedUserId, "FK_Post_User_LockedUserId_idx");

                entity.HasIndex(e => e.PinnedUserId, "FK_Post_User_PinnedUserId_idx");

                entity.HasIndex(e => e.UnlockedUserId, "FK_Post_User_UnlockedUserId_idx");

                entity.HasIndex(e => e.UnpinnedUserId, "FK_Post_User_UnpinnedUserId_idx");

                entity.HasIndex(e => e.UpdatedUserId, "FK_Post_User_UpdatedUserId_idx");

                entity.HasIndex(e => e.ThreadId, "fk_post_thread1_idx");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Content).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.LockedUtc).HasPrecision(6);

                entity.Property(e => e.PinnedUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UnlockedUtc).HasPrecision(6);

                entity.Property(e => e.UnpinnedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);

                entity.HasOne(d => d.Board)
                    .WithMany(p => p.Post)
                    .HasForeignKey(d => d.BoardId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Post_Board_BoardId");

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.PostCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Post_User_CreatedUserId");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.PostDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_Post_User_DeletedUserId");

                entity.HasOne(d => d.LockedUser)
                    .WithMany(p => p.PostLockedUser)
                    .HasForeignKey(d => d.LockedUserId)
                    .HasConstraintName("FK_Post_User_LockedUserId");

                entity.HasOne(d => d.PinnedUser)
                    .WithMany(p => p.PostPinnedUser)
                    .HasForeignKey(d => d.PinnedUserId)
                    .HasConstraintName("FK_Post_User_PinnedUserId");

                entity.HasOne(d => d.Thread)
                    .WithMany(p => p.Post)
                    .HasForeignKey(d => d.ThreadId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Post_Thread_ThreadId");

                entity.HasOne(d => d.UnlockedUser)
                    .WithMany(p => p.PostUnlockedUser)
                    .HasForeignKey(d => d.UnlockedUserId)
                    .HasConstraintName("FK_Post_User_UnlockedUserId");

                entity.HasOne(d => d.UnpinnedUser)
                    .WithMany(p => p.PostUnpinnedUser)
                    .HasForeignKey(d => d.UnpinnedUserId)
                    .HasConstraintName("FK_Post_User_UnpinnedUserId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.PostUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_Post_User_UpdatedUserId");
            });

            modelBuilder.Entity<Qualification>(entity =>
            {
                entity.ToTable("qualification");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("role");

                entity.HasIndex(e => new { e.Id, e.Code, e.Deleted }, "IX_Role_Composite");

                entity.HasIndex(e => e.CreatedUserId, "IX_Role_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "IX_Role_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "IX_Role_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Code).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.RoleCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Role_User_CreatedUserId");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.RoleDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_Role_User_DeletedUserId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.RoleUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_Role_User_UpdatedUserId");
            });

            modelBuilder.Entity<RolePermissionSecurable>(entity =>
            {
                entity.ToTable("role_permission_securable");

                entity.HasIndex(e => e.CreatedUserId, "IX_RolePermissionSecurable_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "IX_RolePermissionSecurable_DeletedUserId");

                entity.HasIndex(e => e.PermissionId, "IX_RolePermissionSecurable_PermissionId");

                entity.HasIndex(e => e.RoleId, "IX_RolePermissionSecurable_RoleId");

                entity.HasIndex(e => e.SecurableId, "IX_RolePermissionSecurable_SecurableId");

                entity.HasIndex(e => e.UpdatedUserId, "IX_RolePermissionSecurable_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.RolePermissionSecurableCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RolePermissionSecurable_User_CreatedUserId");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.RolePermissionSecurableDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_RolePermissionSecurable_User_DeletedUserId");

                entity.HasOne(d => d.Permission)
                    .WithMany(p => p.RolePermissionSecurable)
                    .HasForeignKey(d => d.PermissionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RolePermissionSecurable_Permission_PermissionId");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.RolePermissionSecurable)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RolePermissionSecurable_Role_RoleId");

                entity.HasOne(d => d.Securable)
                    .WithMany(p => p.RolePermissionSecurable)
                    .HasForeignKey(d => d.SecurableId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RolePermissionSecurable_Securable_SecurableId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.RolePermissionSecurableUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_RolePermissionSecurable_User_UpdatedUserId");
            });

            modelBuilder.Entity<Season>(entity =>
            {
                entity.ToTable("season");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.EndUtc).HasPrecision(6);

                entity.Property(e => e.StartUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<SeasonAttachment>(entity =>
            {
                entity.ToTable("season_attachment");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<SeasonEvent>(entity =>
            {
                entity.ToTable("season_event");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<SeasonEventReward>(entity =>
            {
                entity.ToTable("season_event_reward");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<SeasonEventStatus>(entity =>
            {
                entity.ToTable("season_event_status");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Code).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<SeasonStatus>(entity =>
            {
                entity.ToTable("season_status");

                entity.HasIndex(e => new { e.Deleted, e.Code, e.Title, e.Updated }, "IX_SeasonStatus_Composite");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Code).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<Securable>(entity =>
            {
                entity.ToTable("securable");

                entity.HasIndex(e => new { e.Id, e.Code, e.Title, e.Deleted }, "IX_Securable_Composite");

                entity.HasIndex(e => e.CreatedUserId, "IX_Securable_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "IX_Securable_DeletedUserId");

                entity.HasIndex(e => e.SecurableCategoryId, "IX_Securable_SecurableCategoryId");

                entity.HasIndex(e => e.UpdatedUserId, "IX_Securable_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.SecurableCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Securable_User_CreatedUserId");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.SecurableDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_Securable_User_DeletedUserId");

                entity.HasOne(d => d.SecurableCategory)
                    .WithMany(p => p.Securable)
                    .HasForeignKey(d => d.SecurableCategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Securable_SecurableCategory_SecurableCategoryId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.SecurableUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_Securable_User_UpdatedUserId");
            });

            modelBuilder.Entity<SecurableCategory>(entity =>
            {
                entity.ToTable("securable_category");

                entity.HasIndex(e => e.CreatedUserId, "IX_SecurableCategory_CreateUserId");

                entity.HasIndex(e => e.DeletedUserId, "IX_SecurableCategory_DeleteUserId");

                entity.HasIndex(e => e.UpdatedUserId, "IX_SecurableCategory_UpdateUserId");

                entity.HasIndex(e => e.Code, "UQ_Code")
                    .IsUnique();

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Code).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.SecurableCategoryCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SecurableCategory_CreateUserId");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.SecurableCategoryDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_SecurableCategory_DeleteUserId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.SecurableCategoryUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_SecurableCategory_UpdateUserId");
            });

            modelBuilder.Entity<Survey>(entity =>
            {
                entity.ToTable("survey");

                entity.HasIndex(e => e.BoardId, "IX_Survey_Board");

                entity.HasIndex(e => e.CreatedUserId, "IX_Survey_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "IX_Survey_DeletedUserId");

                entity.HasIndex(e => e.ThreadId, "IX_Survey_ThreadId");

                entity.HasIndex(e => e.UpdatedUserId, "IX_Survey_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);

                entity.HasOne(d => d.Board)
                    .WithMany(p => p.Survey)
                    .HasForeignKey(d => d.BoardId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Survey_Board_BoardId");

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.SurveyCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Survey_User_CreatedUserId");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.SurveyDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_Survey_User_DeletedUserId");

                entity.HasOne(d => d.Thread)
                    .WithMany(p => p.Survey)
                    .HasForeignKey(d => d.ThreadId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Survey_Thread_ThreadId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.SurveyUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_Survey_User_UpdatedUserId");
            });

            modelBuilder.Entity<SurveyOption>(entity =>
            {
                entity.ToTable("survey_option");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<SurveyQuestion>(entity =>
            {
                entity.ToTable("survey_question");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<SurveyResponse>(entity =>
            {
                entity.ToTable("survey_response");

                entity.HasIndex(e => e.SurveyQuestionId, "IX_SurveyResponse_QuestionId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<SurveyStatus>(entity =>
            {
                entity.ToTable("survey_status");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Code).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<Tag>(entity =>
            {
                entity.ToTable("tag");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<TagStatus>(entity =>
            {
                entity.ToTable("tag_status");

                entity.HasIndex(e => new { e.Deleted, e.Code, e.Title, e.Updated }, "IX_TagStatus_Composite");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Code).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<Thread>(entity =>
            {
                entity.ToTable("thread");

                entity.HasIndex(e => e.CreatedUserId, "IX_Thread_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "IX_Thread_DeletedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.ThreadCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Thread_User_CreatedUserId");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.ThreadDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_Thread_User_DeletedUserId");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("user");

                entity.HasIndex(e => e.DeletedUserId, "IX_User_DeletedUserId");

                entity.HasIndex(e => e.Email, "IX_User_Email")
                    .IsUnique()
                    .HasFilter("(\"Deleted\" = false)")
                    .IncludeProperties(new[] { "Password", "EmailVerified", "ForgotPassword", "FailedLoginCount" });

                entity.HasIndex(e => e.Key, "IX_User_Key");

                entity.HasIndex(e => e.UpdatedUserId, "IX_User_UpdatedUserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.EmailVerifiedUtc).HasPrecision(6);

                entity.Property(e => e.FailedLoginUtc).HasPrecision(6);

                entity.Property(e => e.ForgotPasswordExpiryUtc).HasPrecision(6);

                entity.Property(e => e.ForgotPasswordKey).HasMaxLength(64);

                entity.Property(e => e.ForgotPasswordUtc).HasMaxLength(64);

                entity.Property(e => e.ForgotResetUtc).HasPrecision(6);

                entity.Property(e => e.LastLoginUtc).HasPrecision(6);

                entity.Property(e => e.MfaEnabledUtc).HasPrecision(6);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.InverseDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_User_User_DeletedUserId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.InverseUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_User_User_UpdatedUserId");
            });

            modelBuilder.Entity<UserRole>(entity =>
            {
                entity.ToTable("user_role");

                entity.HasIndex(e => new { e.UserId, e.RoleId, e.Deleted }, "IX_UserRole_Composite");

                entity.HasIndex(e => e.CreatedUserId, "IX_UserRole_CreatedUsedId");

                entity.HasIndex(e => e.DeletedUserId, "IX_UserRole_DeletedUserId");

                entity.HasIndex(e => e.RoleId, "IX_UserRole_RoleId");

                entity.HasIndex(e => e.UpdatedUserId, "IX_UserRole_UpdatedUserId");

                entity.HasIndex(e => e.UserId, "IX_UserRole_UserId");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.UserRoleCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserRole_User_CreatedUserId");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.UserRoleDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_UserRole_User_DeletedUserId");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.UserRole)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserRole_Role_RoleId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.UserRoleUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_UserRole_User_UpdatedUserId");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserRoleUser)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserRole_User_UserId");
            });

            modelBuilder.Entity<Vehicle>(entity =>
            {
                entity.ToTable("vehicle");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<VehicleAttachment>(entity =>
            {
                entity.ToTable("vehicle_attachment");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<VehicleMake>(entity =>
            {
                entity.ToTable("vehicle_make");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Code).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<VehicleModel>(entity =>
            {
                entity.ToTable("vehicle_model");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Code).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<VehicleOwner>(entity =>
            {
                entity.ToTable("vehicle_owner");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<VehicleReaction>(entity =>
            {
                entity.ToTable("vehicle_reaction");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Emoji).HasMaxLength(1);

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<VehicleStatus>(entity =>
            {
                entity.ToTable("vehicle_status");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Code).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            modelBuilder.Entity<VehicleVariant>(entity =>
            {
                entity.ToTable("vehicle_variant");

                entity.Property(e => e.Id).UseIdentityAlwaysColumn();

                entity.Property(e => e.Code).IsRequired();

                entity.Property(e => e.CreatedIp).IsRequired();

                entity.Property(e => e.CreatedUtc).HasPrecision(6);

                entity.Property(e => e.DeletedUtc).HasPrecision(6);

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedUtc).HasPrecision(6);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
