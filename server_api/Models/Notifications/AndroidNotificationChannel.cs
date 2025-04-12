namespace server_api.Models.Notifications;

public class AndroidNotificationChannel(string id, string name)
{
    public String Id { get; set; } = id;
    public String Name { get; set; } = name;
}