using Microsoft.EntityFrameworkCore;
using NoPony.CarClub.Api.EF;
using NoPony.CarClub.Api.Features.User.Record;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.User
{
    public class UserRepository : IAccountRepository
    {
        public async Task<TryResult<AccountLoginRecord>> TryRegister(AccountRegisterRequestRecord request)
        {
            try
            {
                using (Context context = new Context())
                {
                    await context.User.AddAsync(new EF.User
                    {
                        Key = request.Key,
                        Email = request.Email,
                        Password = request.Password,
                        //FullName = request.FullName,
                        //PreferredName = request.PreferredName,
                        //Phone = request.Phone,
                        //Mobile = request.Mobile,
                        //Street = request.Street,
                        //Suburb = request.Suburb,
                        //Postcode = request.Postcode,
                        //State = request.State,
                        CreatedBy = request.Key.ToString(),
                        CreatedUtc = DateTime.UtcNow,
                    });

                    await context.SaveChangesAsync();

                    return new TryResult<AccountLoginRecord>(true, new AccountLoginRecord
                    {
                        Key = request.Key,
                        Password = request.Password,
                        MfaKey = null,
                    });
                }
            }

            catch (Exception)
            {
                return new TryResult<AccountLoginRecord>(false, null);
            }
        }

        public async Task<TryResult<Guid?>> TryVerifyEmail(Guid? verifyKey)
        {
            try
            {
                using (Context context = new Context())
                {
                    if (!await context.User
                        .AnyAsync(i => i.EmailVerifyKey == verifyKey))
                    {
                        return new TryResult<Guid?>(false, null);
                    }

                    EF.User record = await context.User
                        .SingleAsync(i => i.EmailVerifyKey == verifyKey);

                    record.EmailVerify = false;
                    record.EmailVerifiedUtc = DateTime.UtcNow;
                    record.EmailVerifyKey = null;
                    record.FailedLoginCount = 0;

                    await context.SaveChangesAsync();

                    return new TryResult<Guid?>(true, record.Key);
                }
            }

            catch (Exception)
            {
                return new TryResult<Guid?>(false, null);
            }
        }

        public async Task<TryResult<AccountLoginRecord>> TryLogin(string Email)
        {
            using (Context context = new Context())
            {
                return new TryResult<AccountLoginRecord>(true, await context.User
                    .Where(i => i.Email == Email)
                    .Where(i => i.Deleted == false)
                    .Where(i => i.FailedLoginCount < 5)
                    .Select(i => new AccountLoginRecord
                    {
                        Key = i.Key,
                        Password = i.Password,
                        MfaKey = i.MfaKey,
                    })
                    .SingleAsync());
            }
        }

        public async Task<bool> TryLoginPass(Guid? Key)
        {
            try
            {
                using (Context context = new Context())
                {
                    EF.User record = await context.User
                        .SingleAsync(i => i.Key == Key);

                    record.FailedLoginCount = 0;

                    await context.SaveChangesAsync();

                    return true;
                }
            }

            catch (Exception)
            {
                return false;
            }
        }

        public async Task<bool> TryLoginFail(Guid? Key)
        {
            try
            {
                using (Context context = new Context())
                {
                    EF.User record = await context.User
                        .SingleAsync(i => i.Key == Key);

                    record.FailedLoginCount++;

                    await context.SaveChangesAsync();

                    return true;
                }
            }

            catch (Exception)
            {
                return false;
            }
        }

        public async Task<TryResult<AccountDetailsRecord>> TryGetDetails(Guid? Key)
        {
            try
            {
                using (Context context = new Context())
                {
                    return new TryResult<AccountDetailsRecord>(true, await context.User
                        .Where(i => i.Key == Key)
                        .Where(i => i.Deleted == false)
                        .Where(i => i.FailedLoginCount < 5)
                        .Select(i => new AccountDetailsRecord
                        {
                            //FullName = i.FullName,
                            //PreferredName = i.PreferredName,
                            Permissions = null,
                        })
                        .SingleOrDefaultAsync());
                }
            }

            catch (Exception)
            {
                return new TryResult<AccountDetailsRecord>(false, null);
            }
        }
    }
}
