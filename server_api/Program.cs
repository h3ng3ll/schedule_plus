using System.Text.Json;
using FirebaseAdmin;
using Google.Apis.Auth.OAuth2;
using schedule_plus.Services.Firebase.FirebaseMessaging;

var builder = WebApplication.CreateBuilder(args);

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

builder.Services.AddAuthentication("Bearer").AddJwtBearer("Bearer" );

builder.Services.AddTransient<IFirebaseMessagingService, FirebaseMessagingService>();

builder.Services.AddControllers().AddJsonOptions(options =>
    {
        // Not touch . Use for send api to mobile client
        options.JsonSerializerOptions.PropertyNamingPolicy = JsonNamingPolicy.CamelCase;
    }
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

// connect Firebase AdminSDK  
FirebaseApp.Create(new AppOptions()
    {
        Credential = GoogleCredential.FromFile(
            "/home/alex/RiderProjects/schedule_plus/schedule-plus-285fd-firebase-adminsdk-fbsvc-a597c28470.json"
        ),
    }
);
app.UseHttpsRedirection();

var summaries = new[]
{
    "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
};

app.MapGet("/weatherforecast", () =>
    {
        var forecast = Enumerable.Range(1, 5).Select(index =>
                new WeatherForecast
                (
                    DateOnly.FromDateTime(DateTime.Now.AddDays(index)),
                    Random.Shared.Next(-20, 55),
                    summaries[Random.Shared.Next(summaries.Length)]
                ))
            .ToArray();
        return forecast;
    })
    .WithName("GetWeatherForecast")
    .WithOpenApi();


app.UseAuthentication();
app.UseAuthorization();

// controller without it do not working
app.MapControllers();
app.Run();

record WeatherForecast(DateOnly Date, int TemperatureC, string? Summary)
{
    public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);
}