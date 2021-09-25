using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

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
        public virtual DbSet<Role1> Role1 { get; set; }
        public virtual DbSet<RoleCategory> RoleCategory { get; set; }
        public virtual DbSet<RolePermission> RolePermission { get; set; }
        public virtual DbSet<Season> Season { get; set; }
        public virtual DbSet<SeasonAttachment> SeasonAttachment { get; set; }
        public virtual DbSet<SeasonEvent> SeasonEvent { get; set; }
        public virtual DbSet<SeasonEventReward> SeasonEventReward { get; set; }
        public virtual DbSet<SeasonEventStatus> SeasonEventStatus { get; set; }
        public virtual DbSet<SeasonStatus> SeasonStatus { get; set; }
        public virtual DbSet<Survey> Survey { get; set; }
        public virtual DbSet<SurveyOption> SurveyOption { get; set; }
        public virtual DbSet<SurveyQuestion> SurveyQuestion { get; set; }
        public virtual DbSet<SurveyResponse> SurveyResponse { get; set; }
        public virtual DbSet<SurveyStatus> SurveyStatus { get; set; }
        public virtual DbSet<Tag> Tag { get; set; }
        public virtual DbSet<TagStatus> TagStatus { get; set; }
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
                optionsBuilder.UseSqlServer("Server=.\\;Database=CarClub;Integrated Security=SSPI;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Board>(entity =>
            {
                entity.HasIndex(e => e.Key, "IX_Composite");

                entity.HasIndex(e => e.CreatedUserId, "IX_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "IX_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "IX_UpdatedUserId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.BoardCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.BoardDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.BoardUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<BoardRolePermission>(entity =>
            {
                entity.HasIndex(e => e.BoardId, "IX_BoardId");

                entity.HasIndex(e => new { e.Deleted, e.BoardId, e.RoleId, e.PermissionId }, "IX_Composite");

                entity.HasIndex(e => e.CreatedUserId, "IX_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "IX_DeletedUserId");

                entity.HasIndex(e => e.PermissionId, "IX_PermissionId");

                entity.HasIndex(e => e.RoleId, "IX_RoleId");

                entity.HasIndex(e => e.UpdatedUserId, "IX_UpdatedUserId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.Board)
                    .WithMany(p => p.BoardRolePermission)
                    .HasForeignKey(d => d.BoardId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.BoardRolePermissionCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.BoardRolePermissionDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.Permission)
                    .WithMany(p => p.BoardRolePermission)
                    .HasForeignKey(d => d.PermissionId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.BoardRolePermission)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.BoardRolePermissionUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<BoardTag>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();
            });

            modelBuilder.Entity<Comment>(entity =>
            {
                entity.HasIndex(e => new { e.Deleted, e.ParentId }, "IX_Composite");

                entity.HasIndex(e => e.CreatedUserId, "IX_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "IX_DeletedUserId");

                entity.HasIndex(e => e.Key, "IX_Key");

                entity.HasIndex(e => e.ParentId, "IX_ParentId");

                entity.HasIndex(e => e.UpdatedUserId, "IX_UpdatedUserId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.CommentCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.CommentDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.Parent)
                    .WithMany(p => p.InverseParent)
                    .HasForeignKey(d => d.ParentId);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.CommentUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<CommentAttachment>(entity =>
            {
                entity.HasIndex(e => e.CommentId, "IX_CommentId");

                entity.HasIndex(e => new { e.Deleted, e.CommentId }, "IX_Composite");

                entity.HasIndex(e => e.CreatedUserId, "IX_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "IX_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "IX_UpdatedUserId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.Url).HasMaxLength(256);

                entity.HasOne(d => d.Comment)
                    .WithMany(p => p.CommentAttachment)
                    .HasForeignKey(d => d.CommentId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.CommentAttachmentCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.CommentAttachmentDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.CommentAttachmentUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<CommentReaction>(entity =>
            {
                entity.HasIndex(e => e.CommentId, "IX_CommentId");

                entity.HasIndex(e => new { e.Deleted, e.CommentId }, "IX_Composite");

                entity.HasIndex(e => e.CreatedUserId, "IX_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "IX_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "IX_UpdatedUserId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Emoji)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsFixedLength(true);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.Comment)
                    .WithMany(p => p.CommentReaction)
                    .HasForeignKey(d => d.CommentId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.CommentReactionCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.CommentReactionDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.CommentReaction)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.CommentReactionUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<Event>(entity =>
            {
                entity.HasIndex(e => e.MeetId, "IX_MeetId");

                entity.HasIndex(e => e.StatusId, "IX_StatusId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(256);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.EventCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.EventDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.Meet)
                    .WithMany(p => p.Event)
                    .HasForeignKey(d => d.MeetId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.Event)
                    .HasForeignKey(d => d.StatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.EventUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<EventAttachment>(entity =>
            {
                entity.HasIndex(e => e.EventId, "IX_EventId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.Title).HasMaxLength(256);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.Url).HasMaxLength(256);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.EventAttachmentCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.EventAttachmentDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.Event)
                    .WithMany(p => p.EventAttachment)
                    .HasForeignKey(d => d.EventId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.EventAttachmentUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<EventMemberRole>(entity =>
            {
                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.EventMemberRoleCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.EventMemberRoleDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.Event)
                    .WithMany(p => p.EventMemberRole)
                    .HasForeignKey(d => d.EventId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.EventMemberRole)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.EventMemberRole)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.EventMemberRoleUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<EventReaction>(entity =>
            {
                entity.HasIndex(e => e.EventId, "IX_EventId");

                entity.HasIndex(e => e.MemberId, "IX_MemberId");

                entity.HasIndex(e => e.ReactionId, "IX_Reaction");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Emoji)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsFixedLength(true);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.EventReactionCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.EventReactionDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.Event)
                    .WithMany(p => p.EventReaction)
                    .HasForeignKey(d => d.EventId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.EventReaction)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.EventReactionUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<EventStatus>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.EventStatusCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.EventStatusDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.EventStatusUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<EventTag>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.EventTagCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.EventTagDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.EventTagUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<Grid>(entity =>
            {
                entity.HasIndex(e => e.MemberId, "IX_DriverId");

                entity.HasIndex(e => e.HeatId, "IX_HeatId");

                entity.HasIndex(e => e.VehicleId, "IX_Vehicle");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.GridCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.GridDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.Heat)
                    .WithMany(p => p.Grid)
                    .HasForeignKey(d => d.HeatId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.GridUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<GridReaction>(entity =>
            {
                entity.HasIndex(e => e.GridId, "IX_GridId");

                entity.HasIndex(e => e.MemberId, "IX_MemberId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Emoji)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsFixedLength(true);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.GridReactionCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.GridReactionDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.Grid)
                    .WithMany(p => p.GridReaction)
                    .HasForeignKey(d => d.GridId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.GridReaction)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.GridReactionUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<Heat>(entity =>
            {
                entity.HasIndex(e => e.EventId, "IX_EventId");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.HeatCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.HeatDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.Event)
                    .WithMany(p => p.Heat)
                    .HasForeignKey(d => d.EventId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.HeatUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<HeatAttachment>(entity =>
            {
                entity.HasIndex(e => e.HeatId, "IX_HeatId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.Title).HasMaxLength(256);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UploadIp).HasMaxLength(16);

                entity.Property(e => e.Url).HasMaxLength(256);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.HeatAttachmentCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.HeatAttachmentDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.Heat)
                    .WithMany(p => p.HeatAttachment)
                    .HasForeignKey(d => d.HeatId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.HeatAttachmentUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<HeatPenaltyStatus>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);
            });

            modelBuilder.Entity<HeatReaction>(entity =>
            {
                entity.HasIndex(e => e.HeatId, "IX_HeatId");

                entity.HasIndex(e => e.MemberId, "IX_MemberId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Emoji)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsFixedLength(true);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.HeatReactionCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.HeatReactionDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.Heat)
                    .WithMany(p => p.HeatReaction)
                    .HasForeignKey(d => d.HeatId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.HeatReaction)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.HeatReactionUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<HeatStatus>(entity =>
            {
                entity.HasIndex(e => new { e.Deleted, e.Code }, "IX_Composite");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.HeatStatusCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.HeatStatusDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.HeatStatusUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<HeatTag>(entity =>
            {
                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.HeatTagCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.HeatTagDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.HeatTagUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<Invoice>(entity =>
            {
                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.InvoiceCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.InvoiceDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.InvoiceUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<InvoiceDetail>(entity =>
            {
                entity.HasIndex(e => new { e.Deleted, e.StockId }, "IX_Composite");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Quantity).HasColumnType("decimal(18, 6)");

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.InvoiceDetailCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.InvoiceDetailDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.InvoiceDetailUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<InvoiceStatus>(entity =>
            {
                entity.HasIndex(e => new { e.Deleted, e.Code }, "IX_Composite");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.InvoiceStatusCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.InvoiceStatusDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.InvoiceStatusUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<Lap>(entity =>
            {
                entity.HasIndex(e => e.HeatId, "IX_HeatId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.EndTimeBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.EndTimeIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.EndTimeMs).HasColumnType("decimal(18, 6)");

                entity.Property(e => e.PositionBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.PositionIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.StartTimeBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.StartTimeIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.StartTimeMs).HasColumnType("decimal(18, 6)");

                entity.Property(e => e.TimeBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.TimeIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.TimeMs).HasColumnType("decimal(18, 6)");

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.LapCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.LapDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.Heat)
                    .WithMany(p => p.Lap)
                    .HasForeignKey(d => d.HeatId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_HeatResultLap_HeatResult_ResultId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.LapUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<LapReaction>(entity =>
            {
                entity.HasIndex(e => e.LapId, "IX_LapId");

                entity.HasIndex(e => e.MemberId, "IX_MemberId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Emoji)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsFixedLength(true);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.LapReactionCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.LapReactionDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.Lap)
                    .WithMany(p => p.LapReaction)
                    .HasForeignKey(d => d.LapId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.LapReaction)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.LapReactionUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<LapStatus>(entity =>
            {
                entity.HasIndex(e => new { e.Deleted, e.Code }, "IX_Composite");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.LapStatusCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.LapStatusDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.LapStatusUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<LapTag>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.LapTagCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.LapTagDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.LapTagUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<Meet>(entity =>
            {
                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.MeetCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.MeetDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.MeetStatus)
                    .WithMany(p => p.Meet)
                    .HasForeignKey(d => d.MeetStatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Meet_MeetStatusId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.MeetUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<MeetAttachment>(entity =>
            {
                entity.HasIndex(e => e.MeetId, "IX_MeetId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.Title).HasMaxLength(256);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.Url).HasMaxLength(256);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.MeetAttachmentCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.MeetAttachmentDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.Meet)
                    .WithMany(p => p.MeetAttachment)
                    .HasForeignKey(d => d.MeetId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.MeetAttachmentUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<MeetOfficial>(entity =>
            {
                entity.HasIndex(e => e.MeetId, "IX_MeetId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.MeetOfficialCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.MeetOfficialDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.Meet)
                    .WithMany(p => p.MeetOfficial)
                    .HasForeignKey(d => d.MeetId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.MeetOfficial)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Office)
                    .WithMany(p => p.MeetOfficial)
                    .HasForeignKey(d => d.OfficeId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.MeetOfficialUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<MeetReaction>(entity =>
            {
                entity.HasIndex(e => e.MeetId, "IX_MeetId");

                entity.HasIndex(e => e.MemberId, "IX_MemberId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Emoji)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsFixedLength(true);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.MeetReactionCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.MeetReactionDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.Meet)
                    .WithMany(p => p.MeetReaction)
                    .HasForeignKey(d => d.MeetId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.MeetReaction)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.MeetReactionUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<MeetStatus>(entity =>
            {
                entity.HasIndex(e => new { e.Deleted, e.Code }, "IX_Composite");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.MeetStatusCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.MeetStatusDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.MeetStatusUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<MeetTag>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.MeetTagCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.MeetTagDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.MeetTagUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<Member>(entity =>
            {
                entity.HasIndex(e => e.UserKey, "IX_Key");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Email).HasMaxLength(128);

                entity.Property(e => e.FullName)
                    .IsRequired()
                    .HasMaxLength(256);

                entity.Property(e => e.Mobile).HasMaxLength(16);

                entity.Property(e => e.Phone).HasMaxLength(16);

                entity.Property(e => e.PreferredName)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.PrimaryAddressLatitude)
                    .HasColumnType("decimal(18, 6)")
                    .HasColumnName("PrimaryAddress_Latitude");

                entity.Property(e => e.PrimaryAddressLongitude)
                    .HasColumnType("decimal(18, 6)")
                    .HasColumnName("PrimaryAddress_Longitude");

                entity.Property(e => e.PrimaryAddressPostcode)
                    .HasMaxLength(8)
                    .HasColumnName("PrimaryAddress_Postcode");

                entity.Property(e => e.PrimaryAddressState)
                    .HasMaxLength(32)
                    .HasColumnName("PrimaryAddress_State");

                entity.Property(e => e.PrimaryAddressStreet1)
                    .HasMaxLength(128)
                    .HasColumnName("PrimaryAddress_Street1");

                entity.Property(e => e.PrimaryAddressStreet2)
                    .HasMaxLength(128)
                    .HasColumnName("PrimaryAddress_Street2");

                entity.Property(e => e.PrimaryAddressSuburb)
                    .HasMaxLength(128)
                    .HasColumnName("PrimaryAddress_Suburb");

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);
            });

            modelBuilder.Entity<MemberEvent>(entity =>
            {
                entity.HasIndex(e => e.EventId, "IX_EventId");

                entity.HasIndex(e => e.MemberId, "IX_MemberId");

                entity.Property(e => e.CheckinBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CheckinIp).HasMaxLength(16);

                entity.Property(e => e.CheckoutBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CheckoutIp).HasMaxLength(16);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.OffTrackBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.OffTrackIp).HasMaxLength(16);

                entity.Property(e => e.OnTrackBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.OnTrackIp).HasMaxLength(16);

                entity.Property(e => e.RegisterBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.RegisterIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.Event)
                    .WithMany(p => p.MemberEvent)
                    .HasForeignKey(d => d.EventId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EventEntry_Event_EventId");

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.MemberEvent)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EventEntry_Member_MemberId");
            });

            modelBuilder.Entity<MemberEventAttachment>(entity =>
            {
                entity.HasIndex(e => e.MemberEventId, "IX_MemberEventId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.Url).HasMaxLength(256);

                entity.HasOne(d => d.MemberEvent)
                    .WithMany(p => p.MemberEventAttachment)
                    .HasForeignKey(d => d.MemberEventId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_MemberEventAttachment_MemberEvent_MemberEntryId");
            });

            modelBuilder.Entity<MemberEventStatus>(entity =>
            {
                entity.HasIndex(e => new { e.Deleted, e.Code }, "IX_Code");

                entity.HasIndex(e => new { e.Deleted, e.Code }, "IX_Composite");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);
            });

            modelBuilder.Entity<MemberMeet>(entity =>
            {
                entity.HasIndex(e => e.MeetId, "IX_MeetId");

                entity.HasIndex(e => e.MemberId, "IX_MemberId");

                entity.Property(e => e.CheckinBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CheckinIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CheckoutBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CheckoutIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.EnterBy).HasMaxLength(128);

                entity.Property(e => e.EnterIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.Meet)
                    .WithMany(p => p.MemberMeet)
                    .HasForeignKey(d => d.MeetId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.MemberMeet)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<MemberMeetAttachment>(entity =>
            {
                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.Url).HasMaxLength(256);

                entity.HasOne(d => d.MemberMeet)
                    .WithMany(p => p.MemberMeetAttachment)
                    .HasForeignKey(d => d.MemberMeetId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<MemberMeetStatus>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);
            });

            modelBuilder.Entity<MemberOffice>(entity =>
            {
                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);
            });

            modelBuilder.Entity<MemberQualification>(entity =>
            {
                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);
            });

            modelBuilder.Entity<MemberTransaction>(entity =>
            {
                entity.HasIndex(e => e.MemberId, "IX_MemberId");

                entity.Property(e => e.Balance).HasColumnType("money");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.Credit).HasColumnType("money");

                entity.Property(e => e.Debit).HasColumnType("money");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasMaxLength(256);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.MemberTransaction)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<MemberVehicle>(entity =>
            {
                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);
            });

            modelBuilder.Entity<Office>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);
            });

            modelBuilder.Entity<Penalty>(entity =>
            {
                entity.Property(e => e.Code).HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Notes).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(64);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.Driver)
                    .WithMany(p => p.Penalty)
                    .HasForeignKey(d => d.DriverId);

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.Penalty)
                    .HasForeignKey(d => d.StatusId);

                entity.HasOne(d => d.Vehicle)
                    .WithMany(p => p.Penalty)
                    .HasForeignKey(d => d.VehicleId);
            });

            modelBuilder.Entity<PenaltyAttachment>(entity =>
            {
                entity.HasIndex(e => e.PenaltyId, "IX_PenaltyId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UploadBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UploadIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.Url).HasMaxLength(256);

                entity.HasOne(d => d.Penalty)
                    .WithMany(p => p.PenaltyAttachment)
                    .HasForeignKey(d => d.PenaltyId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<PenaltyReaction>(entity =>
            {
                entity.HasIndex(e => e.MemberId, "IX_MemberId");

                entity.HasIndex(e => e.PenaltyId, "IX_PenaltyId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Emoji)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsFixedLength(true);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.PenaltyReaction)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Penalty)
                    .WithMany(p => p.PenaltyReaction)
                    .HasForeignKey(d => d.PenaltyId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<Permission>(entity =>
            {
                entity.ToTable("Permission", "auth");

                entity.HasIndex(e => e.Id, "IX_Composite");

                entity.HasIndex(e => e.Code, "IX_Composite_Code");

                entity.HasIndex(e => e.CreatedUserId, "IX_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "IX_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "IX_UpdatedUserId");

                entity.Property(e => e.Code).HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.PermissionCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.PermissionDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.PermissionUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<Poll>(entity =>
            {
                entity.Property(e => e.ClosedBy).HasMaxLength(128);

                entity.Property(e => e.ClosedIp).HasMaxLength(16);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.OpenBy).HasMaxLength(128);

                entity.Property(e => e.OpenIp).HasMaxLength(16);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);
            });

            modelBuilder.Entity<PollOption>(entity =>
            {
                entity.HasIndex(e => e.PollId, "IX_PollId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.Poll)
                    .WithMany(p => p.PollOption)
                    .HasForeignKey(d => d.PollId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PollOption_Poll_PollOptionId");
            });

            modelBuilder.Entity<Post>(entity =>
            {
                entity.HasIndex(e => e.BoardId, "IX_BoardId");

                entity.HasIndex(e => e.CreatedUserId, "IX_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "IX_DeletedUserId");

                entity.HasIndex(e => e.LockedUserId, "IX_LockedId");

                entity.HasIndex(e => e.PinnedUserId, "IX_PinnedUserId");

                entity.HasIndex(e => e.PollId, "IX_PollId");

                entity.HasIndex(e => e.CommentId, "IX_PostId");

                entity.HasIndex(e => e.SurveyId, "IX_SurveyId");

                entity.HasIndex(e => e.UnlockedUserId, "IX_UnlockedId");

                entity.HasIndex(e => e.UnpinnedUserId, "IX_UnpinnedId");

                entity.HasIndex(e => e.UpdatedUserId, "IX_UpdatedUserId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.LockedIp).HasMaxLength(16);

                entity.Property(e => e.LockedNote).HasMaxLength(1024);

                entity.Property(e => e.PinnedIp).HasMaxLength(16);

                entity.Property(e => e.PinnedNote).HasMaxLength(1024);

                entity.Property(e => e.UnlockedIp).HasMaxLength(16);

                entity.Property(e => e.UnlockedNote).HasMaxLength(1024);

                entity.Property(e => e.UnpinnedIp).HasMaxLength(16);

                entity.Property(e => e.UnpinnedNote).HasMaxLength(1024);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.Board)
                    .WithMany(p => p.Post)
                    .HasForeignKey(d => d.BoardId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Comment)
                    .WithMany(p => p.Post)
                    .HasForeignKey(d => d.CommentId)
                    .HasConstraintName("FK_Post_Comment_PostId");

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.PostCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.PostDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.LockedUser)
                    .WithMany(p => p.PostLockedUser)
                    .HasForeignKey(d => d.LockedUserId)
                    .HasConstraintName("FK_Post_User_LockedId");

                entity.HasOne(d => d.PinnedUser)
                    .WithMany(p => p.PostPinnedUser)
                    .HasForeignKey(d => d.PinnedUserId);

                entity.HasOne(d => d.Poll)
                    .WithMany(p => p.Post)
                    .HasForeignKey(d => d.PollId);

                entity.HasOne(d => d.Survey)
                    .WithMany(p => p.Post)
                    .HasForeignKey(d => d.SurveyId);

                entity.HasOne(d => d.UnlockedUser)
                    .WithMany(p => p.PostUnlockedUser)
                    .HasForeignKey(d => d.UnlockedUserId)
                    .HasConstraintName("FK_Post_User_UnlockedId");

                entity.HasOne(d => d.UnpinnedUser)
                    .WithMany(p => p.PostUnpinnedUser)
                    .HasForeignKey(d => d.UnpinnedUserId)
                    .HasConstraintName("FK_Post_User_UnpinnedId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.PostUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<Qualification>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("Role", "auth");

                entity.HasIndex(e => e.Id, "IX_Composite");

                entity.HasIndex(e => e.CreatedUserId, "IX_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "IX_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "IX_UpdatedUserId");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.RoleCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.RoleDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.RoleUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<Role1>(entity =>
            {
                entity.ToTable("Role");

                entity.HasIndex(e => e.EventId, "IX_EventId");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.Role1CreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.Role1DeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.Role1UpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<RoleCategory>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();
            });

            modelBuilder.Entity<RolePermission>(entity =>
            {
                entity.ToTable("RolePermission", "auth");

                entity.HasIndex(e => new { e.RoleId, e.PermissionId }, "IX_Composite");

                entity.HasIndex(e => e.CreatedUserId, "IX_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "IX_DeletedUserId");

                entity.HasIndex(e => e.PermissionId, "IX_PermissionId");

                entity.HasIndex(e => e.RoleId, "IX_RoleId");

                entity.HasIndex(e => e.UpdatedUserId, "IX_UpdatedUserId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.RolePermissionCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.RolePermissionDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.Permission)
                    .WithMany(p => p.RolePermission)
                    .HasForeignKey(d => d.PermissionId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.RolePermission)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.RolePermissionUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);
            });

            modelBuilder.Entity<Season>(entity =>
            {
                entity.HasIndex(e => e.StatusId, "IX_StatusId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.Season)
                    .HasForeignKey(d => d.StatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<SeasonAttachment>(entity =>
            {
                entity.HasIndex(e => e.SeasonId, "IX_SeasonId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.Url).HasMaxLength(256);

                entity.HasOne(d => d.Season)
                    .WithMany(p => p.SeasonAttachment)
                    .HasForeignKey(d => d.SeasonId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<SeasonEvent>(entity =>
            {
                entity.HasIndex(e => e.SeasonId, "IX_SeasonId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.Event)
                    .WithMany(p => p.SeasonEvent)
                    .HasForeignKey(d => d.EventId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Season)
                    .WithMany(p => p.SeasonEvent)
                    .HasForeignKey(d => d.SeasonId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<SeasonEventReward>(entity =>
            {
                entity.HasIndex(e => e.SeasonEventId, "IX_StatusId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.SeasonEvent)
                    .WithMany(p => p.SeasonEventReward)
                    .HasForeignKey(d => d.SeasonEventId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SeasonEventPoint_SeasonEvent_SeasonEventId");
            });

            modelBuilder.Entity<SeasonEventStatus>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);
            });

            modelBuilder.Entity<SeasonStatus>(entity =>
            {
                entity.HasIndex(e => new { e.Deleted, e.Code }, "IX_Composite");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);
            });

            modelBuilder.Entity<Survey>(entity =>
            {
                entity.HasIndex(e => e.CreatorId, "IX_CreatorId");

                entity.HasIndex(e => e.OwnerId, "IX_OwnerId");

                entity.HasIndex(e => e.StatusId, "IX_StatusId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(256);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.Creator)
                    .WithMany(p => p.SurveyCreator)
                    .HasForeignKey(d => d.CreatorId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Owner)
                    .WithMany(p => p.SurveyOwner)
                    .HasForeignKey(d => d.OwnerId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.Survey)
                    .HasForeignKey(d => d.StatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<SurveyOption>(entity =>
            {
                entity.HasIndex(e => e.QuestionId, "IX_QuestionId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.Question)
                    .WithMany(p => p.SurveyOption)
                    .HasForeignKey(d => d.QuestionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ServeyOption_SurveyQuestion_QuestionId");
            });

            modelBuilder.Entity<SurveyQuestion>(entity =>
            {
                entity.HasIndex(e => e.SurveyId, "IX_ServeyId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(256);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.Survey)
                    .WithMany(p => p.SurveyQuestion)
                    .HasForeignKey(d => d.SurveyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SurveyQuestion_Servey_ServeyId");
            });

            modelBuilder.Entity<SurveyResponse>(entity =>
            {
                entity.HasIndex(e => e.MemberId, "IX_MemberId");

                entity.HasIndex(e => e.SurveyQuestionId, "IX_QuestionId");

                entity.HasIndex(e => e.SurveyQuestionId, "IX_SurveyQuestionId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.SurveyResponse)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.SurveyQuestion)
                    .WithMany(p => p.SurveyResponse)
                    .HasForeignKey(d => d.SurveyQuestionId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<SurveyStatus>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);
            });

            modelBuilder.Entity<Tag>(entity =>
            {
                entity.HasIndex(e => e.CreatorId, "IX_CreatorId");

                entity.HasIndex(e => e.OwnerId, "IX_OwnerId");

                entity.HasIndex(e => e.StatusId, "IX_StatusId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(256);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.Creator)
                    .WithMany(p => p.TagCreator)
                    .HasForeignKey(d => d.CreatorId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Owner)
                    .WithMany(p => p.TagOwner)
                    .HasForeignKey(d => d.OwnerId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.Tag)
                    .HasForeignKey(d => d.StatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<TagStatus>(entity =>
            {
                entity.HasIndex(e => new { e.Deleted, e.Code }, "IX_Composite");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("User", "auth");

                entity.HasIndex(e => e.Email, "IX_Composite_DeletedLogin")
                    .IsUnique();

                entity.HasIndex(e => e.Key, "IX_Composite_Key")
                    .IsUnique();

                entity.HasIndex(e => e.DeletedUserId, "IX_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "IX_UpdatedUserId");

                entity.HasIndex(e => e.Email, "UQ_Login_Email")
                    .IsUnique();

                entity.HasIndex(e => e.Key, "UQ_Login_Key")
                    .IsUnique();

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.EmailVerifiedIp).HasMaxLength(16);

                entity.Property(e => e.FailedLoginIp).HasMaxLength(16);

                entity.Property(e => e.ForgotPasswordIp).HasMaxLength(16);

                entity.Property(e => e.ForgotResetIp).HasMaxLength(16);

                entity.Property(e => e.LastLoginIp).HasMaxLength(16);

                entity.Property(e => e.MfaEnabledIp).HasMaxLength(16);

                entity.Property(e => e.MfaEnabledUtc).HasColumnType("datetime");

                entity.Property(e => e.MfaKey).HasMaxLength(128);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.InverseDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_Login_User_DeletedUserId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.InverseUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_Login_User_UpdatedUserId");
            });

            modelBuilder.Entity<UserRole>(entity =>
            {
                entity.ToTable("UserRole", "auth");

                entity.HasIndex(e => new { e.UserId, e.RoleId }, "IX_Composite");

                entity.HasIndex(e => e.CreatedUserId, "IX_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "IX_DeletedUserId");

                entity.HasIndex(e => e.UserId, "IX_MemberId");

                entity.HasIndex(e => e.RoleId, "IX_RoleId");

                entity.HasIndex(e => e.UpdatedUserId, "IX_UpdatedUserId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.UserRoleCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.UserRoleDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId);

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.UserRole)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.UserRoleUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId);

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserRoleUser)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<Vehicle>(entity =>
            {
                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.Make)
                    .WithMany(p => p.Vehicle)
                    .HasForeignKey(d => d.MakeId);

                entity.HasOne(d => d.Model)
                    .WithMany(p => p.Vehicle)
                    .HasForeignKey(d => d.ModelId);

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.Vehicle)
                    .HasForeignKey(d => d.StatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Variant)
                    .WithMany(p => p.Vehicle)
                    .HasForeignKey(d => d.VariantId);
            });

            modelBuilder.Entity<VehicleAttachment>(entity =>
            {
                entity.HasIndex(e => e.VehicleId, "IX_VehicleId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.Url).HasMaxLength(256);

                entity.HasOne(d => d.Vehicle)
                    .WithMany(p => p.VehicleAttachment)
                    .HasForeignKey(d => d.VehicleId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<VehicleMake>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);
            });

            modelBuilder.Entity<VehicleModel>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.Make)
                    .WithMany(p => p.VehicleModel)
                    .HasForeignKey(d => d.MakeId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<VehicleOwner>(entity =>
            {
                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);
            });

            modelBuilder.Entity<VehicleReaction>(entity =>
            {
                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Emoji)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsFixedLength(true);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.VehicleReaction)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Vehicle)
                    .WithMany(p => p.VehicleReaction)
                    .HasForeignKey(d => d.VehicleId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<VehicleStatus>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);
            });

            modelBuilder.Entity<VehicleVariant>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.HasOne(d => d.Model)
                    .WithMany(p => p.VehicleVariant)
                    .HasForeignKey(d => d.ModelId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
