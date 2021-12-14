using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using NoPony.CarClub.Api.Exceptions;
using NoPony.CarClub.Api.Features.Auth.Record;
using Serilog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.Auth
{
    public class AuthRepository : IAuthRepository
    {
        private readonly ILogger _log;
        private readonly EF.Context _context;

        public AuthRepository(ILogger log, EF.Context context)
        {
            _log = log ?? throw new ArgumentNullException(nameof(log));
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public async Task<AuthRegisterResponseModel> Register(IPAddress clientIp, string email, string password)
        {
            Guid loginKey = Guid.NewGuid();
            Guid verifyKey = Guid.NewGuid();

            if (_context.User
                .Where(i => !i.Deleted)
                .Where(i => i.Email == email)
                .Any())
                throw new DuplicateRecordException();

            await _context.User.AddAsync(new EF.User
            {
                Key = loginKey,
                Email = email,
                Password = password,
                EmailVerifyKey = verifyKey,

                CreatedIp = clientIp,
                CreatedUtc = DateTime.UtcNow,
            });

            await _context.SaveChangesAsync();

            return new AuthRegisterResponseModel
            {
                Email = email,
                EmailVerifyKey = verifyKey,
            };
        }

        public async Task Verify(IPAddress clientIp, Guid? key)
        {
            using (IDbContextTransaction transaction = _context.Database.BeginTransaction())
            {
                EF.User record = await _context.User
                    .Where(i => i.Deleted == false)
                    .Where(i => i.EmailVerified == false)
                    .Where(i => i.EmailVerifyKey == key)
                    .SingleOrDefaultAsync()
                ?? throw new InvalidKeyException();

                record.EmailVerified = true;
                record.EmailVerifiedIp = clientIp;
                record.EmailVerifiedUtc = DateTime.UtcNow;
                record.EmailVerifyKey = null;

                record.Updated = true;
                record.UpdatedIp = clientIp;
                record.UpdatedUtc = DateTime.UtcNow;
                record.UpdatedUserId = record.Id;

                await _context.SaveChangesAsync();
                await transaction.CommitAsync();
            }
        }

        public async Task<AuthUserModel> Login(IPAddress clientIp, string email)
        {
            return await _context.User
                .Where(i => i.Deleted == false)
                .Where(i => i.EmailVerified == true)
                .Where(i => i.Email == email)
                .Where(i => i.FailedLoginCount < 5)
                .Select(i => new AuthUserModel
                {
                    Key = i.Key,
                    Password = i.Password,
                })
                .SingleOrDefaultAsync()
            ?? throw new LoginFailedException();
        }

        public async Task LoginSuccess(IPAddress clientIp, Guid? key)
        {
            using (IDbContextTransaction transaction = _context.Database.BeginTransaction())
            {
                EF.User record = await _context.User
                    .Where(i => i.Deleted == false)
                    .Where(i => i.EmailVerified == true)
                    .Where(i => i.Key == key)
                    .SingleOrDefaultAsync()
                ?? throw new InvalidKeyException();

                if (record.FailedLogin)
                {
                    record.FailedLogin = false;
                    record.FailedLoginCount = 0;
                    record.FailedLoginIp = null;
                    record.FailedLoginUtc = null;
                }

                record.LastLoginIp = clientIp;
                record.LastLoginUtc = DateTime.UtcNow;

                record.Updated = true;
                record.UpdatedIp = clientIp;
                record.UpdatedUtc = DateTime.UtcNow;
                record.UpdatedUserId = record.Id;

                await _context.SaveChangesAsync();
                await transaction.CommitAsync();
            }
        }

        public async Task LoginFailure(IPAddress clientIp, Guid? key)
        {
            using (IDbContextTransaction transaction = _context.Database.BeginTransaction())
            {
                EF.User record = _context.User
                    .Where(i => i.Deleted == false)
                    .Where(i => i.Key == key)
                    .SingleOrDefault()
                ?? throw new InvalidKeyException();

                record.FailedLogin = true;
                record.FailedLoginIp = clientIp;
                record.FailedLoginUtc = DateTime.UtcNow;
                record.FailedLoginCount++;

                record.Updated = true;
                record.UpdatedIp = clientIp;
                record.UpdatedUtc = DateTime.UtcNow;
                record.UpdatedUserId = record.Id;

                await _context.SaveChangesAsync();
                await transaction.CommitAsync();
            }
        }

        public async Task<IEnumerable<string>> GetPermissions(Guid? key)
        {
            return await _context.User
                .Where(i => i.Deleted == false)
                .Where(i => i.Key == key)
                .Where(i => i.FailedLoginCount < 5)
                .SelectMany(u => u.UserRoleUser)
                .Select(i => i.Role)
                .SelectMany(rp => rp.RolePermissionSecurable)
                .Select(i => i.Permission)
                .Select(i => i.Code)
                .ToListAsync();
        }
    }
}
