using Shared.Models;

namespace server_api.DTOs;

public class UserResponse
{
    public int Id { get; set; }
    
    public  string? Name { get; set; }
    
    public Shared.Models.Group? Group { get; set; }
    public Department? Department { get; set; }

    public string Email { get; set; } = null!;
    public string Role { get; set; } = null!;

    public required string? ImgUrl { get; set; }
}