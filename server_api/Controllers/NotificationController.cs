using System.IdentityModel.Tokens.Jwt;
using System.Net;
using System.Runtime.InteropServices.JavaScript;
using System.Security.Claims;
using System.Text.Json;
using FirebaseAdmin.Messaging;
using Google;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using schedule_plus.Services.Firebase.FirebaseMessaging;
using server_api.Configs;
using server_api.DTOs.Notification;
using Shared.Models.Notifications;
using ApplicationContext = Shared.Utils.DB.ApplicationContext;

namespace server_api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class NotificationController(
    IFirebaseMessagingService firebaseMessagingService,
    ApplicationContext context
) : ControllerBase
{
    private readonly IFirebaseMessagingService _firebaseMessagingService = firebaseMessagingService;


    // Example
    // [HttpGet("api/NotificationController/test")]
    // [HttpGet("test")]
    // [Authorize]
    // public async Task<IActionResult> Test()
    // {
    //     // await HttpContext.Response.WriteAsync("Test from server");
    //
    //     // return "test";
    //     Console.WriteLine("Hello from server console");
    //     HttpContext.Response.StatusCode = 409;
    //     // return WebRequestMethods.Http.("Hello from server");
    //     return Ok(new { message = "Hello from server" });
    // }
    //
    // [HttpPost("myTest")]
    // public async Task<IActionResult> MyTest()
    // {
    //     return Ok(new { message = "Hello from server" });
    // }

    [HttpPost("send")]
    [Authorize]
    public async Task<IActionResult> Send([FromBody] Notification notification)
    {
        // var body = Request.Form["body"];
        // var title = Request.Form["title"];

        // var r = Request;
        // var res = await _firebaseMessagingService.SendMessage();
        //
        await _firebaseMessagingService.SendMessage(
            notification
        );
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
        // await _firebaseMessagingService.SaveFcmToken(token);

        // Look for token
        var res = await context.UserDevices.AnyAsync(
            (e) => e.DeviceToken == tokenReq.token
        );

        // User's token already has been registered . Do nothing
        if (res) return Ok();

        var userClaims = User.FindFirst(
            ClaimTypes.NameIdentifier
        );
        if (userClaims == null)
            return Unauthorized(
                new { message = "User is not logged in." }
            );

        var device = new UserDevice
        {
            UserId = Int32.Parse(userClaims.Value),
            DeviceToken = tokenReq.token,
        };

        context.UserDevices.Add(
            device
        );
        await context.SaveChangesAsync();

        return Ok();
    }
}