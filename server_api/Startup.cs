using System.Text;
using System.Text.Json;
using FirebaseAdmin;
using Google.Apis.Auth.OAuth2;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using server_api.Configuration;
using Shared.Utils.DB;

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

    public static void InitFirebase()
    {
        // connect Firebase AdminSDK  
        FirebaseApp.Create(new AppOptions()
            {
                Credential = GoogleCredential.FromFile(
                    "/home/alex/RiderProjects/schedule_plus/schedule-plus-285fd-firebase-adminsdk-fbsvc-a597c28470.json"
                ),
            }
        );
    }

    public static void InitBearerToken(WebApplicationBuilder builder)
    {
        builder.Services.AddControllers().AddJsonOptions(options =>
            {
                // Not touch . Use for send api to mobile client
                options.JsonSerializerOptions.PropertyNamingPolicy = JsonNamingPolicy.CamelCase;
            }
        );

        var settings = builder.Configuration.GetSection("JwtSettings");
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
                    ValidIssuer = settings["Issuer"],
                    ValidAudience = settings["Audience"],
                    IssuerSigningKey = new SymmetricSecurityKey(
                        Encoding.UTF8.GetBytes(
                            settings["SecretKey"]!
                        )
                    )
                };
            }
        );
    }
}