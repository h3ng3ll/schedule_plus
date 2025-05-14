using Shared.Models;


namespace server_api.DTOs.Schedule;

public class FetchScheduleResponse
{

    public int Id { get; set; }
    
    
    /// Room № ? or remote 
    public string? Location { get; set; }
    
    public Shared.Models.Course Course { get; set; } = null!;
    public ICollection<Shared.Models.Group> Groups { get; set; } = null!;
    public Professor Professor { get; set; } = null!;

    public DateTime  StartTime { get; set; }
    public DateTime  EndTime { get; set; }
    
}