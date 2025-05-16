using AutoMapper;
using server_api.DTOs;
using server_api.DTOs.Student;
using Shared.Models;
using Shared.Models.Users;
using Shared.Utils.DB;

namespace server_api.Services.Core;

public interface IStudentService
{
    public Task<Student> CreateStudent(RegisterStudentRequest studentRequest);
}

public class StudentService(
    ApplicationContext context,
    IDepartmentService departmentService,
    IUserService userService,
    IGroupService groupService,
    IMapper mapper
) : IStudentService
{
    public async Task<Student> CreateStudent(RegisterStudentRequest studentRequest)
    {
        
        // var user = new User
        // {
        //     Role = Role.Student,
        //     ImgUrl = null,
        //     Email = studentRequest.Email,
        //     Name = studentRequest.Name,
        //     Department = department,
        // };
        var userRequest = mapper.Map<RegisterUserRequest>(
            studentRequest
        );
        var group = await groupService.GetGroupByIdAsync(
            studentRequest.GroupId
        );

        var user = await userService.CreateUser(
            userRequest
        );

        var student = new Student
        {
            Group = group!,
            UserId = user.Id,
        };
        
        await context.Students.AddAsync(
            student
        );
        await context.SaveChangesAsync();
        
        return student;
    }
}