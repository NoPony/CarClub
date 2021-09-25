using Microsoft.EntityFrameworkCore.Storage;
using NoPony.CarClub.Api.EF;
using NoPony.CarClub.Api.Features.Auth.Record;
using Serilog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;

namespace NoPony.CarClub.Api.Features.Auth
{
    public class AuthRepository : IAuthRepository
    {
        private readonly ILogger _log;

        public AuthRepository(ILogger log)
        {
            _log = log ?? throw new ArgumentNullException(nameof(log));
        }

        public bool TryRegister(IPAddress clientIp, string email, string password, out AuthRegisterModel result)
        {
            using (CarClubContext context = new CarClubContext())
            {
                Guid loginKey = Guid.NewGuid();
                Guid verifyKey = Guid.NewGuid();

                context.User.Add(new User
                {
                    Key = loginKey,
                    Email = email,
                    Password = password,
                    EmailVerifyKey = verifyKey,

                    CreatedIp = clientIp.GetAddressBytes(),
                    CreatedUtc = DateTime.UtcNow,
                });

                context.SaveChanges();

                result = new AuthRegisterModel
                {
                    Email = email,
                    EmailVerifyKey = verifyKey,
                };

                return true;
            }
        }

        public bool TryVerify(IPAddress clientIp, Guid? key)
        {
            using (CarClubContext context = new CarClubContext())
            {
                using (IDbContextTransaction transaction = context.Database.BeginTransaction())
                {
                    User record = context.User
                        .Where(i => i.Deleted == false)
                        .Where(i => i.EmailVerified == false)
                        .Where(i => i.EmailVerifyKey == key)
                        .SingleOrDefault();

                    if (record == null)
                    {
                        return false;
                    }

                    record.EmailVerified = true;
                    record.EmailVerifiedIp = clientIp.GetAddressBytes();
                    record.EmailVerifiedUtc = DateTime.UtcNow;
                    record.EmailVerifyKey = null;

                    record.Updated = true;
                    record.UpdatedIp = clientIp.GetAddressBytes();
                    record.UpdatedUtc = DateTime.UtcNow;
                    record.UpdatedUserId = record.Id;

                    context.SaveChanges();

                    transaction.Commit();

                    return true;
                }
            }
        }

        public bool TryLogin(IPAddress clientIp, string email, out AuthLoginModel result)
        {
            using (CarClubContext context = new CarClubContext())
            {
                result = context.User
                    .Where(i => i.Deleted == false)
                    .Where(i => i.EmailVerified == true)
                    .Where(i => i.Email == email)
                    .Where(i => i.FailedLoginCount < 5)
                    .Select(i => new AuthLoginModel
                    {
                        Key = i.Key,
                        Password = i.Password,
                    })
                    .SingleOrDefault();

                if (result == null)
                {
                    return false;
                }

                return true;
            }
        }

        public bool TryLoginSuccess(IPAddress clientIp, Guid? key)
        {
            using (CarClubContext context = new CarClubContext())
            {
                using (IDbContextTransaction transaction = context.Database.BeginTransaction())
                {
                    User record = context.User
                        .Where(i => i.Deleted == false)
                        .Where(i => i.EmailVerified == true)
                        .Where(i => i.Key == key)
                        .SingleOrDefault();

                    if (record == null)
                    {
                        return false;
                    }

                    if (record.FailedLogin)
                    {
                        record.FailedLogin = false;
                        record.FailedLoginCount = 0;
                        record.FailedLoginIp = null;
                        record.FailedLoginUtc = null;
                    }

                    record.LastLoginIp = clientIp.GetAddressBytes();
                    record.LastLoginUtc = DateTime.UtcNow;

                    record.Updated = true;
                    record.UpdatedIp = clientIp.GetAddressBytes();
                    record.UpdatedUtc = DateTime.UtcNow;
                    record.UpdatedUserId = record.Id;

                    context.SaveChanges();

                    transaction.Commit();
                }

                return true;
            }
        }

        public bool TryLoginFailure(IPAddress clientIp, Guid? key)
        {
            using (CarClubContext context = new CarClubContext())
            {
                using (IDbContextTransaction transaction = context.Database.BeginTransaction())
                {
                    User record = context.User
                        .Where(i => i.Key == key)
                        .SingleOrDefault();

                    if (record == null)
                    {
                        return false;
                    }

                    record.FailedLogin = true;
                    record.FailedLoginIp = clientIp.GetAddressBytes();
                    record.FailedLoginUtc = DateTime.UtcNow;
                    record.FailedLoginCount++;

                    record.Updated = true;
                    record.UpdatedIp = clientIp.GetAddressBytes();
                    record.UpdatedUtc = DateTime.UtcNow;
                    record.UpdatedUserId = record.Id;

                    context.SaveChanges();
                    transaction.Commit();

                    return true;
                }
            }
        }

        public bool TryGetPermissions(Guid? key, out IEnumerable<string> result)
        {
            using (CarClubContext context = new CarClubContext())
            {
                result = context.User
                    .Where(i => i.Key == key)
                    .Where(i => i.Deleted == false)
                    .Where(i => i.FailedLoginCount < 5)
                    .SelectMany(u => u.UserRoleUser/*.UserRole*/)
                    .Select(i => i.Role)
                    .SelectMany(rp => rp.RolePermission)
                    .Select(i => i.Permission)
                    .Select(i => i.Code)
                    .ToList();

                return true;
            }
        }
    }
}
