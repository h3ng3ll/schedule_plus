namespace server_api.DTOs.Schedule;

public class FetchScheduleRequest
{
    public DateTime? StartDate { get; set; } = null;
    public DateTime? EndTime { get; set; } = null;
    
}