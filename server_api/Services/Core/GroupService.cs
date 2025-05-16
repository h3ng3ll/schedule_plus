using System.Diagnostics;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using server_api.DTOs.Group;
using Shared.Models;
using Shared.Utils.DB;

namespace server_api.Services.Core;

public interface IGroupService
{
    public Task<Group?> GetGroupByIdAsync(int id);
    public Task<List<Group>> GetGroupByIdsAsync(List<int> ids);
    public Task<List<Group>> GetGroupsAsync();
    public Task<Group> CreateGroupAsync(CreateGroupRequest request);
    public Task<bool> IsExistsGroupByNameAsync(string name);
    public Task<bool> IsExistsGroupByIdAsync(int id);
    public Task RemoveGroupByIdAsync(int id);

    public Task UpdateGroupByIdAsync(UpdateGroupRequest request, int id);
}

public class GroupService(
    ApplicationContext context,
    IMapper mapper
) : IGroupService
{
    public async Task<Group?> GetGroupByIdAsync(int id)
    {
        var res = await context.Groups.FindAsync(
            id
        );
        return res;
    }

    public async  Task<List<Group>> GetGroupByIdsAsync(List<int> ids)
    {
        var groups = await context.Groups.Where(
            (e) => ids.Contains(
                e.Id
            )
        ).ToListAsync();
        return groups;
    }

    public async Task<List<Group>> GetGroupsAsync()
    {
        var groups = await context.Groups.ToListAsync();
        return groups;
    }

    public async Task<Group> CreateGroupAsync(CreateGroupRequest request)
    {
        var groups = mapper.Map<Group>(
            request
        );
        context.Groups.Add(
            groups
        );
        await context.SaveChangesAsync();
        return groups;
    }

    public async Task<bool> IsExistsGroupByNameAsync(string name)
    {
        return await context.Groups.AnyAsync(
            g => g.Name == name
        );
    }

    public async Task<bool> IsExistsGroupByIdAsync(int id)
    {
        var group = await context.Groups.FindAsync(
            id
        );
        var isExists = group != null;

        return isExists;
    }

    public async Task RemoveGroupByIdAsync(int id)
    {
        var group = await GetGroupByIdAsync(
            id
        );
        Debug.Assert(group != null, nameof(group) + " != null");

        context.Groups.Remove(
            group
        );
        await context.SaveChangesAsync();
    }

    public async Task UpdateGroupByIdAsync(
        UpdateGroupRequest request,
        int id
    )
    {
        var groups = mapper.Map<Group>(
            request
        );

        context.Groups.Update(
            groups
        );

        await context.SaveChangesAsync();
    }
}