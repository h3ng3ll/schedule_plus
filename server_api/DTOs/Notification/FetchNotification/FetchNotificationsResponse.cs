
using server_api.DTOs.Notification;
using Notification = Shared.Models.Notification;

public class FetchNotificationsResponse()
{
    public int Page { get; set; }
    public int Limit { get; set;  }
    public int Total { get ; set ; }
    public required List<NotificationResponse> Notifications { set; get; }
}