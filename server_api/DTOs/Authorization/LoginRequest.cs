using System.ComponentModel.DataAnnotations;

namespace server_api.DTOs;

public class LoginRequest
{
    [Required] public string Identiefier { get; set; }
    [Required] public string Password { get; set; }
}