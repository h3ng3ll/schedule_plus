using System.Text;
using System.Text.Json;
using FirebaseAdmin;
using Google.Apis.Auth.OAuth2;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using server_api.Configuration;

namespace server_api;

public sealed class Startup
{
    public static void InitCors(WebApplicationBuilder builder)
    {
        builder.Services.AddCors(options =>
            {
                options.AddPolicy(
                    "AllowLocalNetwork",
                    policy => policy
                        .AllowAnyOrigin() // Todo: NEVER USE on production . Convenience Development. 
                        .AllowAnyHeader()
                        .AllowAnyMethod()
                );
            }
        );
    }

    public static void InitFirebase(WebApplication app)
    {
        GoogleCredential credential;

        if (!app.Environment.IsDevelopment())
        {
            var jsonContent = Environment.GetEnvironmentVariable("FIREBASE_CREDENTIALS_JSON");
            if (string.IsNullOrEmpty(jsonContent))
                throw new InvalidOperationException("FIREBASE_CREDENTIALS_JSON is not set");

            using var stream = new MemoryStream(Encoding.UTF8.GetBytes(jsonContent
                )
            );
            credential = GoogleCredential.FromStream(stream
            );
        }
        else
        {
            credential = GoogleCredential.FromFile(
                "/home/alex/RiderProjects/schedule_plus/schedule-plus-285fd-firebase-adminsdk-fbsvc-a597c28470.json"
            );
        }

        FirebaseApp.Create(new AppOptions
        {
            Credential = credential
        });
    }

    public static void InitBearerToken(WebApplicationBuilder builder)
    {
        builder.Services.AddControllers().AddJsonOptions(options =>
            {
                // Not touch . Use for send api to mobile client
                options.JsonSerializerOptions.PropertyNamingPolicy = JsonNamingPolicy.CamelCase;
            }
        );

        
        IConfigurationSection  settings = builder.Configuration.GetSection("JwtSettings");

        var issuer = Environment.GetEnvironmentVariable("JWT_ISSUER") ?? settings["Issuer"];
        var audience = Environment.GetEnvironmentVariable("JWT_AUDIENCE") ?? settings["Audience"];
        var secretKey = Environment.GetEnvironmentVariable("JWT_SECRET_KEY") ?? settings["SecretKey"];

        
        builder.Services.Configure<JwtSettings>(settings);
        builder.Services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }
        ).AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters()
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    ValidIssuer = issuer,
                    ValidAudience = audience,
                    IssuerSigningKey = new SymmetricSecurityKey(
                        Encoding.UTF8.GetBytes(
                            secretKey!
                        )
                    )
                };
            }
        );
    }
}