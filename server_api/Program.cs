using EducationalInsitution.Models.Core;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using schedule_plus.Services.Firebase.FirebaseMessaging;
using server_api;
using server_api.DTOs;
using server_api.DTOs.Group;
using server_api.DTOs.Schedule;
using server_api.DTOs.Schedule.CreateSchedule;
using server_api.DTOs.Student;
using server_api.DTOs.Teacher;
using server_api.Utils;
using Shared.Models;
using Shared.Utils.DB;

var builder = WebApplication.CreateBuilder(args);

Startup.InitCors(builder);
Startup.InitBearerToken(builder);
Startup.InitFirebase();

builder.Services.AddTransient<IFirebaseMessagingService, FirebaseMessagingService>();

builder.Services.AddDbContext<ApplicationContext>(options =>
    {
        options.UseMySql(
            builder.Configuration.GetConnectionString(
                "DefaultConnection"
            ),
            serverVersion: new MySqlServerVersion(
                new Version(major: 10, minor: 5, build: 25
                )
            )
        );
    }
);

builder.Services.AddSingleton<AppEncryption>();

builder.Services.AddAutoMapper(
    config =>
    {
        config.CreateMap<Professor, ProfessorResponse>();
        config.CreateMap<Student, StudentResponse>();
        config.CreateMap<User, UserResponse>();
        

        config.CreateMap<Schedule, FetchScheduleResponse>();

        config.CreateMap<CreateGroupRequest , Group>();
    }
);
// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();

builder.Services.AddSwaggerGen(c =>
    {
        // c.SwaggerDoc("v1", new Info { Title = "You api title", Version = "v1" });
        c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
            {
                Description = @"JWT Authorization header using the Bearer scheme. \r\n\r\n 
                      Enter 'Bearer' [space] and then your token in the text input below.
                      \r\n\r\nExample: 'Bearer 12345abcdef'",
                Name = "Authorization",
                In = ParameterLocation.Header,
                Type = SecuritySchemeType.Http,
                Scheme = "Bearer"
            }
        );
        c.AddSecurityRequirement(new OpenApiSecurityRequirement()
            {
                {
                    new OpenApiSecurityScheme
                    {
                        Reference = new OpenApiReference
                        {
                            Type = ReferenceType.SecurityScheme,
                            Id = "Bearer"
                        },
                        Scheme = "oauth2",
                        Name = "Bearer",
                        In = ParameterLocation.Header,
                    },
                    new List<string>()
                }
            }
        );
    }
);
var app = builder.Build();

app.UseCors("AllowLocalNetwork");

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}


app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();

// controller without it do not working
app.MapControllers();
app.Run();