using System.ComponentModel.DataAnnotations;

namespace server_api.DTOs;

public class RegisterRequest
{
    [Required] public string Email { get; set; }
    [Required] public string Password { get; set; }
    public string? Name { get; set; }
}