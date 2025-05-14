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

        // optionsBuilder.UseMySql(
        //     // "Server=localhost;Database=schedule_plus;User=dotnet;Password=dotnet",
        //     connectionString,
        //     ServerVersion.AutoDetect(
        //         connectionString
        //     )
        // );

        var envValue = Environment.GetEnvironmentVariable(
            "DB_CONNECTION"
            );
        
        if (!string.IsNullOrEmpty(envValue))
        {
            connectionString = envValue;
        }

        optionsBuilder.UseNpgsql(
            connectionString
        );


        return new ApplicationContext(
            optionsBuilder.Options
        );
    }
}