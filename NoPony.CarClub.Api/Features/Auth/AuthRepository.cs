using Microsoft.EntityFrameworkCore;
using NoPony.CarClub.Api.EF;
using NoPony.CarClub.Api.Features.Auth.Dto;
using NoPony.CarClub.Api.Features.Auth.Record;
using NoPony.CarClub.Api.Features.User.Record;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.User
{
    public class AuthRepository : IAuthRepository
    {
        public async Task<AuthRegisterRecord> Register(AuthRegisterRequestRecord request)
        {
            try
            {
                using (Context context = new Context())
                {
                    await context.User.AddAsync(new EF.User
                    {
                        Key = request.Key,
                        Email = request.Login,
                        Password = request.Password,
                        CreatedBy = request.Key.ToString(),
                        CreatedUtc = DateTime.UtcNow,
                    });

                    await context.SaveChangesAsync();

                    return new AuthRegisterRecord();
                }
            }

            catch (Exception)
            {
                return new AuthRegisterRecord();
            }
        }

        public async Task<AuthEmailVerifyRecord> EmailVerify(Guid? verifyKey)
        {
            try
            {
                using (Context context = new Context())
                {
                    if (!await context.User.AnyAsync(i => i.EmailVerifyKey == verifyKey))
                    {
                        return null;
                    }

                    EF.User record = await context.User
                        .SingleAsync(i => i.EmailVerifyKey == verifyKey);

                    record.EmailVerify = false;
                    record.EmailVerifiedUtc = DateTime.UtcNow;
                    record.EmailVerifyKey = null;
                    record.FailedLoginCount = 0;

                    await context.SaveChangesAsync();

                    return new AuthEmailVerifyRecord();
                }
            }

            catch (Exception)
            {
                throw;
            }
        }

        public async Task<AuthLoginRecord> Login(string Email)
        {
            using (Context context = new Context())
            {
                return await context.User
                    //.Where(i => i.Login == Email)
                    .Where(i => i.Deleted == false)
                    .Where(i => i.FailedLoginCount < 5)
                    .Select(i => new AuthLoginRecord
                    {
                        Key = i.Key,
                        Password = i.Password,
                        MfaKey = i.MfaKey,
                    })
                    .SingleAsync();
            }
        }

        public async Task LoginPass(Guid? Key)
        {
            using (Context context = new Context())
            {
                EF.User record = await context.User
                    .SingleAsync(i => i.Key == Key);

                record.FailedLoginCount = 0;

                await context.SaveChangesAsync();
            }
        }

        public async Task LoginFail(Guid? Key)
        {
            using (Context context = new Context())
            {
                EF.User account = await context.User
                    .SingleAsync(i => i.Key == Key);

                account.FailedLoginCount++;

                await context.SaveChangesAsync();
            }
        }

        public async Task<AuthDetailsRecord> GetDetails(Guid? Key)
        {
            try
            {
                using (Context context = new Context())
                {
                    return await context.User
                        .Where(i => i.Key == Key)
                        .Where(i => i.Deleted == false)
                        .Where(i => i.FailedLoginCount < 5)
                        .Select(i => new AuthDetailsRecord
                        {
                            //Permissions = i.,
                        })
                        .SingleOrDefaultAsync();
                }
            }

            catch (Exception)
            {
                return new AuthDetailsRecord();
            }
        }
    }
}
