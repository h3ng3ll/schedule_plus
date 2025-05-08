using System.ComponentModel.DataAnnotations;

namespace server_api.DTOs.Notification;

public class SaveTokenRequest
{
    [Required] public string token { get; set; } = null!;
}