using Microsoft.EntityFrameworkCore;
using Shared.Models;
using Shared.Models.Notifications;
using Shared.Models.Schedule;
using Shared.Models.Users;

namespace Shared.Utils.DB;

public class ApplicationContext(DbContextOptions<ApplicationContext> options) : DbContext(options)
{
    public DbSet<User> Users { get; set; }
    public DbSet<Schedule> Schedules { get; set; }
    public DbSet<Department> Departments { get; set; }
    public DbSet<Course> Courses { get; set; }
    public DbSet<Student> Students  { get; set; }
    public DbSet<Professor> Professors { get; set; }
    public DbSet<Admin> Admins { get; set; }
    
    public DbSet<UserDevice> UserDevices { get; set; }
    
    public DbSet<Notification> Notifications { get; set; }
    
    public DbSet<Group> Groups { get; set; }
    
}