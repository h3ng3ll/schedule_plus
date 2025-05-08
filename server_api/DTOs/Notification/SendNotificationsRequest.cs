using Newtonsoft.Json;
using server_api.Models;

namespace server_api.DTOs.Notification;

public class SendNotificationsRequest
{
    
    [JsonProperty("title")]
    public string Title { get; set; }
    
    [JsonProperty("body")]
    public string Body { get; set; }
    
    [JsonProperty("imageUrl")]
    public string? ImageUrl { get; set; }

    [JsonProperty("notificationQueryParameters")]
    public NotificationQueryParameters? NotificationQueryParameters { get; set; }
}