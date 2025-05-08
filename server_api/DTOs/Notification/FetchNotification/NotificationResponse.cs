namespace server_api.DTOs.Notification;

public class NotificationResponse
{
    
    public int Id { get; set; }
    public int UserId { get; set; }
    public string Title { get; set; }
    public string Body { get; set; }
    public long CreatedAt { get; set; }
    public bool IsRead { get; set; }
}   