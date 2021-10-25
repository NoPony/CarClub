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
        public virtual DbSet<Boardrolepermission> Boardrolepermission { get; set; }
        public virtual DbSet<Boardtag> Boardtag { get; set; }
        public virtual DbSet<Comment> Comment { get; set; }
        public virtual DbSet<Commentattachment> Commentattachment { get; set; }
        public virtual DbSet<Commentreaction> Commentreaction { get; set; }
        public virtual DbSet<Event> Event { get; set; }
        public virtual DbSet<Eventattachment> Eventattachment { get; set; }
        public virtual DbSet<Eventmemberrole> Eventmemberrole { get; set; }
        public virtual DbSet<EventReaction> Eventreaction { get; set; }
        public virtual DbSet<Eventstatus> Eventstatus { get; set; }
        public virtual DbSet<Eventtag> Eventtag { get; set; }
        public virtual DbSet<Grid> Grid { get; set; }
        public virtual DbSet<GridReaction> Gridreaction { get; set; }
        public virtual DbSet<Heat> Heat { get; set; }
        public virtual DbSet<Heatattachment> Heatattachment { get; set; }
        public virtual DbSet<Heatpenaltystatus> Heatpenaltystatus { get; set; }
        public virtual DbSet<HeatReaction> Heatreaction { get; set; }
        public virtual DbSet<Heatstatus> Heatstatus { get; set; }
        public virtual DbSet<Heattag> Heattag { get; set; }
        public virtual DbSet<Invoice> Invoice { get; set; }
        public virtual DbSet<Invoicedetail> Invoicedetail { get; set; }
        public virtual DbSet<Invoicestatus> Invoicestatus { get; set; }
        public virtual DbSet<Lap> Lap { get; set; }
        public virtual DbSet<LapReaction> Lapreaction { get; set; }
        public virtual DbSet<Lapstatus> Lapstatus { get; set; }
        public virtual DbSet<Laptag> Laptag { get; set; }
        public virtual DbSet<Meet> Meet { get; set; }
        public virtual DbSet<Meetattachment> Meetattachment { get; set; }
        public virtual DbSet<Meetofficial> Meetofficial { get; set; }
        public virtual DbSet<MeetReaction> Meetreaction { get; set; }
        public virtual DbSet<Meetstatus> Meetstatus { get; set; }
        public virtual DbSet<Meettag> Meettag { get; set; }
        public virtual DbSet<Member> Member { get; set; }
        public virtual DbSet<Memberevent> Memberevent { get; set; }
        public virtual DbSet<Membereventattachment> Membereventattachment { get; set; }
        public virtual DbSet<Membereventstatus> Membereventstatus { get; set; }
        public virtual DbSet<Membermeet> Membermeet { get; set; }
        public virtual DbSet<Membermeetattachment> Membermeetattachment { get; set; }
        public virtual DbSet<Membermeetstatus> Membermeetstatus { get; set; }
        public virtual DbSet<Memberoffice> Memberoffice { get; set; }
        public virtual DbSet<Memberqualification> Memberqualification { get; set; }
        public virtual DbSet<Membertransaction> Membertransaction { get; set; }
        public virtual DbSet<Membervehicle> Membervehicle { get; set; }
        public virtual DbSet<Office> Office { get; set; }
        public virtual DbSet<Penalty> Penalty { get; set; }
        public virtual DbSet<Penaltyattachment> Penaltyattachment { get; set; }
        public virtual DbSet<PenaltyReaction> Penaltyreaction { get; set; }
        public virtual DbSet<Permission> Permission { get; set; }
        public virtual DbSet<Poll> Poll { get; set; }
        public virtual DbSet<Polloption> Polloption { get; set; }
        public virtual DbSet<Post> Post { get; set; }
        public virtual DbSet<Qualification> Qualification { get; set; }
        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<Rolecategory> Rolecategory { get; set; }
        public virtual DbSet<Rolepermission> Rolepermission { get; set; }
        public virtual DbSet<Season> Season { get; set; }
        public virtual DbSet<Seasonattachment> Seasonattachment { get; set; }
        public virtual DbSet<Seasonevent> Seasonevent { get; set; }
        public virtual DbSet<Seasoneventreward> Seasoneventreward { get; set; }
        public virtual DbSet<Seasoneventstatus> Seasoneventstatus { get; set; }
        public virtual DbSet<Seasonstatus> Seasonstatus { get; set; }
        public virtual DbSet<Survey> Survey { get; set; }
        public virtual DbSet<Surveyoption> Surveyoption { get; set; }
        public virtual DbSet<Surveyquestion> Surveyquestion { get; set; }
        public virtual DbSet<Surveyresponse> Surveyresponse { get; set; }
        public virtual DbSet<Surveystatus> Surveystatus { get; set; }
        public virtual DbSet<Tag> Tag { get; set; }
        public virtual DbSet<Tagstatus> Tagstatus { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<Userrole> Userrole { get; set; }
        public virtual DbSet<Vehicle> Vehicle { get; set; }
        public virtual DbSet<Vehicleattachment> Vehicleattachment { get; set; }
        public virtual DbSet<Vehiclemake> Vehiclemake { get; set; }
        public virtual DbSet<Vehiclemodel> Vehiclemodel { get; set; }
        public virtual DbSet<Vehicleowner> Vehicleowner { get; set; }
        public virtual DbSet<VehicleReaction> Vehiclereaction { get; set; }
        public virtual DbSet<Vehiclestatus> Vehiclestatus { get; set; }
        public virtual DbSet<Vehiclevariant> Vehiclevariant { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseMySQL("Server=localhost;Database=CarClub;Uid=stumpy;Pwd=password;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Board>(entity =>
            {
                entity.ToTable("board");

                entity.HasIndex(e => e.CreatedUserId, "FK_Board_User_CreatedUserId_idx");

                entity.HasIndex(e => e.DeletedUserId, "FK_Board_User_DeletedUserId_idx");

                entity.HasIndex(e => e.UpdatedUserId, "FK_Board_User_UpdatedUserId_idx");

                entity.HasIndex(e => new { e.Key, e.Deleted }, "IX_Composite");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Key)
                    .IsRequired()
                    .HasMaxLength(64);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.BoardCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Board_User_CreatedUserId");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.BoardDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_Board_User_DeletedUserId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.BoardUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_Board_User_UpdatedUserId");
            });

            modelBuilder.Entity<Boardrolepermission>(entity =>
            {
                entity.ToTable("boardrolepermission");

                entity.HasIndex(e => e.BoardId, "FK_BoardRolePermission_Board_BoardId_idx");

                entity.HasIndex(e => e.PermissionId, "FK_BoardRolePermission_Permission_PermissionId_idx");

                entity.HasIndex(e => e.RoleId, "FK_BoardRolePermission_Role_RoleId_idx");

                entity.HasIndex(e => e.CreatedUserId, "FK_BoardRolePermission_User_CreatedUserId_idx");

                entity.HasIndex(e => e.DeletedUserId, "FK_BoardRolePermission_User_DeletedUserId_idx");

                entity.HasIndex(e => e.UpdatedUserId, "FK_BoardRolePermission_User_UpdatedUserId_idx");

                entity.HasIndex(e => new { e.Deleted, e.BoardId, e.RoleId, e.PermissionId }, "IX_Composite");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

                entity.HasOne(d => d.Board)
                    .WithMany(p => p.Boardrolepermission)
                    .HasForeignKey(d => d.BoardId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BoardRolePermission_Board_BoardId");

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.BoardrolepermissionCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BoardRolePermission_User_CreatedUserId");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.BoardrolepermissionDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_BoardRolePermission_User_DeletedUserId");

                entity.HasOne(d => d.Permission)
                    .WithMany(p => p.Boardrolepermission)
                    .HasForeignKey(d => d.PermissionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BoardRolePermission_Permission_PermissionId");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Boardrolepermission)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BoardRolePermission_Role_RoleId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.BoardrolepermissionUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_BoardRolePermission_User_UpdatedUserId");
            });

            modelBuilder.Entity<Boardtag>(entity =>
            {
                entity.ToTable("boardtag");

                entity.HasIndex(e => e.BoardId, "FK_BoardTag_Board_BoardId_idx");

                entity.Property(e => e.CreatedIp).HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

                entity.HasOne(d => d.Board)
                    .WithMany(p => p.Boardtag)
                    .HasForeignKey(d => d.BoardId)
                    .HasConstraintName("FK_BoardTag_Board_BoardId");
            });

            modelBuilder.Entity<Comment>(entity =>
            {
                entity.ToTable("comment");

                entity.HasIndex(e => e.CreatedUserId, "FK_Comment_User_CreatedUserId_idx");

                entity.HasIndex(e => e.DeletedUserId, "FK_Comment_User_DeletedUserId_idx");

                entity.HasIndex(e => e.UpdatedUserId, "FK_Comment_User_UpdatedUserId_idx");

                entity.HasIndex(e => new { e.Deleted, e.ParentId }, "IX_Composite");

                entity.HasIndex(e => e.Key, "IX_Key");

                entity.HasIndex(e => e.ParentId, "IX_ParentId");

                entity.Property(e => e.Content).HasMaxLength(0);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Key)
                    .IsRequired()
                    .HasMaxLength(64);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.CommentCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Comment_User_CreatedUserId");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.CommentDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_Comment_User_DeletedUserId");

                entity.HasOne(d => d.Parent)
                    .WithMany(p => p.InverseParent)
                    .HasForeignKey(d => d.ParentId)
                    .HasConstraintName("FK_Comment_Comment_ParentId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.CommentUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_Comment_User_UpdatedUserId");
            });

            modelBuilder.Entity<Commentattachment>(entity =>
            {
                entity.ToTable("commentattachment");

                entity.HasIndex(e => e.CommentId, "FK_CommentAttachment_Comment_CommentId_idx");

                entity.HasIndex(e => e.CreatedUserId, "FK_CommentAttachment_User_CreatedUserId_idx");

                entity.HasIndex(e => e.DeletedUserId, "FK_CommentAttachment_User_DeletedUserId_idx");

                entity.HasIndex(e => e.UpdatedUserId, "FK_CommentAttachment_User_UpdatedUserId_idx");

                entity.HasIndex(e => new { e.Deleted, e.CommentId, e.Filename, e.Url }, "IX_Composite");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Url).HasMaxLength(256);

                entity.HasOne(d => d.Comment)
                    .WithMany(p => p.Commentattachment)
                    .HasForeignKey(d => d.CommentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CommentAttachment_Comment_CommentId");

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.CommentattachmentCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CommentAttachment_User_CreatedUserId");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.CommentattachmentDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_CommentAttachment_User_DeletedUserId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.CommentattachmentUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_CommentAttachment_User_UpdatedUserId");
            });

            modelBuilder.Entity<Commentreaction>(entity =>
            {
                entity.ToTable("commentreaction");

                entity.HasIndex(e => e.CommentId, "FK_CommentReaction_Comment_CommentId_idx");

                entity.HasIndex(e => e.MemberId, "FK_CommentReaction_Member_idx");

                entity.HasIndex(e => e.CreatedUserId, "FK_CommentReaction_User_CreatedUserId_idx");

                entity.HasIndex(e => e.DeletedUserId, "FK_CommentReaction_User_DeletedUserId_idx");

                entity.HasIndex(e => e.UpdatedUserId, "FK_CommentReaction_User_UpdatedUserId");

                entity.HasIndex(e => new { e.Deleted, e.CommentId, e.MemberId, e.Emoji }, "IX_Composite");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Emoji)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsFixedLength(true);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

                entity.HasOne(d => d.Comment)
                    .WithMany(p => p.Commentreaction)
                    .HasForeignKey(d => d.CommentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CommentReaction_Comment_CommentId");

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.CommentreactionCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CommentReaction_User_CreatedUserId");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.CommentreactionDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_CommentReaction_User_DeletedUserId");

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.Commentreaction)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CommentReaction_Member");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.CommentreactionUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_CommentReaction_User_UpdatedUserId");
            });

            modelBuilder.Entity<Event>(entity =>
            {
                entity.ToTable("event");

                entity.HasIndex(e => e.CreatedUserId, "FK_Event_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_Event_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_Event_User_UpdatedUserId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.StartUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Title).HasMaxLength(256);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Eventattachment>(entity =>
            {
                entity.ToTable("eventattachment");

                entity.HasIndex(e => e.CreatedUserId, "FK_EventAttachment_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_EventAttachment_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_EventAttachment_User_UpdatedUserId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.Title).HasMaxLength(256);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Url).HasMaxLength(256);
            });

            modelBuilder.Entity<Eventmemberrole>(entity =>
            {
                entity.ToTable("eventmemberrole");

                entity.HasIndex(e => e.CreatedUserId, "FK_EventMemberRole_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_EventMemberRole_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_EventMemberRole_User_UpdatedUserId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<EventReaction>(entity =>
            {
                entity.ToTable("eventreaction");

                entity.HasIndex(e => e.CreatedUserId, "FK_EventReaction_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_EventReaction_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_EventReaction_User_UpdatedUserId");

                entity.HasIndex(e => e.ReactionId, "IX_Reaction");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Emoji)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsFixedLength(true);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Eventstatus>(entity =>
            {
                entity.ToTable("eventstatus");

                entity.HasIndex(e => e.CreatedUserId, "FK_EventStatus_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_EventStatus_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_EventStatus_User_UpdatedUserId");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Eventtag>(entity =>
            {
                entity.ToTable("eventtag");

                entity.HasIndex(e => e.CreatedUserId, "FK_EventTag_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_EventTag_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_EventTag_User_UpdatedUserId");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Grid>(entity =>
            {
                entity.ToTable("grid");

                entity.HasIndex(e => e.CreatedUserId, "FK_Grid_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_Grid_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_Grid_User_UpdatedUserId");

                entity.HasIndex(e => e.MemberId, "IX_DriverId");

                entity.HasIndex(e => e.VehicleId, "IX_Vehicle");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<GridReaction>(entity =>
            {
                entity.ToTable("gridreaction");

                entity.HasIndex(e => e.CreatedUserId, "FK_GridReaction_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_GridReaction_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_GridReaction_User_UpdatedUserId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Emoji)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsFixedLength(true);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Heat>(entity =>
            {
                entity.ToTable("heat");

                entity.HasIndex(e => e.CreatedUserId, "FK_Heat_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_Heat_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_Heat_User_UpdatedUserId");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Heatattachment>(entity =>
            {
                entity.ToTable("heatattachment");

                entity.HasIndex(e => e.CreatedUserId, "FK_HeatAttachment_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_HeatAttachment_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_HeatAttachment_User_UpdatedUserId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.Title).HasMaxLength(256);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.UploadIp).HasMaxLength(16);

                entity.Property(e => e.UploadUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Url).HasMaxLength(256);
            });

            modelBuilder.Entity<Heatpenaltystatus>(entity =>
            {
                entity.ToTable("heatpenaltystatus");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<HeatReaction>(entity =>
            {
                entity.ToTable("heatreaction");

                entity.HasIndex(e => e.CreatedUserId, "FK_HeatReaction_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_HeatReaction_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_HeatReaction_User_UpdatedUserId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Emoji)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsFixedLength(true);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Heatstatus>(entity =>
            {
                entity.ToTable("heatstatus");

                entity.HasIndex(e => e.CreatedUserId, "FK_HeatStatus_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_HeatStatus_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_HeatStatus_User_UpdatedUserId");

                entity.HasIndex(e => new { e.Deleted, e.Code, e.Title, e.Updated }, "IX_Composite");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Heattag>(entity =>
            {
                entity.ToTable("heattag");

                entity.HasIndex(e => e.CreatedUserId, "FK_HeatTag_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_HeatTag_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_HeatTag_User_UpdatedUserId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Invoice>(entity =>
            {
                entity.ToTable("invoice");

                entity.HasIndex(e => e.CreatedUserId, "FK_Invoice_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_Invoice_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_Invoice_User_UpdatedUserId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Invoicedetail>(entity =>
            {
                entity.ToTable("invoicedetail");

                entity.HasIndex(e => e.CreatedUserId, "FK_InvoiceDetail_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_InvoiceDetail_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_InvoiceDetail_User_UpdatedUserId");

                entity.HasIndex(e => new { e.Deleted, e.StockId, e.Quantity, e.Updated }, "IX_Composite");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Quantity).HasColumnType("decimal(18,6)");

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Invoicestatus>(entity =>
            {
                entity.ToTable("invoicestatus");

                entity.HasIndex(e => e.CreatedUserId, "FK_InvoiceStatus_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_InvoiceStatus_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_InvoiceStatus_User_UpdatedUserId");

                entity.HasIndex(e => new { e.Deleted, e.Code, e.Title, e.Updated }, "IX_Composite");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Lap>(entity =>
            {
                entity.ToTable("lap");

                entity.HasIndex(e => e.CreatedUserId, "FK_Lap_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_Lap_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_Lap_User_UpdatedUserId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.EndTimeBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.EndTimeIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.EndTimeMs).HasColumnType("decimal(18,6)");

                entity.Property(e => e.EndTimeUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.PositionBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.PositionIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.PositionUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.StartTimeBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.StartTimeIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.StartTimeMs).HasColumnType("decimal(18,6)");

                entity.Property(e => e.StartTimeUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.TimeBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.TimeIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.TimeMs).HasColumnType("decimal(18,6)");

                entity.Property(e => e.TimeUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<LapReaction>(entity =>
            {
                entity.ToTable("lapreaction");

                entity.HasIndex(e => e.CreatedUserId, "FK_LapReaction_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_LapReaction_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_LapReaction_User_UpdatedUserId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Emoji)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsFixedLength(true);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Lapstatus>(entity =>
            {
                entity.ToTable("lapstatus");

                entity.HasIndex(e => e.CreatedUserId, "FK_LapStatus_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_LapStatus_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_LapStatus_User_UpdatedUserId");

                entity.HasIndex(e => new { e.Deleted, e.Code, e.Title, e.Updated }, "IX_Composite");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Laptag>(entity =>
            {
                entity.ToTable("laptag");

                entity.HasIndex(e => e.CreatedUserId, "FK_LapTag_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_LapTag_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_LapTag_User_UpdatedUserId");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Meet>(entity =>
            {
                entity.ToTable("meet");

                entity.HasIndex(e => e.CreatedUserId, "FK_Meet_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_Meet_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_Meet_User_UpdatedUserId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.StartUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Meetattachment>(entity =>
            {
                entity.ToTable("meetattachment");

                entity.HasIndex(e => e.CreatedUserId, "FK_MeetAttachment_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_MeetAttachment_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_MeetAttachment_User_UpdatedUserId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.Title).HasMaxLength(256);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Url).HasMaxLength(256);
            });

            modelBuilder.Entity<Meetofficial>(entity =>
            {
                entity.ToTable("meetofficial");

                entity.HasIndex(e => e.CreatedUserId, "FK_MeetOfficial_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_MeetOfficial_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_MeetOfficial_User_UpdatedUserId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<MeetReaction>(entity =>
            {
                entity.ToTable("meetreaction");

                entity.HasIndex(e => e.CreatedUserId, "FK_MeetReaction_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_MeetReaction_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_MeetReaction_User_UpdatedUserId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Emoji)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsFixedLength(true);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Meetstatus>(entity =>
            {
                entity.ToTable("meetstatus");

                entity.HasIndex(e => e.CreatedUserId, "FK_MeetStatus_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_MeetStatus_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_MeetStatus_User_UpdatedUserId");

                entity.HasIndex(e => new { e.Deleted, e.Code, e.Title, e.Updated }, "IX_Composite");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Meettag>(entity =>
            {
                entity.ToTable("meettag");

                entity.HasIndex(e => e.CreatedUserId, "FK_MeetTag_User_CreatedUserId");

                entity.HasIndex(e => e.DeletedUserId, "FK_MeetTag_User_DeletedUserId");

                entity.HasIndex(e => e.UpdatedUserId, "FK_MeetTag_User_UpdatedUserId");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Member>(entity =>
            {
                entity.ToTable("member");

                entity.HasIndex(e => e.UserKey, "IX_Key");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

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
                    .HasColumnType("decimal(18,6)")
                    .HasColumnName("PrimaryAddress_Latitude");

                entity.Property(e => e.PrimaryAddressLongitude)
                    .HasColumnType("decimal(18,6)")
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

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.UserKey).HasMaxLength(64);
            });

            modelBuilder.Entity<Memberevent>(entity =>
            {
                entity.ToTable("memberevent");

                entity.Property(e => e.CheckinBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CheckinIp).HasMaxLength(16);

                entity.Property(e => e.CheckinUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.CheckoutBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CheckoutIp).HasMaxLength(16);

                entity.Property(e => e.CheckoutUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.OffTrackBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.OffTrackIp).HasMaxLength(16);

                entity.Property(e => e.OffTrackUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.OnTrackBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.OnTrackIp).HasMaxLength(16);

                entity.Property(e => e.OnTrackUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.RegisterBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.RegisterIp).HasMaxLength(16);

                entity.Property(e => e.RegisterUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Membereventattachment>(entity =>
            {
                entity.ToTable("membereventattachment");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Url).HasMaxLength(256);
            });

            modelBuilder.Entity<Membereventstatus>(entity =>
            {
                entity.ToTable("membereventstatus");

                entity.HasIndex(e => new { e.Deleted, e.Code, e.Title, e.Updated }, "IX_Code");

                entity.HasIndex(e => new { e.Deleted, e.Code, e.Title, e.Updated }, "IX_Composite");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Membermeet>(entity =>
            {
                entity.ToTable("membermeet");

                entity.Property(e => e.CheckinBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CheckinIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CheckinUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.CheckoutBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CheckoutIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CheckoutUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.EnterBy).HasMaxLength(128);

                entity.Property(e => e.EnterIp).HasMaxLength(16);

                entity.Property(e => e.EnterUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Membermeetattachment>(entity =>
            {
                entity.ToTable("membermeetattachment");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Url).HasMaxLength(256);
            });

            modelBuilder.Entity<Membermeetstatus>(entity =>
            {
                entity.ToTable("membermeetstatus");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Memberoffice>(entity =>
            {
                entity.ToTable("memberoffice");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.EndUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.StartUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Memberqualification>(entity =>
            {
                entity.ToTable("memberqualification");

                entity.HasIndex(e => e.QualificationId, "IX_QualificationId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Membertransaction>(entity =>
            {
                entity.ToTable("membertransaction");

                entity.Property(e => e.Balance).HasColumnType("decimal(19,4)");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Credit).HasColumnType("decimal(19,4)");

                entity.Property(e => e.Debit).HasColumnType("decimal(19,4)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasMaxLength(256);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.WhenUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Membervehicle>(entity =>
            {
                entity.ToTable("membervehicle");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Office>(entity =>
            {
                entity.ToTable("office");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Penalty>(entity =>
            {
                entity.ToTable("penalty");

                entity.Property(e => e.Code).HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Notes).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(64);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Penaltyattachment>(entity =>
            {
                entity.ToTable("penaltyattachment");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.UploadBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UploadIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.UploadUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Url).HasMaxLength(256);
            });

            modelBuilder.Entity<PenaltyReaction>(entity =>
            {
                entity.ToTable("penaltyreaction");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Emoji)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsFixedLength(true);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Permission>(entity =>
            {
                entity.ToTable("permission");

                entity.HasIndex(e => e.CreatedUserId, "FK_Permission_User_CreatedUserId_idx");

                entity.HasIndex(e => e.DeletedUserId, "FK_Permission_User_DeletedUserId_idx");

                entity.HasIndex(e => e.UpdatedUserId, "FK_Permission_User_UpdatedUserId");

                entity.HasIndex(e => new { e.Id, e.Code, e.Title, e.Deleted }, "IX_Composite");

                entity.HasIndex(e => new { e.Code, e.Title, e.Deleted }, "IX_Composite_Code");

                entity.Property(e => e.Code).HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

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

                entity.Property(e => e.ClosedBy).HasMaxLength(128);

                entity.Property(e => e.ClosedIp).HasMaxLength(16);

                entity.Property(e => e.ClosedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.OpenBy).HasMaxLength(128);

                entity.Property(e => e.OpenIp).HasMaxLength(16);

                entity.Property(e => e.OpenUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Polloption>(entity =>
            {
                entity.ToTable("polloption");

                entity.HasIndex(e => e.PollId, "FK_PollOption_Poll_PollId_idx");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

                entity.HasOne(d => d.Poll)
                    .WithMany(p => p.Polloption)
                    .HasForeignKey(d => d.PollId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PollOption_Poll_PollId");
            });

            modelBuilder.Entity<Post>(entity =>
            {
                entity.ToTable("post");

                entity.HasIndex(e => e.BoardId, "FK_Post_Board_BoardId_idx");

                entity.HasIndex(e => e.CommentId, "FK_Post_Comment_CommentId_idx");

                entity.HasIndex(e => e.PollId, "FK_Post_Poll_PollId_idx");

                entity.HasIndex(e => e.SurveyId, "FK_Post_Survey_SurveyId_idx");

                entity.HasIndex(e => e.CreatedUserId, "FK_Post_User_CreatedUserId_idx");

                entity.HasIndex(e => e.DeletedUserId, "FK_Post_User_DeletedUserId_idx");

                entity.HasIndex(e => e.LockedUserId, "FK_Post_User_LockedUserId_idx");

                entity.HasIndex(e => e.PinnedUserId, "FK_Post_User_PinnedUserId_idx");

                entity.HasIndex(e => e.UnlockedUserId, "FK_Post_User_UnlockedUserId_idx");

                entity.HasIndex(e => e.UnpinnedUserId, "FK_Post_User_UnpinnedUserId_idx");

                entity.HasIndex(e => e.UpdatedUserId, "FK_Post_User_UpdatedUserId_idx");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.LockedIp).HasMaxLength(16);

                entity.Property(e => e.LockedNote).HasMaxLength(1024);

                entity.Property(e => e.LockedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.PinnedIp).HasMaxLength(16);

                entity.Property(e => e.PinnedNote).HasMaxLength(1024);

                entity.Property(e => e.PinnedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.UnlockedIp).HasMaxLength(16);

                entity.Property(e => e.UnlockedNote).HasMaxLength(1024);

                entity.Property(e => e.UnlockedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.UnpinnedIp).HasMaxLength(16);

                entity.Property(e => e.UnpinnedNote).HasMaxLength(1024);

                entity.Property(e => e.UnpinnedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

                entity.HasOne(d => d.Board)
                    .WithMany(p => p.Post)
                    .HasForeignKey(d => d.BoardId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Post_Board_BoardId");

                entity.HasOne(d => d.Comment)
                    .WithMany(p => p.Post)
                    .HasForeignKey(d => d.CommentId)
                    .HasConstraintName("FK_Post_Comment_CommentId");

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

                entity.HasOne(d => d.Poll)
                    .WithMany(p => p.Post)
                    .HasForeignKey(d => d.PollId)
                    .HasConstraintName("FK_Post_Poll_PollId");

                entity.HasOne(d => d.Survey)
                    .WithMany(p => p.Post)
                    .HasForeignKey(d => d.SurveyId)
                    .HasConstraintName("FK_Post_Survey_SurveyId");

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

                entity.Property(e => e.CreatedIp).HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("role");

                entity.HasIndex(e => e.CreatedUserId, "FK_Role_User_CreatedUserId_idx");

                entity.HasIndex(e => e.DeletedUserId, "FK_Role_User_DeletedUserId_idx");

                entity.HasIndex(e => e.UpdatedUserId, "FK_Role_User_UpdatedUserId_idx");

                entity.HasIndex(e => new { e.Id, e.Code, e.Deleted }, "IX_Composite");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

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

            modelBuilder.Entity<Rolecategory>(entity =>
            {
                entity.ToTable("rolecategory");

                entity.Property(e => e.CreatedIp).HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Rolepermission>(entity =>
            {
                entity.ToTable("rolepermission");

                entity.HasIndex(e => e.PermissionId, "FK_RolePermission_Permission_PermissionId_idx");

                entity.HasIndex(e => e.CreatedUserId, "FK_RolePermission_User_CreatedUserId_idx");

                entity.HasIndex(e => e.DeletedUserId, "FK_RolePermission_User_DeletedUserId_idx");

                entity.HasIndex(e => e.UpdatedUserId, "FK_RolePermission_User_UpdatedUserId_idx");

                entity.HasIndex(e => e.RoleId, "IX_RoleId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.RolepermissionCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RolePermission_User_CreatedUserId");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.RolepermissionDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_RolePermission_User_DeletedUserId");

                entity.HasOne(d => d.Permission)
                    .WithMany(p => p.Rolepermission)
                    .HasForeignKey(d => d.PermissionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RolePermission_Permission_PermissionId");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Rolepermission)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RolePermission_Role_RoleId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.RolepermissionUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_RolePermission_User_UpdatedUserId");
            });

            modelBuilder.Entity<Season>(entity =>
            {
                entity.ToTable("season");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.EndUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.StartUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Seasonattachment>(entity =>
            {
                entity.ToTable("seasonattachment");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Url).HasMaxLength(256);
            });

            modelBuilder.Entity<Seasonevent>(entity =>
            {
                entity.ToTable("seasonevent");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Seasoneventreward>(entity =>
            {
                entity.ToTable("seasoneventreward");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Seasoneventstatus>(entity =>
            {
                entity.ToTable("seasoneventstatus");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Seasonstatus>(entity =>
            {
                entity.ToTable("seasonstatus");

                entity.HasIndex(e => new { e.Deleted, e.Code, e.Title, e.Updated }, "IX_Composite");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Survey>(entity =>
            {
                entity.ToTable("survey");

                entity.HasIndex(e => e.CreatedUserId, "FK_Survey_User_CreatedUserId_idx");

                entity.HasIndex(e => e.DeletedUserId, "FK_Survey_User_DeletedUserId_idx");

                entity.HasIndex(e => e.UpdatedUserId, "FK_Survey_User_UpdatedUserId_idx");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(256);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.SurveyCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Survey_User_CreatedUserId");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.SurveyDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_Survey_User_DeletedUserId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.SurveyUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_Survey_User_UpdatedUserId");
            });

            modelBuilder.Entity<Surveyoption>(entity =>
            {
                entity.ToTable("surveyoption");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Surveyquestion>(entity =>
            {
                entity.ToTable("surveyquestion");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(256);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Surveyresponse>(entity =>
            {
                entity.ToTable("surveyresponse");

                entity.HasIndex(e => e.SurveyQuestionId, "IX_QuestionId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Surveystatus>(entity =>
            {
                entity.ToTable("surveystatus");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Tag>(entity =>
            {
                entity.ToTable("tag");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(256);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Tagstatus>(entity =>
            {
                entity.ToTable("tagstatus");

                entity.HasIndex(e => new { e.Deleted, e.Code, e.Title, e.Updated }, "IX_Composite");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("user");

                entity.HasIndex(e => new { e.Email, e.Password, e.EmailVerified, e.ForgotPassword, e.Deleted, e.FailedLoginCount }, "IX_Composite_DeletedLogin")
                    .IsUnique();

                entity.HasIndex(e => new { e.Key, e.Password, e.EmailVerified, e.ForgotPassword, e.Deleted, e.FailedLoginCount }, "IX_Composite_Key")
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

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.EmailVerifiedIp).HasMaxLength(16);

                entity.Property(e => e.EmailVerifiedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.EmailVerifyKey).HasMaxLength(64);

                entity.Property(e => e.FailedLoginIp).HasMaxLength(16);

                entity.Property(e => e.FailedLoginUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.ForgotPasswordExpiryUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.ForgotPasswordIp).HasMaxLength(16);

                entity.Property(e => e.ForgotPasswordKey).HasMaxLength(64);

                entity.Property(e => e.ForgotPasswordUtc).HasMaxLength(64);

                entity.Property(e => e.ForgotResetIp).HasMaxLength(16);

                entity.Property(e => e.ForgotResetUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Key)
                    .IsRequired()
                    .HasMaxLength(64);

                entity.Property(e => e.LastLoginIp).HasMaxLength(16);

                entity.Property(e => e.LastLoginUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.MfaEnabledIp).HasMaxLength(16);

                entity.Property(e => e.MfaEnabledUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.MfaKey).HasMaxLength(128);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.InverseDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_Login_User_DeletedUserId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.InverseUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_Login_User_UpdatedUserId");
            });

            modelBuilder.Entity<Userrole>(entity =>
            {
                entity.ToTable("userrole");

                entity.HasIndex(e => new { e.UserId, e.RoleId, e.Deleted }, "IX_Composite");

                entity.HasIndex(e => e.CreatedUserId, "IX_CreatedUsedId");

                entity.HasIndex(e => e.DeletedUserId, "IX_DeletedUserId");

                entity.HasIndex(e => e.RoleId, "IX_RoleId");

                entity.HasIndex(e => e.UpdatedUserId, "IX_UpdatedUserId");

                entity.HasIndex(e => e.UserId, "IX_UserId");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

                entity.HasOne(d => d.CreatedUser)
                    .WithMany(p => p.UserroleCreatedUser)
                    .HasForeignKey(d => d.CreatedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserRole_User_CreatedUserId");

                entity.HasOne(d => d.DeletedUser)
                    .WithMany(p => p.UserroleDeletedUser)
                    .HasForeignKey(d => d.DeletedUserId)
                    .HasConstraintName("FK_UserRole_User_DeletedUserId");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Userrole)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserRole_Role_RoleId");

                entity.HasOne(d => d.UpdatedUser)
                    .WithMany(p => p.UserroleUpdatedUser)
                    .HasForeignKey(d => d.UpdatedUserId)
                    .HasConstraintName("FK_UserRole_User_UpdatedUserId");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserroleUser)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserRole_User_UserId");
            });

            modelBuilder.Entity<Vehicle>(entity =>
            {
                entity.ToTable("vehicle");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Vehicleattachment>(entity =>
            {
                entity.ToTable("vehicleattachment");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Url).HasMaxLength(256);
            });

            modelBuilder.Entity<Vehiclemake>(entity =>
            {
                entity.ToTable("vehiclemake");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Vehiclemodel>(entity =>
            {
                entity.ToTable("vehiclemodel");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Vehicleowner>(entity =>
            {
                entity.ToTable("vehicleowner");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<VehicleReaction>(entity =>
            {
                entity.ToTable("vehiclereaction");

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Emoji)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsFixedLength(true);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Vehiclestatus>(entity =>
            {
                entity.ToTable("vehiclestatus");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            modelBuilder.Entity<Vehiclevariant>(entity =>
            {
                entity.ToTable("vehiclevariant");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(16);

                entity.Property(e => e.CreatedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.DeletedIp).HasMaxLength(16);

                entity.Property(e => e.DeletedUtc).HasColumnType("datetime(6)");

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(16);

                entity.Property(e => e.UpdatedUtc).HasColumnType("datetime(6)");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
