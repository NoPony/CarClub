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
        public virtual DbSet<BoardPermission> BoardPermission { get; set; }
        public virtual DbSet<BoardStatus> BoardStatus { get; set; }
        public virtual DbSet<Event> Event { get; set; }
        public virtual DbSet<EventAttachment> EventAttachment { get; set; }
        public virtual DbSet<EventOfficial> EventOfficial { get; set; }
        public virtual DbSet<EventPermission> EventPermission { get; set; }
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
        public virtual DbSet<Login> Login { get; set; }
        public virtual DbSet<Login1> Login1 { get; set; }
        public virtual DbSet<LoginRole> LoginRole { get; set; }
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
        public virtual DbSet<MemberRole> MemberRole { get; set; }
        public virtual DbSet<MemberTransaction> MemberTransaction { get; set; }
        public virtual DbSet<MemberVehicle> MemberVehicle { get; set; }
        public virtual DbSet<Office> Office { get; set; }
        public virtual DbSet<Penalty> Penalty { get; set; }
        public virtual DbSet<PenaltyAttachment> PenaltyAttachment { get; set; }
        public virtual DbSet<PenaltyReaction> PenaltyReaction { get; set; }
        public virtual DbSet<Permission> Permission { get; set; }
        public virtual DbSet<Permission1> Permission1 { get; set; }
        public virtual DbSet<Poll> Poll { get; set; }
        public virtual DbSet<PollAttachment> PollAttachment { get; set; }
        public virtual DbSet<PollOption> PollOption { get; set; }
        public virtual DbSet<PollOptionStatus> PollOptionStatus { get; set; }
        public virtual DbSet<PollStatus> PollStatus { get; set; }
        public virtual DbSet<Post> Post { get; set; }
        public virtual DbSet<PostAttachment> PostAttachment { get; set; }
        public virtual DbSet<PostMention> PostMention { get; set; }
        public virtual DbSet<PostReaction> PostReaction { get; set; }
        public virtual DbSet<PostTag> PostTag { get; set; }
        public virtual DbSet<Qualification> Qualification { get; set; }
        public virtual DbSet<Reaction> Reaction { get; set; }
        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<Role1> Role1 { get; set; }
        public virtual DbSet<RolePermission> RolePermission { get; set; }
        public virtual DbSet<RolePermission1> RolePermission1 { get; set; }
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
        public virtual DbSet<Thread> Thread { get; set; }
        public virtual DbSet<ThreadStatus> ThreadStatus { get; set; }
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
                entity.HasIndex(e => new { e.Deleted, e.CreatorId, e.OwnerId, e.StatusId }, "IX_Composite");

                entity.HasIndex(e => e.CreatorId, "IX_CreatorId");

                entity.HasIndex(e => e.OwnerId, "IX_OwnerId");

                entity.HasIndex(e => e.StatusId, "IX_StatusId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.HasOne(d => d.Creator)
                    .WithMany(p => p.BoardCreator)
                    .HasForeignKey(d => d.CreatorId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Owner)
                    .WithMany(p => p.BoardOwner)
                    .HasForeignKey(d => d.OwnerId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.Board)
                    .HasForeignKey(d => d.StatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<BoardPermission>(entity =>
            {
                entity.HasNoKey();

                entity.HasIndex(e => e.BoardId, "IX_BoardId");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<BoardStatus>(entity =>
            {
                entity.HasIndex(e => e.Code, "IX_Code");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<Event>(entity =>
            {
                entity.HasIndex(e => e.MeetId, "IX_MeetId");

                entity.HasIndex(e => e.StatusId, "IX_StatusId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(256);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.HasOne(d => d.Meet)
                    .WithMany(p => p.Event)
                    .HasForeignKey(d => d.MeetId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.Event)
                    .HasForeignKey(d => d.StatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<EventAttachment>(entity =>
            {
                entity.HasIndex(e => e.EventId, "IX_EventId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.Title).HasMaxLength(256);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.Property(e => e.UploadIp).HasMaxLength(16);

                entity.Property(e => e.Url).HasMaxLength(256);

                entity.HasOne(d => d.Event)
                    .WithMany(p => p.EventAttachment)
                    .HasForeignKey(d => d.EventId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<EventOfficial>(entity =>
            {
                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.HasOne(d => d.Event)
                    .WithMany(p => p.EventOfficial)
                    .HasForeignKey(d => d.EventId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.EventOfficial)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Office)
                    .WithMany(p => p.EventOfficial)
                    .HasForeignKey(d => d.OfficeId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<EventPermission>(entity =>
            {
                entity.HasNoKey();

                entity.HasIndex(e => e.EventId, "IX_EventId");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<EventReaction>(entity =>
            {
                entity.HasIndex(e => e.EventId, "IX_EventId");

                entity.HasIndex(e => e.MemberId, "IX_MemberId");

                entity.HasIndex(e => e.ReactionId, "IX_Reaction");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.HasOne(d => d.Event)
                    .WithMany(p => p.EventReaction)
                    .HasForeignKey(d => d.EventId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.EventReaction)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Reaction)
                    .WithMany(p => p.EventReaction)
                    .HasForeignKey(d => d.ReactionId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<EventStatus>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<EventTag>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<Grid>(entity =>
            {
                entity.HasIndex(e => e.MemberId, "IX_DriverId");

                entity.HasIndex(e => e.HeatId, "IX_HeatId");

                entity.HasIndex(e => e.VehicleId, "IX_Vehicle");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.HasOne(d => d.Heat)
                    .WithMany(p => p.Grid)
                    .HasForeignKey(d => d.HeatId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<GridReaction>(entity =>
            {
                entity.HasIndex(e => e.GridId, "IX_GridId");

                entity.HasIndex(e => e.MemberId, "IX_MemberId");

                entity.HasIndex(e => e.ReactionId, "IX_Reaction");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.HasOne(d => d.Grid)
                    .WithMany(p => p.GridReaction)
                    .HasForeignKey(d => d.GridId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.GridReaction)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Reaction)
                    .WithMany(p => p.GridReaction)
                    .HasForeignKey(d => d.ReactionId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<Heat>(entity =>
            {
                entity.HasIndex(e => e.EventId, "IX_EventId");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.HasOne(d => d.Event)
                    .WithMany(p => p.Heat)
                    .HasForeignKey(d => d.EventId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<HeatAttachment>(entity =>
            {
                entity.HasIndex(e => e.HeatId, "IX_HeatId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.Title).HasMaxLength(256);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.Property(e => e.UploadIp).HasMaxLength(16);

                entity.Property(e => e.Url).HasMaxLength(256);

                entity.HasOne(d => d.Heat)
                    .WithMany(p => p.HeatAttachment)
                    .HasForeignKey(d => d.HeatId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<HeatPenaltyStatus>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<HeatReaction>(entity =>
            {
                entity.HasIndex(e => e.HeatId, "IX_HeatId");

                entity.HasIndex(e => e.MemberId, "IX_MemberId");

                entity.HasIndex(e => e.ReactionId, "IX_Reaction");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.HasOne(d => d.Heat)
                    .WithMany(p => p.HeatReaction)
                    .HasForeignKey(d => d.HeatId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.HeatReaction)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Reaction)
                    .WithMany(p => p.HeatReaction)
                    .HasForeignKey(d => d.ReactionId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<HeatStatus>(entity =>
            {
                entity.HasIndex(e => new { e.Deleted, e.Code }, "IX_Composite");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<HeatTag>(entity =>
            {
                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<Invoice>(entity =>
            {
                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<InvoiceDetail>(entity =>
            {
                entity.HasIndex(e => new { e.Deleted, e.StockId }, "IX_Composite");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Quantity).HasColumnType("decimal(18, 6)");

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<InvoiceStatus>(entity =>
            {
                entity.HasIndex(e => new { e.Deleted, e.Code }, "IX_Composite");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<Lap>(entity =>
            {
                entity.HasIndex(e => e.HeatId, "IX_HeatId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.EndTimeBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.EndTimeIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.EndTimeMs).HasColumnType("decimal(18, 6)");

                entity.Property(e => e.PositionBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.PositionIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.StartTimeBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.StartTimeIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.StartTimeMs).HasColumnType("decimal(18, 6)");

                entity.Property(e => e.TimeBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.TimeIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.TimeMs).HasColumnType("decimal(18, 6)");

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.HasOne(d => d.Heat)
                    .WithMany(p => p.Lap)
                    .HasForeignKey(d => d.HeatId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_HeatResultLap_HeatResult_ResultId");
            });

            modelBuilder.Entity<LapReaction>(entity =>
            {
                entity.HasIndex(e => e.LapId, "IX_LapId");

                entity.HasIndex(e => e.MemberId, "IX_MemberId");

                entity.HasIndex(e => e.ReactionId, "IX_Reaction");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.HasOne(d => d.Lap)
                    .WithMany(p => p.LapReaction)
                    .HasForeignKey(d => d.LapId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.LapReaction)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Reaction)
                    .WithMany(p => p.LapReaction)
                    .HasForeignKey(d => d.ReactionId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<LapStatus>(entity =>
            {
                entity.HasIndex(e => new { e.Deleted, e.Code }, "IX_Composite");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<LapTag>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<Login>(entity =>
            {
                entity.ToTable("Login", "auth");

                entity.HasIndex(e => new { e.Deleted, e.Key }, "IX_Composite_DeletedKey")
                    .IsUnique();

                entity.HasIndex(e => new { e.Deleted, e.Login1 }, "IX_Composite_DeletedLogin")
                    .IsUnique();

                entity.HasIndex(e => e.Login1, "UQ_Login_Email")
                    .IsUnique();

                entity.HasIndex(e => e.Key, "UQ_Login_Key")
                    .IsUnique();

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.EmailVerifiedIp).HasMaxLength(32);

                entity.Property(e => e.EmailVerifyIp).HasMaxLength(32);

                entity.Property(e => e.FailedLoginIp).HasMaxLength(32);

                entity.Property(e => e.ForgotPasswordIp).HasMaxLength(32);

                entity.Property(e => e.ForgotResetIp).HasMaxLength(32);

                entity.Property(e => e.LastLoginIp).HasMaxLength(32);

                entity.Property(e => e.Login1)
                    .IsRequired()
                    .HasMaxLength(128)
                    .HasColumnName("Login");

                entity.Property(e => e.MfaEnabledIp).HasMaxLength(32);

                entity.Property(e => e.MfaEnabledUtc).HasColumnType("datetime");

                entity.Property(e => e.MfaKey).HasMaxLength(128);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<Login1>(entity =>
            {
                entity.ToTable("Login");

                entity.HasIndex(e => new { e.Deleted, e.Key }, "IX_Composite_DeletedKey")
                    .IsUnique();

                entity.HasIndex(e => new { e.Deleted, e.Login }, "IX_Composite_DeletedLogin")
                    .IsUnique();

                entity.HasIndex(e => e.Login, "UQ_Login_Email")
                    .IsUnique();

                entity.HasIndex(e => e.Key, "UQ_Login_Key")
                    .IsUnique();

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.EmailVerifiedIp).HasMaxLength(32);

                entity.Property(e => e.EmailVerifyIp).HasMaxLength(32);

                entity.Property(e => e.FailedLoginIp).HasMaxLength(32);

                entity.Property(e => e.ForgotPasswordIp).HasMaxLength(32);

                entity.Property(e => e.ForgotResetIp).HasMaxLength(32);

                entity.Property(e => e.LastLoginIp).HasMaxLength(32);

                entity.Property(e => e.Login)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.MfaEnabledIp).HasMaxLength(32);

                entity.Property(e => e.MfaEnabledUtc).HasColumnType("datetime");

                entity.Property(e => e.MfaKey).HasMaxLength(128);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<LoginRole>(entity =>
            {
                entity.ToTable("LoginRole", "auth");

                entity.HasIndex(e => new { e.Deleted, e.LoginId, e.RoleId }, "IX_Composite");

                entity.HasIndex(e => e.LoginId, "IX_MemberId");

                entity.HasIndex(e => e.RoleId, "IX_RoleId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.HasOne(d => d.Login)
                    .WithMany(p => p.LoginRole)
                    .HasForeignKey(d => d.LoginId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_MemberRole_Member_UserId");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.LoginRole)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_MemberRole_Role_RoleId");
            });

            modelBuilder.Entity<Meet>(entity =>
            {
                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.HasOne(d => d.MeetStatus)
                    .WithMany(p => p.Meet)
                    .HasForeignKey(d => d.MeetStatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Meet_MeetStatusId");
            });

            modelBuilder.Entity<MeetAttachment>(entity =>
            {
                entity.HasIndex(e => e.MeetId, "IX_MeetId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.Title).HasMaxLength(256);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.Property(e => e.UploadIp).HasMaxLength(16);

                entity.Property(e => e.Url).HasMaxLength(256);

                entity.HasOne(d => d.Meet)
                    .WithMany(p => p.MeetAttachment)
                    .HasForeignKey(d => d.MeetId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<MeetOfficial>(entity =>
            {
                entity.HasIndex(e => e.MeetId, "IX_MeetId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

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
            });

            modelBuilder.Entity<MeetReaction>(entity =>
            {
                entity.HasIndex(e => e.MeetId, "IX_MeetId");

                entity.HasIndex(e => e.MemberId, "IX_MemberId");

                entity.HasIndex(e => e.ReactionId, "IX_Reaction");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.HasOne(d => d.Meet)
                    .WithMany(p => p.MeetReaction)
                    .HasForeignKey(d => d.MeetId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.MeetReaction)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Reaction)
                    .WithMany(p => p.MeetReaction)
                    .HasForeignKey(d => d.ReactionId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<MeetStatus>(entity =>
            {
                entity.HasIndex(e => e.Code, "IX_Composit");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<MeetTag>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<Member>(entity =>
            {
                entity.HasIndex(e => e.UserKey, "IX_Key");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

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

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<MemberEvent>(entity =>
            {
                entity.HasIndex(e => e.EventId, "IX_EventId");

                entity.HasIndex(e => e.MemberId, "IX_MemberId");

                entity.Property(e => e.CheckinBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CheckinIp).HasMaxLength(32);

                entity.Property(e => e.CheckoutBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CheckoutIp).HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.OffTrackBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.OffTrackIp).HasMaxLength(32);

                entity.Property(e => e.OnTrackBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.OnTrackIp).HasMaxLength(32);

                entity.Property(e => e.RegisterBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.RegisterIp).HasMaxLength(32);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

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

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.Property(e => e.UploadBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UploadIp).HasMaxLength(16);

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

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
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
                    .HasMaxLength(32);

                entity.Property(e => e.CheckoutBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CheckoutIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.EnterBy).HasMaxLength(128);

                entity.Property(e => e.EnterIp).HasMaxLength(32);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

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
                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.Property(e => e.UploadBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UploadIp).HasMaxLength(32);

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

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<MemberOffice>(entity =>
            {
                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<MemberQualification>(entity =>
            {
                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<MemberRole>(entity =>
            {
                entity.HasIndex(e => new { e.Deleted, e.MemberId, e.RoleId }, "IX_Composite");

                entity.HasIndex(e => e.MemberId, "IX_MemberId");

                entity.HasIndex(e => e.RoleId, "IX_RoleId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.MemberRole)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_MemberRole_Member_UserId");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.MemberRole)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<MemberTransaction>(entity =>
            {
                entity.HasIndex(e => e.MemberId, "IX_MemberId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.Credit).HasColumnType("money");

                entity.Property(e => e.Debit).HasColumnType("money");

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasMaxLength(256);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.MemberTransaction)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<MemberVehicle>(entity =>
            {
                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<Office>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<Penalty>(entity =>
            {
                entity.Property(e => e.Code).HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Notes).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(64);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

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

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

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

                entity.HasIndex(e => e.ReactionId, "IX_Reaction");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.PenaltyReaction)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Penalty)
                    .WithMany(p => p.PenaltyReaction)
                    .HasForeignKey(d => d.PenaltyId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Reaction)
                    .WithMany(p => p.PenaltyReaction)
                    .HasForeignKey(d => d.ReactionId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<Permission>(entity =>
            {
                entity.ToTable("Permission", "auth");

                entity.HasIndex(e => new { e.Deleted, e.Code }, "IX_Composite");

                entity.Property(e => e.Code).HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<Permission1>(entity =>
            {
                entity.ToTable("Permission");

                entity.HasIndex(e => new { e.Deleted, e.Code }, "IX_Composite");

                entity.Property(e => e.Code).HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<Poll>(entity =>
            {
                entity.HasIndex(e => e.StatusId, "IX_StatusId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.OpenBy).HasMaxLength(128);

                entity.Property(e => e.OpenIp).HasMaxLength(32);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.Poll)
                    .HasForeignKey(d => d.StatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<PollAttachment>(entity =>
            {
                entity.HasIndex(e => e.PollId, "IX_PollId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.Property(e => e.UploadBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UploadIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.Url).HasMaxLength(256);

                entity.HasOne(d => d.Poll)
                    .WithMany(p => p.PollAttachment)
                    .HasForeignKey(d => d.PollId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<PollOption>(entity =>
            {
                entity.HasIndex(e => e.PollId, "IX_PollId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.HasOne(d => d.Poll)
                    .WithMany(p => p.PollOption)
                    .HasForeignKey(d => d.PollId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PollOption_Poll_PollOptionId");
            });

            modelBuilder.Entity<PollOptionStatus>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<PollStatus>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<Post>(entity =>
            {
                entity.HasIndex(e => e.ParentId, "IX_Parent");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.HasOne(d => d.Parent)
                    .WithMany(p => p.InverseParent)
                    .HasForeignKey(d => d.ParentId);
            });

            modelBuilder.Entity<PostAttachment>(entity =>
            {
                entity.HasIndex(e => e.PostId, "IX_PostId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.Url).HasMaxLength(256);

                entity.HasOne(d => d.Post)
                    .WithMany(p => p.PostAttachment)
                    .HasForeignKey(d => d.PostId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<PostMention>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();
            });

            modelBuilder.Entity<PostReaction>(entity =>
            {
                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.PostReaction)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Post)
                    .WithMany(p => p.PostReaction)
                    .HasForeignKey(d => d.PostId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Reaction)
                    .WithMany(p => p.PostReaction)
                    .HasForeignKey(d => d.ReactionId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<PostTag>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();
            });

            modelBuilder.Entity<Qualification>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();
            });

            modelBuilder.Entity<Reaction>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.ImageUrl)
                    .IsRequired()
                    .HasMaxLength(256);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.Url).HasMaxLength(256);
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("Role", "auth");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(1024);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);
            });

            modelBuilder.Entity<Role1>(entity =>
            {
                entity.ToTable("Role");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(1024);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);
            });

            modelBuilder.Entity<RolePermission>(entity =>
            {
                entity.ToTable("RolePermission", "auth");

                entity.HasIndex(e => new { e.Deleted, e.RoleId, e.PermissionId }, "IX_Composite");

                entity.HasIndex(e => e.PermissionId, "IX_PermissionId");

                entity.HasIndex(e => e.RoleId, "IX_RoleId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<RolePermission1>(entity =>
            {
                entity.ToTable("RolePermission");

                entity.HasIndex(e => new { e.Deleted, e.RoleId, e.PermissionId }, "IX_Composite");

                entity.HasIndex(e => e.PermissionId, "IX_PermissionId");

                entity.HasIndex(e => e.RoleId, "IX_RoleId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<Season>(entity =>
            {
                entity.HasIndex(e => e.StatusId, "IX_StatusId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.Season)
                    .HasForeignKey(d => d.StatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<SeasonAttachment>(entity =>
            {
                entity.HasIndex(e => e.SeasonId, "IX_SeasonId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.Url).HasMaxLength(256);

                entity.HasOne(d => d.Season)
                    .WithMany(p => p.SeasonAttachment)
                    .HasForeignKey(d => d.SeasonId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<SeasonEvent>(entity =>
            {
                entity.HasIndex(e => e.SeasonId, "IX_SeasonId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

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

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

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

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<SeasonStatus>(entity =>
            {
                entity.HasIndex(e => new { e.Deleted, e.Code }, "IX_Composite");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<Survey>(entity =>
            {
                entity.HasIndex(e => e.CreatorId, "IX_CreatorId");

                entity.HasIndex(e => e.OwnerId, "IX_OwnerId");

                entity.HasIndex(e => e.StatusId, "IX_StatusId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(256);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

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

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.HasOne(d => d.Question)
                    .WithMany(p => p.SurveyOption)
                    .HasForeignKey(d => d.QuestionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ServeyOption_SurveyQuestion_QuestionId");
            });

            modelBuilder.Entity<SurveyQuestion>(entity =>
            {
                entity.HasIndex(e => e.SurveyId, "IX_ServeyId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(256);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

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

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

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

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<Tag>(entity =>
            {
                entity.HasIndex(e => e.CreatorId, "IX_CreatorId");

                entity.HasIndex(e => e.OwnerId, "IX_OwnerId");

                entity.HasIndex(e => e.StatusId, "IX_StatusId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(256);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

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

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<Thread>(entity =>
            {
                entity.HasIndex(e => e.StatusId, "IX_StatusId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.LockedBy).HasMaxLength(128);

                entity.Property(e => e.LockedIp).HasMaxLength(32);

                entity.Property(e => e.LockedNote).HasMaxLength(1024);

                entity.Property(e => e.PinnedBy).HasMaxLength(128);

                entity.Property(e => e.PinnedIp).HasMaxLength(32);

                entity.Property(e => e.PinnedNote).HasMaxLength(1024);

                entity.Property(e => e.UnlockedBy).HasMaxLength(128);

                entity.Property(e => e.UnlockedIp).HasMaxLength(32);

                entity.Property(e => e.UnlockedNote).HasMaxLength(1024);

                entity.Property(e => e.UnpinnedBy).HasMaxLength(128);

                entity.Property(e => e.UnpinnedIp).HasMaxLength(32);

                entity.Property(e => e.UnpinnedNote).HasMaxLength(1024);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.Thread)
                    .HasForeignKey(d => d.StatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<ThreadStatus>(entity =>
            {
                entity.HasIndex(e => e.Code, "UQ_ThreadStatus_Code")
                    .IsUnique();

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.HasIndex(e => new { e.Deleted, e.Key }, "IX_Composite_DeletedKey")
                    .IsUnique();

                entity.HasIndex(e => new { e.Deleted, e.Email }, "IX_Key")
                    .IsUnique();

                entity.HasIndex(e => e.Key, "IX_User_Key");

                entity.HasIndex(e => e.Email, "UQ_User_Email")
                    .IsUnique();

                entity.HasIndex(e => e.Key, "UQ_User_Key")
                    .IsUnique();

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.EmailVerifiedIp).HasMaxLength(32);

                entity.Property(e => e.EmailVerifyIp).HasMaxLength(32);

                entity.Property(e => e.FailedLoginIp).HasMaxLength(32);

                entity.Property(e => e.ForgotPasswordIp).HasMaxLength(32);

                entity.Property(e => e.ForgotResetIp).HasMaxLength(32);

                entity.Property(e => e.LastLoginIp).HasMaxLength(32);

                entity.Property(e => e.MfaEnabledUtc).HasColumnType("datetime");

                entity.Property(e => e.MfaKey).HasMaxLength(128);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<UserRole>(entity =>
            {
                entity.HasIndex(e => new { e.UserId, e.RoleId }, "IX_Composite");

                entity.HasIndex(e => e.RoleId, "IX_RoleId");

                entity.HasIndex(e => e.UserId, "IX_UserId");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.UserRole)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserRole)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<Vehicle>(entity =>
            {
                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

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

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.Filename).HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

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

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<VehicleModel>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

                entity.HasOne(d => d.Make)
                    .WithMany(p => p.VehicleModel)
                    .HasForeignKey(d => d.MakeId)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<VehicleOwner>(entity =>
            {
                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<VehicleReaction>(entity =>
            {
                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.VehicleReaction)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Reaction)
                    .WithMany(p => p.VehicleReaction)
                    .HasForeignKey(d => d.ReactionId)
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

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);
            });

            modelBuilder.Entity<VehicleVariant>(entity =>
            {
                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.CreatedIp)
                    .IsRequired()
                    .HasMaxLength(32);

                entity.Property(e => e.DeletedBy).HasMaxLength(128);

                entity.Property(e => e.DeletedIp).HasMaxLength(32);

                entity.Property(e => e.Note).HasMaxLength(1024);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.UpdatedBy).HasMaxLength(128);

                entity.Property(e => e.UpdatedIp).HasMaxLength(32);

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
