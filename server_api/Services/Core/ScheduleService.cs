using Microsoft.EntityFrameworkCore;
using Shared.Models.Schedule;
using Shared.Models.ScheduleGroups;
using Shared.Utils.DB;

namespace server_api.Services.Core;

public interface IScheduleService
{
    public Task<List<Schedule>> GetSchedulesForRange(DateTime startDate, DateTime endDate);
    public Task<Schedule> GetScheduleById(int id);
    public Task<bool> IsExistsScheduleById(int id);
    public Task<Schedule> UpdateSchedule(Schedule schedule, List<int> groupIds);
    public Task<Schedule> CreateSchedule(Schedule schedule, List<int> groupIds);
    public Task DeleteScheduleById(int id);
}

public class ScheduleService(
    ApplicationContext context
) : IScheduleService
{
    public async Task<List<Schedule>> GetSchedulesForRange(DateTime startDate, DateTime endDate)
    {
        var longStartTime = new DateTimeOffset(
            startDate
        ).ToUnixTimeSeconds();

        var longEndTime = new DateTimeOffset(
            endDate
        ).ToUnixTimeSeconds();

        var schedules = await context.Schedules.Where(
                (e) =>
                    (e.StartTime >= longStartTime && e.StartTime <= longEndTime) ||
                    (e.EndTime >= longStartTime && e.EndTime <= longEndTime) ||
                    (e.StartTime <= longStartTime && e.EndTime >= longEndTime)
            )
            .Include(
                e => e.Course
            )
            .Include(
                e => e.Professor.User.Department
            )
            .Include(
                e => e.ScheduleGroups
            ).ThenInclude(
                sg => sg.Group
            )
            .Take(500) // limit from incorrect request 
            .ToListAsync();

        return schedules;
    }

    public async Task<Schedule> GetScheduleById(int id)
    {
        var schedule = await context.Schedules
            .Include(
                e => e.Course
            )
            .Include(
                e => e.ScheduleGroups
            ).ThenInclude(
                es => es.Group
            )
            .Include(
                e => e.Professor.User.Department
            ).Where(
                e => e.Id == id
            )
            .Take(1)
            .FirstOrDefaultAsync();

        return schedule!;
    }

    public async Task<bool> IsExistsScheduleById(int id)
    {
        var schedule = await context.Schedules
            .Include(
                s => s.Course
            )
            .Include(
                s => s.Professor
            )
            .Include(
                s => s.ScheduleGroups
            )
            .FirstOrDefaultAsync(
                e => e.Id == id
            );

        var isExists = schedule != null;
        return isExists;
    }

    public async Task<Schedule> UpdateSchedule(Schedule schedule, List<int> groupIds)
    {
        var existingSchedule = await context.Schedules
            .Include(
                s => s.Course
            )
            .Include(
                s => s.Professor
            )
            .FirstOrDefaultAsync(
                s => s.Id == schedule.Id
            );

        if (existingSchedule == null)
        {
            throw new KeyNotFoundException(
                $"Schedule with ID {schedule.Id} not found"
            );
        }

        existingSchedule.CourseId = schedule.CourseId;
        existingSchedule.ProfessorId = schedule.ProfessorId;
        existingSchedule.Location = schedule.Location;
        existingSchedule.StartTime = schedule.StartTime;
        existingSchedule.EndTime = schedule.EndTime;


        existingSchedule.ScheduleGroups.Clear();

        if (groupIds.Any())
        {
            var groups = await context.Groups
                .Where(
                    g => groupIds.Contains(
                        g.Id
                    )
                )
                .ToListAsync();

            foreach (var group in groups)
            {
                existingSchedule.ScheduleGroups.Add(
                    new ScheduleGroup()
                    {
                        GroupId = group.Id,
                        ScheduleId = schedule.Id,
                    }
                );
            }
        }

        await context.SaveChangesAsync();

        return existingSchedule;
    }

    public async Task<Schedule> CreateSchedule(Schedule schedule, List<int> groupIds)
    {
        var groups = await context.Groups.Where(
            g => groupIds.Contains(
                g.Id
            )
        ).ToListAsync();

        var scheduleGroups = groups.Select(
            e =>
            {
                var scheduleGroup = new ScheduleGroup
                {
                    Group = e,
                    Schedule = schedule
                };
                return scheduleGroup;
            }
        ).ToList();

        schedule.ScheduleGroups = scheduleGroups;

        context.Schedules.Add(
            schedule
        );

        await context.SaveChangesAsync();

        return schedule;
    }

    public async Task DeleteScheduleById(int id)
    {
        var schedule = await context.Schedules.Include(
                s => s.ScheduleGroups
            )
            .FirstAsync(
                e => e.Id == id
            );

        schedule.ScheduleGroups.Clear();

        context.Schedules.Remove(
            schedule
        );

        await context.SaveChangesAsync();
    }
}