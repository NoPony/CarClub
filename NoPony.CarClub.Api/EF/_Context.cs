using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace NoPony.CarClub.Api.EF
{
    // Scaffold-DbContext -Connection 'Host=localhost;Database=car_club;Uid=car_club_service;Pwd=password;' Npgsql.EntityFrameworkCore.PostgreSQL -OutputDir EF -Context CarClubContext -NoPluralize -Force

    public class Context : CarClubContext
    {
        private readonly ILoggerFactory _loggerFactory;

        public Context(ILoggerFactory loggerFactory)
        {
            _loggerFactory = loggerFactory;
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseLoggerFactory(_loggerFactory);
            optionsBuilder.UseNpgsql("Host=localhost;Database=car_club;Uid=car_club_api;Pwd=password;");
        }
    }
}
