using System.Security.Claims;
using System.Text.Json;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using schedule_plus.Services.Firebase.FirebaseMessaging;
using server_api.Configs;
using server_api.DTOs.Notification;
using server_api.Models.IRecipient;
using Shared.Models;
using Shared.Models.Notifications;
using ApplicationContext = Shared.Utils.DB.ApplicationContext;
using Notification = Shared.Models.Notification;

namespace server_api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class NotificationController(
    IFirebaseMessagingService firebaseMessagingService,
    ApplicationContext context
) : ControllerBase
{
    private readonly IFirebaseMessagingService _firebaseMessagingService = firebaseMessagingService;


    [HttpGet("")]
    [Authorize]
    public async Task<IActionResult> FetchNotifications(
        FetchNotificationsRequest? fetchNotificationsRequest
    )
    {
        var uidClaim = User.FindFirst(
            ClaimTypes.NameIdentifier
        );
        if (uidClaim == null) return Unauthorized();

        var user = await context.Users.FirstAsync(
            (e) => e.Id == Int32.Parse(
                uidClaim.Value
            )
        );


        // Параметры пагинации
        var page = fetchNotificationsRequest?.Page ?? 1; // например, 1
        var pageSize = fetchNotificationsRequest?.Limit ?? 5; // например, 20

        if (page < 1) page = 1;
        if (pageSize < 1 || pageSize > 100) pageSize = 20;

        var notifications = await context.Notifications
            .Where(n => n.UserId == user.Id)
            .OrderByDescending(n => n.CreatedAt)
            .Skip((page - 1) * pageSize)
            .Take(pageSize)
            .Select(n => new NotificationResponse()
            {
                Id = n.Id,
                UserId = n.UserId,
                Title = n.Title,
                Body = n.Body,
                CreatedAt = n.CreatedAt,
                IsRead = n.IsRead
            })
            .ToListAsync();

        return Ok(
            notifications
        );
    }

    [HttpPost("send")]
    [Authorize]
    public async Task<IActionResult> SendNotification(
        SendNotificationsRequest notification
    )
    {
        // Users who will get notification
        List<User> users;
        
        // Here go through every device
        if (notification.NotificationQueryParameters == null)
        {
            var devices = context.UserDevices;
            
            foreach (var device in devices)
            {
                var deviceToken = device.DeviceToken;

                await _firebaseMessagingService.SendMessage(
                    new FirebaseAdmin.Messaging.Notification()
                    {
                        Title = notification.Title,
                        Body = notification.Body,
                    },
                    deviceToken
                );

            }
             
            users = context.Users.ToList();
             
        }
        else
        {
            
            var isIncludeStudent = notification.NotificationQueryParameters.IncludeStudents;
            var isIncludedProfessors = notification.NotificationQueryParameters.IncludeProfessors;

             users = new List<User>();
            if (isIncludeStudent)
            {
                var students = await new StudentsRecipient()
                {
                    DepartmentId = notification.NotificationQueryParameters.DepartmentIds,
                }.GetRecipientsAsync(
                    context
                );
                users.AddRange(students);
            }

            if (isIncludedProfessors)
            {
                var professors = await new ProfessorsRecipient()
                    {
                        DepartmentId = notification.NotificationQueryParameters.DepartmentIds,
                    }
                    .GetRecipientsAsync(
                        context
                    );
                users.AddRange(professors);
            }

            
        }

        foreach (var user in users)
        {
            var notificationTable = new Notification
            {
                UserId = user.Id,
                Body = notification.Body,
                Title = notification.Title,
                CreatedAt = DateTimeOffset.Now.ToUnixTimeMilliseconds(),
                IsRead = false,
            };
            context.Notifications.Add(
                notificationTable
            );
            await context.SaveChangesAsync();
        }

        // return Ok(new { bodyData = notification.Body, titleData = notification.Title });
        return Ok();
    }

    // Just For Android Send Notification Channel
    [HttpGet("config")]
    [Authorize]
    public async Task<IActionResult> GetConfig()
    {
        // content.Response.Headers.Add("Content-Type", "application/json");
        return Ok(
            JsonSerializer.Serialize(
                NotificationChannelConfig.GetNotificationChannelsConfig()
            )
        );
    }


    [HttpPost("saveToken")]
    [Authorize]
    public async Task<IActionResult> SaveToken(SaveTokenRequest tokenReq)
    {
        var userClaims = User.FindFirst(
            ClaimTypes.NameIdentifier
        );
        if (userClaims == null)
            return Unauthorized(
                new { error = "User is not logged in." }
            );
        var uid = Int32.Parse(userClaims.Value);
        // Look for token
        var res = await context.UserDevices.AnyAsync(
            (e) =>
                e.DeviceToken == tokenReq.token &&
                e.UserId == uid
        );

        // User's token already has been registered . Do nothing
        if (res) return Ok();


        var device = new UserDevice
        {
            UserId = uid,
            DeviceToken = tokenReq.token,
        };

        context.UserDevices.Add(
            device
        );
        await context.SaveChangesAsync();

        return Ok();
    }
}