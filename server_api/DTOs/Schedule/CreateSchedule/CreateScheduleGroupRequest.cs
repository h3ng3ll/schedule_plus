using server_api.DTOs.Notification;
using Shared.Models;

namespace server_api.DTOs.Schedule.CreateSchedule;

public class CreateScheduleGroupRequest
{
    
    public List<CreateScheduleRequest> schedules { get; set; }
    
    /// <summary>
    /// Parameters for notification
    /// </summary>
    public bool shouldNotify { get; set; } = false;
    // public SendNotificationsRequest? SendNotificationsRequest { get; set; } 
    
}