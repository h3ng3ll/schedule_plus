using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ApplicationContext = Shared.Utils.DB.ApplicationContext;

namespace server_api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class UserController(ApplicationContext context) : Controller
{
    [HttpGet("me")]
    [Authorize]
    public async Task<IActionResult> Get()
    {
        var userIdClaim = User.FindFirstValue(ClaimTypes.NameIdentifier);
        if (userIdClaim is null)
            return Unauthorized();
        
        var user = await context.Users.FindAsync(
            Int32.Parse(
                userIdClaim
            )
        );
        if (user is null) return NotFound();

        return Ok(new
            {
                user.Id,
                user.Name,
                user.Email,
                user.ImgUrl,
            }
        );
    }
}