using System.Net;
using System.Runtime.InteropServices.JavaScript;
using System.Text.Json;
using FirebaseAdmin.Messaging;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using schedule_plus.Services.Firebase.FirebaseMessaging;
using server_api.Configs;

namespace server_api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class NotificationController(IFirebaseMessagingService firebaseMessagingService) : ControllerBase
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
    public async Task<IActionResult> SaveToken([FromBody] string token)
    {
         await _firebaseMessagingService.SaveFcmToken(token);
         return Ok();
    }
}