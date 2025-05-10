using Shared.Models;

namespace server_api.DTOs.Teacher;

public class ProfessorResponse
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string Email { get; set; }
    public string Role { get; set; }
    public string ImgUrl { get; set; }
}