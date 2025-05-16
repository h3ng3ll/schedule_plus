using Shared.Models;

namespace server_api.DTOs;

public class UserResponse
{
    public int Id { get; set; }
    public int? DepartmentId { get; set; }

    public string? Name { get; set; }
    public string Email { get; set; }
    public string User { get; set; }
    public required string? ImgUrl { get; set; }
    public required Role Role { get; set; }
}