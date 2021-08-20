using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace NoPony.CarClub.Api.Features.Forum
{
    [ApiController]
    [Route("[controller]")]
    public class ForumController : ControllerBase
    {
        [HttpGet]
        [Route("Thread")]
        public async Task<ActionResult> Foo()
        {
            return StatusCode(StatusCodes.Status200OK, "Noice");
        }
    }
}
