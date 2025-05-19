using AutoMapper;
using Microsoft.EntityFrameworkCore;
using server_api.DTOs;
using Shared.Models.Users;
using Shared.Utils.DB;

namespace server_api.Services.Core;

public interface IStudentService
{
    public Task<Student> CreateStudent(RegisterStudentRequest studentRequest);
    public Task<Student> GetStudentByUserId(int id);
    public Task<bool> IsStudentExistsByUserId(int id);
}

public class StudentService(
    ApplicationContext context,
    IUserService userService,
    IGroupService groupService,
    IMapper mapper
) : IStudentService
{
    public async Task<Student> CreateStudent(RegisterStudentRequest studentRequest)
    {
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

    public async Task<Student> GetStudentByUserId(int id)
    {
        var student = await context.Students.Where(
            u => u.UserId == id
        ).Include(
            g => g.Group
        ).FirstOrDefaultAsync();

        return student!;
    }

    public async Task<bool> IsStudentExistsByUserId(int id)
    {
        var student = await context.Students.Where(
            u => u.UserId == id
        ).FirstOrDefaultAsync();

        return student != null;
    }
}