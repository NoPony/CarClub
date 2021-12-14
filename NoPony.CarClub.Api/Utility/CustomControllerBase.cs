using Microsoft.AspNetCore.Mvc;
using NoPony.CarClub.Api.Exceptions;
using System;
using System.Linq;
using System.Net;

namespace NoPony.CarClub.Api.Utility
{
    public class CustomControllerBase:ControllerBase
    {
        internal IPAddress GetUserIp()
        {
            try
            {
                return HttpContext.Connection.RemoteIpAddress;
            }

            catch (Exception)
            {
                throw new InvalidRequestException();
            }
        }

        internal Guid GetUserKey()
        {
            try
            {
                if (Guid.TryParse(User.Claims.FirstOrDefault(c => c.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier")?.Value, out Guid result))
                    return result;
            }

            catch (Exception)
            {
                throw new InvalidRequestException();
            }

            throw new InvalidRequestException();
        }
    }
}
