using server_api.DTOs.Notification;
using Shared.Models;

namespace server_api.DTOs.Schedule.CreateSchedule;

public class UpdateScheduleRequest
{
    
    public int CourseId { get; set; }
    public required List<int> GroupIds { get; set; }
    public required int ProfessorId { get; set; }
    
    /// Room № ? or remote 
    public string? Location { get; set; }
    
    public DateTime  StartTime { get; set; }
    public DateTime  EndTime { get; set; }
    
}