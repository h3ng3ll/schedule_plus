using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace Shared.Utils.DB;

public class AppContextFactory : IDesignTimeDbContextFactory<ApplicationContext>
{
    /// dotnet ef migrations add InitialCreate   -o Shared/Models.g/   -c Shared.Utils.DB.ApplicationContext   -p Shared/   --json
    public ApplicationContext CreateDbContext(string[] args)
    {
        var optionsBuilder = new DbContextOptionsBuilder<ApplicationContext>();

        IConfigurationRoot configuration = new ConfigurationBuilder()
            //  Do not get how to load  from another module 
            
            // .SetBasePath(Path.Combine(Directory.GetCurrentDirectory(), "../server_api"))
            .SetBasePath(Directory.GetCurrentDirectory())
            .AddJsonFile("appsettings.json")
            .Build();
        
        var connectionString =  
            configuration.GetConnectionString(
            "DefaultConnection" 
        );
        Console.WriteLine("PWD: {0}", Directory.GetCurrentDirectory());
        Console.WriteLine("Connection string: {0}", connectionString);
        
        optionsBuilder.UseMySql(
            // "Server=localhost;Database=schedule_plus;User=dotnet;Password=dotnet",
            connectionString,
            ServerVersion.AutoDetect(
                connectionString
            )
        );
        return new ApplicationContext(optionsBuilder.Options);
    }
    
    public void ConfigureServices(IServiceCollection services)
    {
        // Replace with your connection string.
        var connectionString = "server=localhost;user=root;password=1234;database=ef";

        // Replace with your server version and type.
        // Use 'MariaDbServerVersion' for MariaDB.
        // Alternatively, use 'ServerVersion.AutoDetect(connectionString)'.
        // For common usages, see pull request #1233.
        var serverVersion = new MySqlServerVersion(new Version(major: 10, minor: 5, build: 25));

        // Replace 'YourDbContext' with the name of your own DbContext derived class.
        services.AddDbContext<ApplicationContext>(
            dbContextOptions => dbContextOptions
                .UseMySql(connectionString, serverVersion)
                // The following three options help with debugging, but should
                // be changed or removed for production.
                .LogTo(Console.WriteLine, LogLevel.Information)
                .EnableSensitiveDataLogging()
                .EnableDetailedErrors()
        );
    }

}