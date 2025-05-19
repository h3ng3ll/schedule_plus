using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Shared.Models;
using Shared.Utils.DB;

namespace server_api.Services.Core;

public interface IUserService
{
    public Task<bool> IsUserExistByEmail(string email);
    public Task<bool> IsUserExistById(int id);

    public Task<User> CreateUser(RegisterUserRequest registerUserRequest);
    public Task<User?> GetUserByEmailAndPassword(string email, string password);
    public Task<User?> GetUserById(int id);
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

    public async Task<bool> IsUserExistById(int id)
    {
        var user = await context.Users.FindAsync(
            id
        );
        return user != null;
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

    public async Task<User?> GetUserByEmailAndPassword(string email, string password)
    {
        var user = await context.Users.Include(
            d => d.Department
        ).FirstAsync(
            u => u.Email == email
        );
        var hasher = new PasswordHasher<User>();

        var res = hasher.VerifyHashedPassword(
            user: user,
            user.PasswordHash,
            password
        );
        return res == PasswordVerificationResult.Success ? user : null;
    }

    public async Task<User?> GetUserById(int id)
    {
        var user = await context.Users.Include(
            e => e.Department
        ).FirstAsync(
            e => e.Id == id
        );

        return user;
    }
}