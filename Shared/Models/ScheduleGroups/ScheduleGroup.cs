
namespace Shared.Models.ScheduleGroups;

public class ScheduleGroup
{
    public int ScheduleId { get; set; }
    public Schedule.Schedule Schedule { get; set; }

    public int GroupId { get; set; }
    public Group Group { get; set; }
}