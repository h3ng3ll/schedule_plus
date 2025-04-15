namespace server_api.Models.Notifications;

public class Notification
{
    public int Id { get; set; }
    public int Title { get; set; }
    public required string Body { get; set; }
    public long CreatedAt { get; set; }
}