using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using server_api.Configuration;
using Shared.Models;

namespace server_api.Utils;

public class AppEncryption(IOptions<JwtSettings> jwtSettings)
{
    private readonly JwtSettings _jwtSettings = jwtSettings.Value;

    public string GenerateJWwToken(User user)
    {
        var claims = new List<Claim>
        {
            new Claim(
                JwtRegisteredClaimNames.Sub,
                user.Id.ToString()
            ),
            new Claim(
                JwtRegisteredClaimNames.Email,
                user.Email
            ),
            new Claim(
                ClaimTypes.Role,
                user.Role.ToString()
            ),
            new Claim(
                JwtRegisteredClaimNames.Jti,
                Guid.NewGuid().ToString()
            )
        };

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
            claims: claims,
            expires: DateTime.Now.AddDays(1),
            signingCredentials: cred
        );

        return new JwtSecurityTokenHandler().WriteToken(
            token
        );
    }
}