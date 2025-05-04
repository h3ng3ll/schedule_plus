using EducationalInsitution.Models.Core;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Shared.Models;

namespace Shared.Utils.DB;

public class ApplicationContext(DbContextOptions<ApplicationContext> options) : DbContext(options)
{
    public DbSet<User> Users { get; set; }
    public DbSet<Schedule> Schedules { get; set; }
    public DbSet<Department> Departments { get; set; }
    public DbSet<Course> Courses { get; set; }
    public DbSet<Student> Students  { get; set; }
    public DbSet<Professor> Professors { get; set; }
    
    
    // protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    // {
    //     // var optionsBuilder = new DbContextOptionsBuilder<AppContext>();
    //
    //     IConfigurationRoot configuration = new ConfigurationBuilder()
    //         .SetBasePath(Path.Combine(Directory.GetCurrentDirectory(), "../server_api"))
    //         .AddJsonFile("appsettings.json")
    //         .Build();
    //
    //
    //     var connectionString = configuration.GetConnectionString(
    //         "DefaultConnection"
    //     );
    //
    //     optionsBuilder.UseMySql(
    //         // "Server=localhost;Database=schedule_plus;User=dotnet;Password=dotnet",
    //         connectionString,
    //         ServerVersion.AutoDetect(
    //             connectionString
    //         )
    //     );
    //     // return new AppContext(optionsBuilder.Options);
    //     // base.OnConfiguring(optionsBuilder);
    //     // optionsBuilder.use
    //     // return new BloggingContext(optionsBuilder.Options);
    // }
}