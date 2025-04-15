namespace server_api.Models.Notifications;

public class AndroidNotificationChannel(string id, string name)
{
    public string id { get; set; } = id;
    public string name { get; set; } = name;
}