using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using server_api.DTOs.Group;
using Shared.Models;
using ApplicationContext = Shared.Utils.DB.ApplicationContext;

namespace server_api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class GroupController(
    ApplicationContext context,
    IMapper mapper
) : ControllerBase
{
    [HttpGet("{id}")]
    public async Task<IActionResult> GetGroupById(int id)
    {
        var group = await context.Groups.FindAsync(
            id
        );
        if (group == null)
            return NotFound();

        return Ok(group);
    }


    [HttpGet("")]
    public async Task<IActionResult> GetGroups()
    {
        var group = await context.Groups.ToListAsync();

        var groupMapped = group.Select(
            mapper.Map<GroupResponse>
        ).ToList();
        
        return Ok(
            groupMapped
        );
    }


    [Authorize]
    [HttpPost("create")]
    public async Task<IActionResult> CreateSchedule([FromBody] CreateGroupRequest createGroupRequest)
    {
        var group = mapper.Map<Group>(
            createGroupRequest
        );

        var isExistsGroupName = context.Groups.Any(
            g => g.Name == createGroupRequest.Name
        );

        if (isExistsGroupName)
        {
            return Conflict(
                new
                {
                    error = "Group with this name already exists."
                }
            );
        }

        context.Groups.Add(
            group
        );
        await context.SaveChangesAsync();

        return CreatedAtAction(
            nameof(GetGroupById),
            new
            {
                id = group.Id
            },
            group
        );
    }

    [Authorize]
    [HttpDelete("delete/{id}")]
    public async Task<IActionResult> DeleteSchedule(int id)
    {
        var group = context.Groups.FindAsync(
            id
        ).Result;

        if (group == null)
        {
            return Conflict(
                error: new
                {
                    error = $"Group with {id}  No  found."
                }
            );
        }

        context.Groups.Remove(
            group
        );
        await context.SaveChangesAsync();

        return NoContent();
    }

    [Authorize]
    [HttpPut("{id}")]
    public async Task<IActionResult> UpdateSchedule(int id, [FromBody] UpdateGroupRequest updateGroupRequest)
    {
        var group = context.Groups.FindAsync(
            id
        ).Result;

        if (group == null)
        {
            return Conflict(
                new
                {
                    error = $"Group with {id}  No  found."
                }
            );
        }

        group.Name = updateGroupRequest.Name;

        context.Groups.Update(
            group
        );

        await context.SaveChangesAsync();

        return NoContent();
    }
}