using System.Text;
using System.Text.Json;
using FirebaseAdmin;
using Google.Apis.Auth.OAuth2;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Extensions.Options;
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

        builder.Services.Configure<JwtSettings>(options => {
            // First load from configuration
            settings.Bind(options);
        
            // Then override with environment variables if they exist
            options.Issuer = Environment.GetEnvironmentVariable("JWT_ISSUER") ?? options.Issuer;
            options.Audience = Environment.GetEnvironmentVariable("JWT_AUDIENCE") ?? options.Audience;
            options.SecretKey = Environment.GetEnvironmentVariable("JWT_SECRET_KEY") ?? options.SecretKey;
        });

        
        builder.Services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }
        ).AddJwtBearer(options =>
            {
                var serviceProvider = builder.Services.BuildServiceProvider();
                var jwtSettings = serviceProvider.GetRequiredService<IOptions<JwtSettings>>().Value;
                
                options.TokenValidationParameters = new TokenValidationParameters()
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    ValidIssuer = jwtSettings.Issuer,
                    ValidAudience = jwtSettings.Audience,
                    IssuerSigningKey = new SymmetricSecurityKey(
                        Encoding.UTF8.GetBytes(
                            jwtSettings.SecretKey
                        )
                    )
                };
            }
        );
    }
}