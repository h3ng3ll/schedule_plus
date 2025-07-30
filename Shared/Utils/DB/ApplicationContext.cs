using Microsoft.EntityFrameworkCore;
using Shared.Models;
using Shared.Models.Notifications;
using Shared.Models.Schedule;
using Shared.Models.ScheduleGroups;
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
    public DbSet<ScheduleGroup> ScheduleGroup { get; set; }

    
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        
        base.OnModelCreating(modelBuilder);
        
        modelBuilder.Entity<ScheduleGroup>()
            .HasKey(sg => new { sg.ScheduleId, sg.GroupId });
        
        modelBuilder.Entity<ScheduleGroup>()
            .HasOne(sg => sg.Schedule)
            .WithMany(s => s.ScheduleGroups)
            .HasForeignKey(sg => sg.ScheduleId);

        
        modelBuilder.Entity<ScheduleGroup>()
            .HasOne(sg => sg.Group)
            .WithMany(g => g.ScheduleGroups)
            .HasForeignKey(sg => sg.GroupId);
    }
}