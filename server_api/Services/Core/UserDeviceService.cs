using Microsoft.EntityFrameworkCore;
using Shared.Models;
using Shared.Models.Notifications;
using Shared.Utils.DB;

namespace server_api.Services.Core;

public interface IUserDeviceService
{
    public Task<bool> IsRegisteredDevice(String token, int userId);
    public Task RegisterDevice(String token, int userId);
}

public class UserDeviceService(ApplicationContext context) : IUserDeviceService
{
    public async Task<bool> IsRegisteredDevice(string token, int userId)
    {
        var res = await context.UserDevices.AnyAsync(
            (e) =>
                e.DeviceToken == token &&
                e.UserId == userId
        );
        return res;
    }

    public async Task RegisterDevice(string token, int userId)
    {
        var device = new UserDevice
        {
            UserId = userId,
            DeviceToken = token,
        };

        context.UserDevices.Add(
            device
        );
        await context.SaveChangesAsync();
    }
}