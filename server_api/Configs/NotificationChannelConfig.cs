using System.Data;
using server_api.Models.Notifications;

namespace server_api.Configs;

public class NotificationChannelConfig
{
    public static List<AndroidNotificationChannel> AndroidNotificationChannelConfig()
    {
        return
        [
            new AndroidNotificationChannel(
                id: "nextWeekSchedulePublished",
                name: "nextWeekSchedulePublished"
            ),

            new AndroidNotificationChannel(
                id: "currentWeekScheduleUpdated",
                name: "currentWeekScheduleUpdated"
            )
        ];
    }

    public static  Dictionary<string, dynamic> GetNotificationChannelsConfig()
    {
        var value =  new Dictionary<string, dynamic>()
        {
            { "android" , AndroidNotificationChannelConfig() }
        };
        return value;
    }
}