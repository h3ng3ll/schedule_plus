

using server_api.DTOs.Group;
using server_api.DTOs.Teacher;

namespace server_api.DTOs.Schedule;

public class ScheduleResponse
{

    public int Id { get; set; }
    
    
    /// Room № ? or remote 
    public string? Location { get; set; }
    
    public ICollection<GroupResponse> Groups { get; set; } = null!;
    public Shared.Models.Course Course { get; set; } = null!;
    public ProfessorResponse Professor { get; set; } = null!;

    public DateTime  StartTime { get; set; }
    public DateTime  EndTime { get; set; }
    
}