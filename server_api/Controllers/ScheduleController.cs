using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using server_api.DTOs.Schedule;
using server_api.DTOs.Schedule.CreateSchedule;
using server_api.Services.Core;
using server_api.Utils.Extensions;
using Shared.Models.Schedule;
using ApplicationContext = Shared.Utils.DB.ApplicationContext;

namespace server_api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ScheduleController(
    ApplicationContext context,
    IMapper mapper,
    IGroupService groupService,
    IScheduleService scheduleService
) : ControllerBase
{
    /// <summary>
    ///  By Default return Schedule for a week 
    /// </summary>
    [HttpGet("")]
    [Authorize]
    public async Task<IActionResult> FetchSchedules([FromQuery] FetchScheduleRequest request)
    {
        //  If not specify particular Date period by default take current week . 
        var startDate = request.StartDate ?? DateTime.Now.StartOfWeek();
        var endDate = request.EndTime ?? DateTime.Now.EndOfWeek();

        var schedules = await scheduleService.GetSchedulesForRange(
            startDate, endDate
        );

        var mapped = mapper.Map<List<FetchScheduleResponse>>(
            schedules
        );

        return Ok(
            mapped
        );
    }


    [Authorize]
    [HttpGet("{id}")]
    public async Task<IActionResult> GetScheduleById(int id)
    {
        if (!await scheduleService.IsExistsScheduleById(id))
        {
            return NotFound(value: new
                {
                    error = "Schedule not found."
                }
            );
        }

        var schedule = await scheduleService.GetScheduleById(
            id
        );

        var scheduleRes = mapper.Map<FetchScheduleResponse>(
            schedule
        );
        return Ok(
            scheduleRes
        );
    }

    [Authorize]
    [HttpPost("create")]
    public async Task<IActionResult> CreateSchedule([FromBody] CreateScheduleRequest createScheduleRequest)
    {
        var res = await GetSchedulesValidation(
            createScheduleRequest
        );
        if (res != null) return res;

        // Todo: notification handle later .

        var schedule = mapper.Map<Schedule>(
            createScheduleRequest
        );

        schedule = await scheduleService.CreateSchedule(
            schedule,
            createScheduleRequest.GroupIds
        );

        var scheduleRes = mapper.Map<FetchScheduleResponse>(
            schedule
        );
        return Ok(
            scheduleRes
        );
    }

    private async Task<IActionResult?> GetSchedulesValidation(CreateScheduleRequest createScheduleRequest)
    {
        if (createScheduleRequest.GroupIds.Count == 0)
        {
            return BadRequest(new
                {
                    error = "There are no groups!"
                }
            );
        }

        var groups = await groupService.GetGroupByIdsAsync(
            createScheduleRequest.GroupIds
        );

        // Check if all groups found
        if (createScheduleRequest.GroupIds.Count != groups.Count)
        {
            return BadRequest(
                new
                {
                    error = "Some Group document references are absent"
                }
            );
        }
        if (createScheduleRequest.StartTime == DateTime.MinValue)
        {
            return BadRequest(
                new
                {
                    error = "Invalid date format"
                }
            );
        }
        return null;
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

        // check at least 1 
        var res = await GetSchedulesValidation(
            createScheduleGroupRequest.schedules.First()
        );
        if (res != null) return res;

        foreach (var createScheduleRequest in createScheduleGroupRequest.schedules)
        {
            var schedule = mapper.Map<Schedule>(
                createScheduleRequest
            );

            await scheduleService.CreateSchedule(
                schedule,
                createScheduleRequest.GroupIds
            );
        }
        // Todo: notification handle later .  

        return Created();
    }


    /// <summary>
    /// Update Given Schedule Id in DB . 
    /// </summary>
    /// <param name="id"></param>
    /// <param name="request"></param>
    /// <returns></returns>
    [Authorize]
    [HttpPut("{id}")]
    public async Task<IActionResult> UpdateSchedule(int id, [FromBody] UpdateScheduleRequest request)
    {
        var isExists = await scheduleService.IsExistsScheduleById(
            id
        );
        if (!isExists) return NotFound();

        Schedule schedule = mapper.Map<Schedule>(
            request
        );
        schedule.Id = id;

        await scheduleService.UpdateSchedule(
            schedule,
            request.GroupIds
        );

        var updatedSchedule = await scheduleService.GetScheduleById(
            id
        );

        return Ok(
            updatedSchedule
        );
    }

    [Authorize]
    [HttpDelete("delete/{id}")]
    public async Task<IActionResult> DeleteSchedule(int id)
    {
        var isExists = await scheduleService.IsExistsScheduleById(
            id
        );
        if (!isExists) return NotFound();

        await scheduleService.DeleteScheduleById(
            id
        );

        return NoContent();
    }
}