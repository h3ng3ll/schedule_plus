using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
using schedule_plus;
using schedule_plus.Service;
using schedule_plus.Utils.Client;


var builder = WebAssemblyHostBuilder.CreateDefault(args);

// builder.Services.Add
builder.RootComponents.Add<App>("#app");
builder.RootComponents.Add<HeadOutlet>("head::after");

builder.Configuration.AddJsonFile(
    "appsettings.json",
    optional: false,
    reloadOnChange: true
);

builder.Services.AddHttpClient<INotificationSenderService, NotificationSenderService>(client =>
{
    client.BaseAddress = new Uri(builder.Configuration["BaseUrl"] ?? string.Empty);
});

builder.Services.AddScoped(
    sp => new HttpClient
    {
        BaseAddress = new Uri(builder.HostEnvironment.BaseAddress)
    }
);


await builder.Build().RunAsync();