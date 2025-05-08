using Microsoft.EntityFrameworkCore;
using Shared.Models;
using Shared.Utils.DB;

namespace server_api.Models.IRecipient;

public class StudentsRecipient : IRecipient
{
    public List<int>? DepartmentId { get; set; }

    public Task<List<User>> GetRecipientsAsync(ApplicationContext context)
    {
        if (DepartmentId == null)
        {
            return context.Users.ToListAsync();
        }

        return context.Users
            .Where(u =>
                u.DepartmentId != null &&
                DepartmentId.Contains((int)u.DepartmentId) &&
                u.Role == Role.Student
            )
            .ToListAsync();
    }
}