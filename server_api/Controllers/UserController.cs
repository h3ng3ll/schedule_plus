using System.Security.Claims;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using server_api.DTOs;
using server_api.DTOs.Student;
using server_api.Services.Core;
using ApplicationContext = Shared.Utils.DB.ApplicationContext;

namespace server_api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class UserController(
    IMapper mapper,
    IUserService userService
) : Controller
{
    [HttpGet("me")]
    [Authorize]
    public async Task<IActionResult> Get()
    {
        var userIdClaim = User.FindFirstValue(
            ClaimTypes.NameIdentifier
        );
        if (userIdClaim is null)
            return Unauthorized();

        var user = await userService.GetUserById(
            int.Parse(
                userIdClaim
            )
        );
        
        if (user is null) return NotFound();

        return Ok(
            new
            {
                user = mapper.Map<UserResponse>(user)
            }
        );
    }
}