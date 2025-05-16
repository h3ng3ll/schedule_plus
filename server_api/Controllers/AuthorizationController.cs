using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using server_api.DTOs;
using server_api.DTOs.Student;
using server_api.DTOs.Teacher;
using server_api.Services.Core;
using server_api.Utils;
using Shared.Models;
using ApplicationContext = Shared.Utils.DB.ApplicationContext;
using LoginRequest = server_api.DTOs.LoginRequest;

namespace server_api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class AuthorizationController(
    AppEncryption appEncryption,
    ApplicationContext context,
    IMapper mapper,
    IUserService userService,
    IDepartmentService departmentService,
    IStudentService studentService,
    IProfessorService professorService
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
        var isExistsUser = await userService.IsUserExistByEmail(
            request.Identifier
        );

        if (!isExistsUser)
        {
            return Unauthorized(
                value: new
                {
                    error = "User not found"
                }
            );
        }

        var user = await userService.GetUserByEmailAndPassword(
            request.Identifier,
            request.Password
        );

        if (user == null)
            return Unauthorized(
                value: new
                {
                    error = "Invalid password"
                }
            );

        var token = appEncryption.GenerateJWwToken(
            user
        );
        // var roleCredentials = await RoleCredentials(
        //     user: user
        // );

        return Ok(new
            {
                user = mapper.Map<UserResponse>(
                    user
                ),
                // roleData = roleCredentials,
                jwt = token,
            }
        );
    }

    /// <summary>
    ///  Register allows to register only student . For others do it manually .
    /// Check if same email exists 
    /// </summary>
    /// <param name="studentRequest"></param>
    /// <returns></returns>
    [HttpPost("register")]
    public async Task<IActionResult> RegisterStudent(RegisterStudentRequest request)
    {
        var emailValidation = await ValidateEmailAndUserExistence(
            request.Email
        );
        if (emailValidation != null) return emailValidation;

        var deptCheck = await ValidateDepartment(
            request.DepartmentId
        );

        if (deptCheck != null) return deptCheck;

        var student = await studentService.CreateStudent(
            request
        );

        var token = appEncryption.GenerateJWwToken(
            student.User
        );

        return Ok(
            new
            {
                student = mapper.Map<StudentResponse>(
                    student
                ),
                jwt = token
            }
        );
    }


    [HttpPost("registerProfessor")]
    public async Task<IActionResult> RegisterProfessor(RegisterProfessorRequest request)
    {
        var emailValidation = await ValidateEmailAndUserExistence(
            request.Email
        );
        if (emailValidation != null) return emailValidation;

        var deptCheck = await ValidateDepartment(
            request.DepartmentId
        );

        if (deptCheck != null) return deptCheck;

        var professor = await professorService.CreateProfessor(
            request
        );

        var token = appEncryption.GenerateJWwToken(
            professor.User
        );

        return Ok(
            new
            {
                professor = mapper.Map<ProfessorResponse>(
                    professor
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

    private async Task<IActionResult?> ValidateEmailAndUserExistence(string email)
    {
        if (!email.Contains('@'))
        {
            return BadRequest(
                error: new
                {
                    error = "invalid email format"
                }
            );
        }

        if (await userService.IsUserExistByEmail(email))
        {
            return Conflict(
                error: new
                {
                    error =
                        "User with this email already exists."
                }
            );
        }

        return null;
    }

    private async Task<IActionResult?> ValidateDepartment(int departmentId)
    {
        if (!await departmentService.DepartmentExistsByIdAsync(departmentId))
        {
            return BadRequest(
                error: new
                {
                    error = "Department not found"
                }
            );
        }

        return null;
    }
}