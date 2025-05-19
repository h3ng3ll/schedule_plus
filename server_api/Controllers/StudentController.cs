using System.Security.Claims;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using server_api.DTOs;
using server_api.DTOs.Student;
using server_api.Services.Core;
using Shared.Models;

namespace server_api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class StudentController(
    IMapper mapper,
    IUserService userService,
    IStudentService studentService
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

        var uid = Int32.Parse(
            userIdClaim
        );
        var res = await userService.IsUserExistById(
            uid
        );

        if (!res) return NotFound();

        var role = User.FindFirstValue(
            ClaimTypes.Role
        );

        if (role != Role.Student.ToString()) return Forbid();


        var student = await studentService.GetStudentByUserId(
            uid
        );

        return Ok(
            new
            {
                student = mapper.Map<StudentResponse>(
                    student
                )
            }
        );
    }
}