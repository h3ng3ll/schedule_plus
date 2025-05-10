using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using server_api.DTOs.Course;
using Shared.Utils.DB;

namespace server_api.Controllers;


[ApiController]
[Route("api/[controller]")]
public class CoursesController(ApplicationContext context)
{

     // [HttpGet("")]
     // [Authorize]
     // public async Task<IActionResult> GetCourses(CoursesRequest coursesRequest )
     // {
     //     // var page = coursesRequest.Page;
     //     // var limit = coursesRequest.Limit;
     //     //
     //     // var courses = context.Courses
     //     //     .Where((e) => e.)
     // }
    
}