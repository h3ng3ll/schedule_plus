using System.Diagnostics;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using server_api.DTOs.Group;
using Shared.Models;
using Shared.Utils.DB;

namespace server_api.Services.Core;

public interface IDepartmentService
{
    public Task<Department?> GetDepartmentByIdAsync(int id);
    public Task<List<Department>> GetDepartmentsAsync();
    public Task<Department> CreateDepartmentAsync(CreateDepartmentRequest request);
    public Task<bool> DepartmentExistsByNameAsync(string name);
    public Task<bool> DepartmentExistsByIdAsync(int id);
    public Task RemoveDepartmentByIdAsync(int id);

    public Task UpdateDepartmentByIdAsync(UpdateDepartmentRequest request, int id);
}

public class DepartmentService(
    ApplicationContext context,
    IMapper mapper
) : IDepartmentService
{
    public async Task<Department?> GetDepartmentByIdAsync(int id)
    {
        var res = await context.Departments.FindAsync(
            id
        );
        return res;
    }

    public async Task<List<Department>> GetDepartmentsAsync()
    {
        var departments = await context.Departments.ToListAsync();
        return departments;
    }

    public async Task<Department> CreateDepartmentAsync(CreateDepartmentRequest request)
    {
        var department = mapper.Map<Department>(
            request
        );
        context.Departments.Add(
            department
        );
        await context.SaveChangesAsync();
        return department;
    }

    public async Task<bool> DepartmentExistsByNameAsync(string name)
    {
        return await context.Departments.AnyAsync(
            d => d.Name == name
        );
    }

    public async Task<bool> DepartmentExistsByIdAsync(int id)
    {
        var department = await context.Departments.FindAsync(
            id
        );
        var isExists = department != null;

        return isExists;
    }

    public async Task RemoveDepartmentByIdAsync(int id)
    {
        var department = await GetDepartmentByIdAsync(
            id
        );
        Debug.Assert(department != null, nameof(department) + " != null");

        context.Departments.Remove(
            department
        );
        await context.SaveChangesAsync();
    }

    public async Task UpdateDepartmentByIdAsync(
        UpdateDepartmentRequest request,
        int id
    )
    {
        var department = mapper.Map<Department>(
            request
        );

        context.Departments.Update(
            department
        );

        await context.SaveChangesAsync();
    }
}