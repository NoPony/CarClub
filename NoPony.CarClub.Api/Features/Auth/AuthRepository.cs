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
        public AuthRegisterRecord Register(AuthRegisterModel request)
        {
            using (CarClubContext context = new CarClubContext())
            {
                context.User.Add(new EF.User
                {
                    Key = request.Key,
                    Email = request.Login,
                    Password = request.Password,
                    CreatedIp = request.ClientIp,
                    CreatedBy = request.Key.ToString(),
                    CreatedUtc = DateTime.UtcNow,
                });

                context.SaveChanges();

                return new AuthRegisterRecord();
            }
        }

        public AuthVerifyRecord Verify(string ClientIp, Guid? verifyKey)
        {
            using (CarClubContext context = new CarClubContext())
            {
                if (!context.User.Any(i => i.EmailVerifyKey == verifyKey))
                    return null;

                EF.User record = context.User
                    .Single(i => i.EmailVerifyKey == verifyKey);

                record.EmailVerify = true;
                record.EmailVerifiedIp = ClientIp;
                record.EmailVerifiedUtc = DateTime.UtcNow;
                record.EmailVerifyKey = null;
                record.FailedLoginCount = 0;

                context.SaveChanges();

                return new AuthVerifyRecord();
            }
        }

        public bool TryLoginStart(string ClientIp, string Email, out AuthLoginRecord result)
        {
            using (CarClubContext context = new CarClubContext())
            {
                result = context.User
                    .Where(i => i.Email == Email)
                    .Where(i => i.Deleted == false)
                    .Where(i => i.FailedLoginCount < 5)
                    .Select(i => new AuthLoginRecord
                    {
                        Key = i.Key,
                        Password = i.Password,
                        MfaKey = i.MfaKey,
                    })
                    .Single();

                return true;
            }
        }

        public void LoginPass(Guid? Key)
        {
            using (CarClubContext context = new CarClubContext())
            {
                EF.User record = context.User
                    .Single(i => i.Key == Key);

                record.FailedLoginCount = 0;

                context.SaveChanges();
            }
        }

        public void LoginFail(Guid? Key)
        {
            using (CarClubContext context = new CarClubContext())
            {
                EF.User account = context.User
                    .Single(i => i.Key == Key);

                account.FailedLoginCount++;

                context.SaveChanges();
            }
        }

        public AuthDetailsRecord GetDetails(Guid? Key)
        {
            using (CarClubContext context = new CarClubContext())
            {
                return context.User
                    .Where(i => i.Key == Key)
                    .Where(i => i.Deleted == false)
                    .Where(i => i.FailedLoginCount < 5)
                    .Select(i => new AuthDetailsRecord
                    {
                        //Permissions = i.,
                    })
                    .SingleOrDefault();
            }
        }
    }
}
