using Microsoft.EntityFrameworkCore;
using Shared.Models;
using Shared.Utils.DB;

namespace server_api.Services.Core;

public interface INotificationService
{
    public Task<Notification?> GetLastMessage(int userId);
    public Task<int> GetUnReadMessagesCounts(int userId);

    public Task CreateNotification(int userId, string body, string title);
}

public class NotificationService(ApplicationContext context) : INotificationService
{
    public async Task<Notification?> GetLastMessage(int userId)
    {
        var notification = await context.Notifications.OrderBy(
            n => n.CreatedAt
        ).Where(
            n => n.UserId == userId
        ).LastOrDefaultAsync();

        return notification;
    }

    public Task<int> GetUnReadMessagesCounts(int userId)
    {
        var counts = context.Notifications.CountAsync(
            (e) =>
                e.UserId == userId &&
                e.IsRead == false
        );

        return counts;
    }

    public async Task CreateNotification(int userId, string body, string title)
    {
        var notificationTable = new Notification
        {
            UserId = userId,
            Body = body,
            Title = title,
            CreatedAt = DateTimeOffset.Now.ToUnixTimeMilliseconds(),
            IsRead = false,
        };
        context.Notifications.Add(
            notificationTable
        );
        await context.SaveChangesAsync();
    }
}