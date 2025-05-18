using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using server_api.DTOs.Group;
using server_api.Services.Core;

namespace server_api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class DepartmentController(
    IDepartmentService departmentService
) : ControllerBase
{
    [HttpGet("{id}")]
    public async Task<IActionResult> GetDepartmentById(int id)
    {
        var department = await departmentService.GetDepartmentByIdAsync(
            id
        );
        if (department == null)
            return NotFound();

        return Ok(
            department
        );
    }


    [HttpGet("")]
    public async Task<IActionResult> GetDepartments()
    {
        var departments = await departmentService.GetDepartmentsAsync();

        return Ok(
            departments
        );
    }


    [Authorize]
    [HttpPost("create")]
    public async Task<IActionResult> CreateDepartment([FromBody] CreateDepartmentRequest request)
    {
        var isExistsDepartmentName = await departmentService.DepartmentExistsByNameAsync(
            request.Name
        );

        if (isExistsDepartmentName)
        {
            return Conflict(
                new
                {
                    error = "Department with this name already exists."
                }
            );
        }

        var department = await departmentService.CreateDepartmentAsync(
            request
        );

        return CreatedAtAction(
            nameof(GetDepartmentById),
            new
            {
                id = department.Id
            },
            department
        );
    }

    [Authorize]
    [HttpDelete("delete/{id}")]
    public async Task<IActionResult> DeleteDepartment(int id)
    {
        if (!await departmentService.DepartmentExistsByIdAsync(id))
        {
            return Conflict(
                error: new
                {
                    error = $"Department with {id}  No  found."
                }
            );
        }

        await departmentService.RemoveDepartmentByIdAsync(
            id
        );

        return NoContent();
    }

    [Authorize]
    [HttpPut("{id}")]
    public async Task<IActionResult> UpdateDepartment(
        int id,
        [FromBody] UpdateDepartmentRequest request
    )
    {
        if (!await departmentService.DepartmentExistsByIdAsync(id))
        {
            return Conflict(
                error: new
                {
                    error = $"Department with {id}  No  found."
                }
            );
        }

        await departmentService.UpdateDepartmentByIdAsync(
            request,
            id
        );
        return NoContent();
    }
}