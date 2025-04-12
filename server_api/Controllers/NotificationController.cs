using System.Net;
using System.Runtime.InteropServices.JavaScript;
using System.Text.Json;
using Microsoft.AspNetCore.Mvc;
using schedule_plus.Services.Firebase.FirebaseMessaging;
using server_api.Configs;

namespace server_api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class NotificationController(IFirebaseMessagingService firebaseMessagingService) : ControllerBase
{
    private readonly IFirebaseMessagingService _firebaseMessagingService = firebaseMessagingService;


    // [HttpGet("api/NotificationController/test")]
    [HttpGet("test")]
    public async Task<IActionResult> Test()
    {
        // await HttpContext.Response.WriteAsync("Test from server");

        // return "test";
        Console.WriteLine("Hello from server console");
        HttpContext.Response.StatusCode = 409;
        // return WebRequestMethods.Http.("Hello from server");
        return Ok(new { message = "Hello from server" });
    }

    [HttpPost("myTest")]
    public async Task<IActionResult> MyTest()
    {
        return Ok(new { message = "Hello from server" });
    }

    [HttpPost("send")]
    public async Task<IActionResult> Send()
    {
        // var res = await _firebaseMessagingService.SendMessage();
        //
        return Ok();
    }

    [HttpGet("config")]
    public async Task<IActionResult> GetConfig()
    {
        // content.Response.Headers.Add("Content-Type", "application/json");
        return Ok(
            JsonSerializer.Serialize(NotificationChannelConfig.GetNotificationChannelsConfig())
        );
    }
}