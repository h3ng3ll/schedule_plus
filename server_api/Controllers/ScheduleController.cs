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
                e => e.Groups
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

        return Created();
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

        var groups = await context.Groups.Where(
            (e) => createScheduleRequest.GroupIds.Contains(
                e.Id
            )
        ).ToListAsync();

        var schedule = new Schedule()
        {
            CourseId = createScheduleRequest.CourseId,
            Groups = groups,
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

        await context.SaveChangesAsync();
    }

    /// <summary>
    /// Same as create but create List of Schedules
    /// </summary>
    /// <param name="createScheduleGroupRequest"></param>
    /// <returns></returns>
    [Authorize]
    [HttpPost("createGroup")]
    public async Task<IActionResult> CreateScheduleGroup(
        [FromBody] CreateScheduleGroupRequest createScheduleGroupRequest)
    {
        // Todo: validate role .

        foreach (var schedule in createScheduleGroupRequest.schedules)
        {
            await _CreateSchedule(schedule);
        }
        // Todo: notification handle later .  

        return Created();
    }

    //
    // /// <summary>
    // /// Update Given Schedule Id in DB . 
    // /// </summary>
    // /// <param name="id"></param>
    // /// <param name="updateScheduleRequest"></param>
    // /// <returns></returns>
    // [Authorize]
    // [HttpPut("{id}")]
    // public async Task<IActionResult> UpdateSchedule(int id, [FromBody] UpdateScheduleRequest updateScheduleRequest)
    // {
    //     var schedule = await context.Schedules
    //         .Include(
    //             s => s.Groups
    //         )
    //         .FirstOrDefaultAsync(
    //             s => s.Id == id
    //         );
    //
    //     if (schedule == null) return NotFound();
    //
    //     schedule.CourseId = updateScheduleRequest.CourseId;
    //     schedule.Location = updateScheduleRequest.Location;
    //     schedule.StartTime = new DateTimeOffset(
    //         updateScheduleRequest.StartTime
    //     ).ToUnixTimeSeconds();
    //     schedule.EndTime = new DateTimeOffset(
    //         updateScheduleRequest.EndTime
    //     ).ToUnixTimeSeconds();
    //
    //     // if (updateScheduleRequest.GroupIds == schedule.g)
    //     var scheduleGroups = await context.Groups
    //         .Where(
    //             g => updateScheduleRequest.GroupIds.Contains(
    //                 g.Id
    //             )
    //         ).ToListAsync();
    //
    //     // Remove old group
    //     foreach (var group in scheduleGroups)
    //     {
    //         context.Groups.Remove(group);
    //     }
    //
    //
    //     await context.SaveChangesAsync();
    //
    //     return Ok(
    //         schedule
    //     );
    // }
}