using System.Text;
using System.Text.Json;
using AutoMapper;
using EducationalInsitution.Models.Core;
using FirebaseAdmin;
using Google.Apis.Auth.OAuth2;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using schedule_plus.Services.Firebase.FirebaseMessaging;
using server_api;
using server_api.Configs;
using server_api.DTOs;
using server_api.DTOs.Student;
using server_api.DTOs.Teacher;
using server_api.Utils;
using Shared.Models;
using Shared.Utils.DB;

var builder = WebApplication.CreateBuilder(args);


// Host.CreateDefaultBuilder(args)
//     .ConfigureWebHostDefaults(
//         webBuilder => webBuilder.UseStartup<Startup>());

// Specific config
Startup.InitCors(builder);
Startup.InitBearerToken(builder);
Startup.InitFirebase();

builder.Services.AddTransient<IFirebaseMessagingService, FirebaseMessagingService>();

builder.Services.AddDbContext<ApplicationContext>(options =>
    {
        options.UseMySql(
            // builder.Configuration.GetConnectionString("DefaultConnection")
            builder.Configuration.GetConnectionString("DefaultConnection"),
            serverVersion: new MySqlServerVersion(
                new Version(major: 10, minor: 5, build: 25)
            )
        );
    }
);

builder.Services.AddSingleton<AppEncryption>();
// IMapper mapper = new MapperConfiguration(config =>
// {
//     
// }).CreateMapper();
builder.Services.AddAutoMapper(
    config =>
    {
        config.CreateMap<Student, StudentResponse>();
        config.CreateMap<Professor, ProfessorResponse>();
        config.CreateMap<User, UserResponse>();
    }
    // typeof(AutoMapperConfig) , builder.Services,
);
// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

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