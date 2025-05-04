using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Google;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using server_api.Configuration;
using server_api.DTOs;
using server_api.Utils;
using Shared.Models;
using ApplicationContext = Shared.Utils.DB.ApplicationContext;
using LoginRequest = server_api.DTOs.LoginRequest;
using RegisterRequest = server_api.DTOs.RegisterRequest;

namespace server_api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class AuthorizationController(
    // IOptions<JwtSettings> jwtSettings,
    AppEncryption appEncryption,
    ApplicationContext context
) : Controller
{
    /// Gives JWT token to get the system 
    [HttpPost("login")]
    public async Task<IActionResult> Login([FromBody] LoginRequest request)
    {
        var user = await context.Users.FirstOrDefaultAsync(
            (e) => e.Email == request.Identifier
        );
        if (user == null)
            return Unauthorized(
                value: new
                {
                    error = "User not found"
                }
            );

        var hasher = new PasswordHasher<User>();

        var res = hasher.VerifyHashedPassword(
            user: user,
            user.PasswordHash,
            request.Password
        );
        if (res != PasswordVerificationResult.Success)
            return Unauthorized(
                value: new
                {
                    error = "Invalid password"
                }
            );

        var token = appEncryption.GenerateJWwToken(
            user
        );
        var response = new UserResponse
        {
            Id = user.Id,
            Name = user.Name,
            Email = user.Email,
            ImgUrl = user.ImgUrl,
            Role = user.Role.ToString()
        };
        return Ok(new
            {
                jwt = token,
                user = response
            }
        );
    }

    // Register allows to register only student . For others do it manually .
    // Check if same email exists 
    [HttpPost("register")]
    public async Task<IActionResult> Register(RegisterRequest registerRequest)
    {
        if (!registerRequest.Email.Contains('@'))
        {
            return BadRequest(
                error: new
                {
                    error = "invalid email format"
                }
            );
        }

        var isExists = await context.Users.AnyAsync(
            e => e.Email == registerRequest.Email
        );

        if (isExists)
        {
            return Conflict(
                error: new
                {
                    error =
                        "User with this email already exists."
                }
            );
        }

        var hasher = new PasswordHasher<User>();
        var user = new User
        {
            Role = Role.Student,
            ImgUrl = null,
            Email = registerRequest.Email,
            Name = registerRequest.Name,
        };
        var hash = hasher.HashPassword(
            user, registerRequest.Password
        );

        context.Users.Add(
            user
        );
        user.PasswordHash = hash;

        await context.SaveChangesAsync();

        var token = appEncryption.GenerateJWwToken(
            user
        );

        var response = new UserResponse
        {
            Id = user.Id,
            Name = user.Name,
            Email = user.Email,
            ImgUrl = user.ImgUrl,
            Role = user.Role.ToString()
        };

        return Ok(
            new
            {
                user = response,
                jwt = token
            }
        );
    }
}