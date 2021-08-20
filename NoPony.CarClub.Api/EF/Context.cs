using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace NoPony.CarClub.Api.EF
{
    public partial class Context : DbContext
    {
        public Context()
        {
        }

        public Context(DbContextOptions<Context> options)
            : base(options)
        {
        }

        public virtual DbSet<Event> Event { get; set; }
        public virtual DbSet<EventEntry> EventEntry { get; set; }
        public virtual DbSet<EventResult> EventResult { get; set; }
        public virtual DbSet<ForumBoard> ForumBoard { get; set; }
        public virtual DbSet<ForumBoardRole> ForumBoardRole { get; set; }
        public virtual DbSet<ForumCommentVote> ForumCommentVote { get; set; }
        public virtual DbSet<ForumMessage> ForumMessage { get; set; }
        public virtual DbSet<ForumPost> ForumPost { get; set; }
        public virtual DbSet<ForumPostVote> ForumPostVote { get; set; }
        public virtual DbSet<Invoice> Invoice { get; set; }
        public virtual DbSet<InvoiceDetail> InvoiceDetail { get; set; }
        public virtual DbSet<Permission> Permission { get; set; }
        public virtual DbSet<Question> Question { get; set; }
        public virtual DbSet<Response> Response { get; set; }
        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<RolePermission> RolePermission { get; set; }
        public virtual DbSet<Survey> Survey { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<UserAccount> UserAccount { get; set; }
        public virtual DbSet<UserRole> UserRole { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=.\\;Database=CarClub;Integrated Security=SSPI;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Event>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();
            });

            modelBuilder.Entity<EventEntry>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();
            });

            modelBuilder.Entity<EventResult>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();
            });


            modelBuilder.Entity<ForumCommentVote>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();
            });

            modelBuilder.Entity<ForumMessage>(entity =>
            {
                entity.Property(e => e.Content).IsRequired();
            });

            modelBuilder.Entity<ForumPostVote>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();
            });

            modelBuilder.Entity<Invoice>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();
            });

            modelBuilder.Entity<InvoiceDetail>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();
            });

            modelBuilder.Entity<Question>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();
            });

            modelBuilder.Entity<Response>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(16)
                    .IsFixedLength(true);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(1024);
            });

            modelBuilder.Entity<RolePermission>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();
            });

            modelBuilder.Entity<Survey>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.HasIndex(e => new { e.Key, e.Deleted }, "IX_User_Key");

                //entity.HasIndex(e => new { e.Login, e.Deleted }, "IX_User_Login");

                entity.HasIndex(e => e.Key, "UQ_User_Key")
                    .IsUnique();

                //entity.Property(e => e.Login)
                //    .IsRequired()
                //    .HasMaxLength(128);

                entity.Property(e => e.EmailVerifyKey)
                    .HasMaxLength(4)
                    .IsFixedLength(true);

                entity.Property(e => e.MfaKey).HasMaxLength(128);


                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(128);

            });

            modelBuilder.Entity<UserAccount>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedUserId)
                    .HasMaxLength(10)
                    .IsFixedLength(true);

                entity.Property(e => e.CreatedUtc)
                    .HasMaxLength(10)
                    .IsFixedLength(true);

                entity.Property(e => e.Credit)
                    .HasMaxLength(10)
                    .IsFixedLength(true);

                entity.Property(e => e.Debit)
                    .HasMaxLength(10)
                    .IsFixedLength(true);

                entity.Property(e => e.Description)
                    .HasMaxLength(10)
                    .IsFixedLength(true);

                entity.Property(e => e.UpdatedUserId)
                    .HasMaxLength(10)
                    .IsFixedLength(true);

                entity.Property(e => e.UpdatedUtc)
                    .HasMaxLength(10)
                    .IsFixedLength(true);
            });


            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
