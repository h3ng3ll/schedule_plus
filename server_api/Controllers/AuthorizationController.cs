
using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

using server_api.DTOs;
using server_api.DTOs.Student;
using server_api.DTOs.Teacher;
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
    ApplicationContext context,
    IMapper mapper
) : Controller
{
    /// <summary>
    /// Gives JWT token to get the system 
    /// </summary>
    /// <param name="request"></param>
    /// <returns> user roleData jwt token </returns>
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
        var roleCredentials = await RoleCredentials(
            user: user
        );
        return Ok(new
            {
                user = mapper.Map<UserResponse>(
                    user
                ),
                roleData = roleCredentials,
                jwt = token,
                
            }
        );
    }

    /// <summary>
    ///  Register allows to register only student . For others do it manually .
    /// Check if same email exists 
    /// </summary>
    /// <param name="registerRequest"></param>
    /// <returns></returns>
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

        context.Students.Add(
            new Student
            {
                UserId = user.Id
            }
        );
      
        var token = appEncryption.GenerateJWwToken(
            user
        );
        await context.SaveChangesAsync();
        
        return Ok(
            new
            {
                user = mapper.Map<UserResponse>(
                    user
                ),
                jwt = token
            }
        );
    }

    /// <summary>
    ///  Return Data of Role
    /// if This is Student return student's data e.g. table Student
    /// if This is Professor return professor's data e.g. table Professor
    /// </summary>
    /// <param name="user"></param>
    /// <returns></returns>
    /// <exception cref="KeyNotFoundException"></exception>
    /// <exception cref="Exception"></exception>
    private async Task<Dictionary<string, dynamic>> RoleCredentials(User user)
    {
        var resRole = new Dictionary<string, dynamic>();

        switch (user.Role)
        {
            case Role.Student:
                var student = await context.Students.FirstOrDefaultAsync(
                    (e) => e.UserId == user.Id
                );
                if (student is null)
                    throw new KeyNotFoundException();

                var res = mapper.Map<StudentResponse>(
                    student
                );
                resRole.Add(
                    "student", res
                );
                break;
            case Role.Professor:
                var professor = await context.Professors.FirstOrDefaultAsync(
                    (e) => e.UserId == user.Id
                );
                if (professor is null)
                    throw new KeyNotFoundException();

                var resProf = mapper.Map<ProfessorResponse>(
                    professor
                );
                resRole.Add(
                    "professor", resProf
                );
                break;
            case Role.Admin:
                throw new Exception(
                    message: new(
                        "Do not support admin role yet."
                    )
                );
            default:
                throw new Exception(
                    message: new(
                        "Unsupported role type."
                    )
                );
        }

        return resRole;
    }
}