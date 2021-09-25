using Microsoft.EntityFrameworkCore;

namespace NoPony.CarClub.Api.EF
{
    public class Context : CarClubContext
    {
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            { }
        }
    }
}
