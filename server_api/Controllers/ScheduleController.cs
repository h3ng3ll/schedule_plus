using System.Security.Claims;
using System.Text.Json;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using server_api.DTOs.Schedule;
using server_api.DTOs.Schedule.CreateSchedule;
using server_api.Utils.Extensions;
using Shared.Models;
using ApplicationContext = Shared.Utils.DB.ApplicationContext;

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
                    e.StartTime <= endDate &&
                    e.EndTime >= startDate
            )
            .Include(
                e => e.Course
            )
            .Include(
                e => e.Professor.User
            )
            .Include(
                e => e.Group
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


    [Authorize]
    [HttpPost("create")]
    public async Task<IActionResult> CreateSchedule([FromBody] CreateScheduleRequest createScheduleRequest)
    {
        // Todo: validate role .
        await _CreateSchedule(createScheduleRequest);

        // Todo: notification handle later .  

        return Ok();
    }


    private async Task _CreateSchedule(CreateScheduleRequest createScheduleRequest)
    {
        
        if (createScheduleRequest.GroupIds.Count == 0)
        {
             BadRequest(new
                { error = "There are no groups!" }
            );
             return;
        }

        foreach (var groupId in createScheduleRequest.GroupIds)
        {
            var schedule = new Schedule()
            {
                CourseId = createScheduleRequest.CourseId,
                GroupId = groupId,
                ProfessorId = createScheduleRequest.ProfessorId,

                Location = createScheduleRequest.Location,

                StartTime = new DateTimeOffset(
                    createScheduleRequest.StartTime
                ).ToUnixTimeSeconds(),
                EndTime = new DateTimeOffset(
                    createScheduleRequest.EndTime
                ).ToUnixTimeSeconds(),
            };
            context.Schedules.Add(
                schedule
            );
        }

        await context.SaveChangesAsync();
    }
    /// <summary>
    /// Same as create but create List of Schedules
    /// </summary>
    /// <param name="createScheduleGroupRequest"></param>
    /// <returns></returns>
    [Authorize]
    [HttpPost("createGroup")]
    public async Task<IActionResult> CreateScheduleGroup([FromBody] CreateScheduleGroupRequest createScheduleGroupRequest)
    {
        // Todo: validate role .

        foreach (var schedule in createScheduleGroupRequest.schedules)
        {
            await _CreateSchedule(schedule);
        }
        // Todo: notification handle later .  

        return Ok();
    }
}