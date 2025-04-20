using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using server_api.Configuration;
using Shared.Models;

namespace server_api.Controllers;


[ApiController]
[Route("api/[controller]")]
public class AuthorizationController(IOptions<JwtSettings> jwtSettings) : Controller
{
    private readonly JwtSettings _jwtSettings = jwtSettings.Value;

    /// Gives JWT token to get the system 
    [HttpPost("login")]
    async public Task<IActionResult> Login()
    {
        var jwtToken = GenerateJWwToken();
        return Ok(jwtToken);
    }

    private string GenerateJWwToken()
    {
        var key = new SymmetricSecurityKey(
            Encoding.UTF8.GetBytes(
                _jwtSettings.SecretKey
            )
        );
        var cred = new SigningCredentials(
            key,
            SecurityAlgorithms.HmacSha256Signature
        );
        var token = new JwtSecurityToken(
            issuer: _jwtSettings.Issuer,
            audience: _jwtSettings.Audience,
            claims: new List<Claim>(),
            expires: DateTime.Now.AddDays(1),
            signingCredentials: cred
        );

        return new JwtSecurityTokenHandler().WriteToken(
            token
        );
    }
}