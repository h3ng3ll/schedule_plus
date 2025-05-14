using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using schedule_plus.Services.Firebase.FirebaseMessaging;
using server_api;
using server_api.DTOs;
using server_api.DTOs.Course;
using server_api.DTOs.Group;
using server_api.DTOs.Schedule;
using server_api.DTOs.Student;
using server_api.DTOs.Teacher;
using server_api.Utils;
using Shared.Models;
using Shared.Models.Schedule;
using Shared.Utils.DB;
using Course = Shared.Models.Course;

var builder = WebApplication.CreateBuilder(args);

Startup.InitCors(builder);


Startup.InitBearerToken(
builder
);

builder.Services.AddTransient<IFirebaseMessagingService, FirebaseMessagingService>();

builder.Services.AddDbContext<ApplicationContext>(options =>
    {
        var connectionString = builder.Configuration.GetConnectionString(
            "DefaultConnection"
        );

        var envValue = Environment.GetEnvironmentVariable(
            "DB_CONNECTION"
        );

        if (!string.IsNullOrEmpty(envValue))
        {
            connectionString = envValue;
        }

        options.UseNpgsql(
            connectionString
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

        config.CreateMap<CreateGroupRequest, Group>();
        config.CreateMap<CreateCourseRequest, Course>();
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

Startup.InitFirebase(app);


app.UseCors("AllowLocalNetwork");

// Configure the HTTP request pipeline.
// if (app.Environment.IsDevelopment())
// {
app.UseSwagger();
app.UseSwaggerUI();
// }


app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();

// controller without it do not working
app.MapControllers();
app.Run();