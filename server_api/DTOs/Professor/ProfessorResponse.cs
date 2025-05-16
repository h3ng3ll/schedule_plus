using Shared.Models;

namespace server_api.DTOs.Teacher;

public class ProfessorResponse
{
    public int Id { get; set; }
    public UserResponse User { get; set; } = null!; 
}