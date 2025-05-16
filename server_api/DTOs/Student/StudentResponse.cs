using Shared.Models;

namespace server_api.DTOs.Student;

public class StudentResponse
{
    public StudentResponse User { get; set; } = null!; 
    public Shared.Models.Group Group { get; set; } = null!;
}