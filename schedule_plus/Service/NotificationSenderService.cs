using System.Text;
using System.Text.Json;
using FirebaseAdmin.Messaging;
using schedule_plus.Utils.Client;

namespace schedule_plus.Service;

interface INotificationSenderService
{
    public Task SendNotification(String title, String body);
}

public class NotificationSenderService() : INotificationSenderService
{
    private readonly HttpClient _httpClient;
    private readonly ILogger<NotificationSenderService> _logger;

    public NotificationSenderService(HttpClient httpClient, ILogger<NotificationSenderService> logger) : this()
    {
        _httpClient = httpClient;
        _logger = logger;
    }

    public async Task SendNotification(string title, string body)
    {
        try
        {
            var notification = new Notification
            {
                Body = body,
                Title = title,
                ImageUrl = "imgUrl"
            };
            
            var json = JsonSerializer.Serialize(notification);
            var content = new StringContent(
                json,
                Encoding.UTF8,
                "application/json"
            );

            var res = await _httpClient.PostAsync(
                "Notification/send",
                content
            );
        }
        catch (Exception e)
        {
            _logger.LogError(e.Message);
        }
        // _httpClient
    }
}