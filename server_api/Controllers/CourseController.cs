using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using server_api.DTOs.Course;
using Shared.Models;
using ApplicationContext = Shared.Utils.DB.ApplicationContext;


namespace server_api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class CourseController(
    ApplicationContext context,
    IMapper mapper
) : ControllerBase
{
    [Authorize]
    [HttpGet("{id}")]
    public async Task<IActionResult> GetCourseById(int id)
    {
        var course = await context.Courses.FindAsync(
            id
        );
        if (course == null)
            return NotFound();

        return Ok(
            course
        );
    }


    [Authorize]
    [HttpGet("")]
    public async Task<IActionResult> GetCourses()
    {
        var course = await context.Courses.ToListAsync();

        return Ok(
            course
        );
    }


    [Authorize]
    [HttpPost("create")]
    public async Task<IActionResult> CreateCourse([FromBody] CreateCourseRequest createCreateCourseRequest)
    {
        var course = mapper.Map<Course>(
            createCreateCourseRequest
        );

        var isExistsGroupName = context.Courses.Any(
            c => c.Name == createCreateCourseRequest.Name
        );

        if (isExistsGroupName)
        {
            return Conflict(
                new
                {
                    error = "Course with this name already exists."
                }
            );
        }

        context.Courses.Add(
            course
        );
        await context.SaveChangesAsync();

        return CreatedAtAction(
            nameof(GetCourseById),
            new
            {
                id = course.Id
            },
            course
        );
    }

    [Authorize]
    [HttpDelete("delete/{id}")]
    public async Task<IActionResult> DeleteCourse(int id)
    {
        var course = context.Courses.FindAsync(
            id
        ).Result;

        if (course == null)
        {
            return Conflict(
                error: new
                {
                    error = $"Course with {id}  No  found."
                }
            );
        }

        context.Courses.Remove(
            course
        );
        await context.SaveChangesAsync();

        return NoContent();
    }

    [Authorize]
    [HttpPut("{id}")]
    public async Task<IActionResult> UpdateCourse(int id, [FromBody] UpdateCourseRequest updateCourseRequest)
    {
        var course = context.Courses.FindAsync(
            id
        ).Result;

        if (course == null)
        {
            return Conflict(
                new
                {
                    error = $"Group with {id}  No  found."
                }
            );
        }

        course.Name = updateCourseRequest.Name;

        context.Courses.Update(
            course
        );

        await context.SaveChangesAsync();

        return NoContent();
    }
}