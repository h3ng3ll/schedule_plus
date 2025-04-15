using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Shared.Models;

namespace server_api.Controllers;

[Authorize]
[ApiController]
[Route("api/[controller]")]
public class AuthorizationController : Controller
{
    [HttpPost("login")]
    async public Task<IActionResult> Login()
    {
        return Ok("works");
    }
}