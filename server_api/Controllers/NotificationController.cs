using System.Security.Claims;
using System.Text.Json;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using schedule_plus.Services.Firebase.FirebaseMessaging;
using server_api.Configs;
using server_api.DTOs.Notification;
using server_api.DTOs.Notification.MarkAsReadMessages;
using server_api.Models.IRecipient;
using server_api.Services.Core;
using Shared.Models;
using ApplicationContext = Shared.Utils.DB.ApplicationContext;

namespace server_api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class NotificationController(
    IFirebaseMessagingService firebaseMessagingService,
    ApplicationContext context,
    IMapper mapper,
    INotificationService notificationService,
    IUserDeviceService userDeviceService
) : ControllerBase
{
    [HttpGet("")]
    [Authorize]
    public async Task<IActionResult> FetchNotifications(
        FetchNotificationsRequest? fetchNotificationsRequest
    )
    {
        var uidClaim = User.FindFirst(
            ClaimTypes.NameIdentifier
        );


        var user = await context.Users.FirstAsync(
            (e) => e.Id == Int32.Parse(
                uidClaim!.Value
            )
        );


        // Параметры пагинации
        var page = fetchNotificationsRequest?.Page ?? 1; // например, 1
        var limit = fetchNotificationsRequest?.Limit ?? 5; // например, 20

        if (page < 1) page = 1;
        if (limit < 1 || limit > 100) limit = 20;

        var notifications = await context.Notifications
            .Where(n => n.UserId == user.Id)
            .OrderByDescending(n => n.CreatedAt)
            .Skip((page - 1) * limit)
            .Take(limit)
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

        var length = context.Notifications.Count(
            n => n.UserId == user.Id
        );

        return Ok( 
            new FetchNotificationsResponse()
            {
                Notifications = notifications,
                Limit = limit,
                Page = page,
                Total = length / limit
            }
        );
    }

    [HttpPost("markReadMessages")]
    [Authorize]
    public async Task<IActionResult> MarkAsReadMessages(MarkAsReadMessagesRequest markAsReadMessagesRequest)
    {
        var userClaim = User.FindFirst(
            ClaimTypes.NameIdentifier
        );

        var messagesIds = markAsReadMessagesRequest.NotificationIds;
        if (messagesIds.IsNullOrEmpty()) return Ok();

        var notifications = context.Notifications.Where(
            n => messagesIds.Contains(
                n.Id
            )
        );
        foreach (var notification in notifications)
        {
            notification.IsRead = true;
        }

        await context.SaveChangesAsync();
        return Ok();
    }

    [HttpGet("unReadMessagesCounts")]
    [Authorize]
    public async Task<IActionResult> UnReadMessagesCounts()
    {
        var userClaim = User.FindFirst(
            ClaimTypes.NameIdentifier
        );
        var userId = int.Parse(userClaim!.Value);

        var counts = await notificationService.GetUnReadMessagesCounts(
            userId
        );

        return
            Ok(
                counts
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

                await firebaseMessagingService.SendMessage(
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
            await notificationService.CreateNotification(
                user.Id,
                notification.Body,
                notification.Title
            );
        }

        // return Ok(new { bodyData = notification.Body, titleData = notification.Title });
        return Ok();
    }

    // Just For Android Send Notification Channel
    [HttpGet("config")]
    [Authorize]
    public  Task<IActionResult> GetConfig()
    {
        // content.Response.Headers.Add("Content-Type", "application/json");
        return Task.FromResult<IActionResult>(Ok(
            JsonSerializer.Serialize(
                NotificationChannelConfig.GetNotificationChannelsConfig()
            )
        ));
    }


    [HttpPost("saveToken")]
    [Authorize]
    public async Task<IActionResult> SaveToken(SaveTokenRequest tokenReq)
    {
        var userClaims = User.FindFirst(
            ClaimTypes.NameIdentifier
        );

        var uid = Int32.Parse(
            userClaims!.Value
        );

        var isRegisteredDevice = await userDeviceService.IsRegisteredDevice(
            tokenReq.token,
            uid
        );

        if (!isRegisteredDevice)
        {
            await userDeviceService.RegisterDevice(
                tokenReq.token,
                uid
            );
        }

        return Ok();
    }

    [HttpGet("lastNotification")]
    [Authorize]
    public async Task<IActionResult> GetLastNotification()
    {
        var userClaim = User.FindFirst(
            ClaimTypes.NameIdentifier
        );
        var userId = int.Parse(
            userClaim!.Value
        );
        var notification = await notificationService.GetLastMessage(
            userId
        );
        if (notification == null)
        {
            return Ok(
                null
            );
        }

        var mappedMessage = mapper.Map<NotificationResponse>(
            notification
        );
        return Ok(
            mappedMessage
        );
    }
}