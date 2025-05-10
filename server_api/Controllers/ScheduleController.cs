using System.Security.Claims;
using System.Text.Json;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualBasic;
using schedule_plus.Services.Firebase.FirebaseMessaging;
using server_api.Configs;
using server_api.DTOs.Notification;
using server_api.DTOs.Notification.MarkAsReadMessages;
using server_api.DTOs.Schedule;
using server_api.Models.IRecipient;
using server_api.Utils.Extensions;
using Shared.Models;
using Shared.Models.Notifications;
using ApplicationContext = Shared.Utils.DB.ApplicationContext;
using Notification = Shared.Models.Notification;

namespace server_api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ScheduleController(
    ApplicationContext context,
    IMapper mapper
) : ControllerBase
{
    /// <summary>
    ///  By Default return Schedule for a week 
    /// </summary>
    [HttpGet("")]
    [Authorize]
    public async Task<IActionResult> FetchSchedules([FromBody] FetchScheduleRequest fetchScheduleRequest)
    {
        //  If not specify particular Date period by default take current week . 
        var startDate = new DateTimeOffset(
            fetchScheduleRequest.StartDate ?? DateTime.Now.StartOfWeek()
        ).ToUnixTimeSeconds();

        var endDate = new DateTimeOffset(
            fetchScheduleRequest.EndTime ?? DateTime.Now.EndOfWeek()
        ).ToUnixTimeSeconds();

        var schedules = await context.Schedules.Where(
                (e) =>
                    e.StartTime >= startDate &&
                    e.EndTime <= endDate
            )
            .Include((
                    e) => e.Course
            )
            .Include(
                e => e.Course.Professor
            )
            .Take(500) // limit from incorrect request 
            .ToListAsync();

        var mapped = mapper.Map<List<FetchScheduleResponse>>(
            schedules
        );
        
        return Ok(
            mapped
        );
    }
}