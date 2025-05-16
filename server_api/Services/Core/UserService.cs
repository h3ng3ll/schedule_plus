using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using server_api.DTOs;
using server_api.DTOs.Student;
using server_api.Utils;
using Shared.Models;
using Shared.Utils.DB;

namespace server_api.Services.Core;

public interface IUserService
{
    public Task<bool> IsUserExistByEmail(string email);

    public Task<User> CreateUser(RegisterUserRequest registerUserRequest);
}

public class UserService(
    ApplicationContext context,
    IMapper mapper
) : IUserService
{
    public async Task<bool> IsUserExistByEmail(string email)
    {
        var isExists = await context.Users.AnyAsync(
            e => e.Email == email
        );
        return isExists;
    }

    public async Task<User> CreateUser(RegisterUserRequest registerUserRequest)
    {
        var user = mapper.Map<RegisterUserRequest, User>(
            registerUserRequest
        );
        var hasher = new PasswordHasher<User>();

        var hash = hasher.HashPassword(
            user,
            registerUserRequest.Password
        );
        user.PasswordHash = hash;
        
        context.Users.Add(
            user
        );
        await context.SaveChangesAsync();

        return user;
    }
}