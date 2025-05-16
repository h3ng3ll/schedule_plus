using AutoMapper;
using server_api.DTOs;
using server_api.DTOs.Student;
using Shared.Models;
using Shared.Models.Users;
using Shared.Utils.DB;

namespace server_api.Services.Core;

public interface IProfessorService
{
    public Task<Professor> CreateProfessor(RegisterProfessorRequest studentRequest);
}

public class ProfessorService(
    ApplicationContext context,
    IUserService userService,
    IMapper mapper
) : IProfessorService
{
    public async Task<Professor> CreateProfessor(RegisterProfessorRequest request)
    {
        
        var professorRequest = mapper.Map<RegisterProfessorRequest>(
            request
        );

        var user = await userService.CreateUser(
            professorRequest
        );

        var professor = new Professor()
        {
            UserId = user.Id,
        };
        
        await context.Professors.AddAsync(
            professor
        );
        
        await context.SaveChangesAsync();
        
        return professor;
    }
}