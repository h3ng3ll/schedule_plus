using server_api.DTOs.Group;
using Shared.Models;

namespace server_api.DTOs;

public class UserResponse
{
    public int Id { get; set; }
    public GetDepartmentResponse? Department { get; set; }

    public string? Name { get; set; }
    public required string Email { get; set; }
    public required string? ImgUrl { get; set; }
    public required Role Role { get; set; }
}