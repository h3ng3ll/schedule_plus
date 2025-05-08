using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Shared.Models.Notifications;

/// <summary>
/// This table helps to send push notification on particular device
/// </summary>
public class UserDevice
{
    [Key] public int Id { get; set; }

    [ForeignKey(nameof(User))] public int UserId { get; set; }

    [MinLength(143)] [Required] public string DeviceToken { get; set; }

    public User User { get; set; } = null!;
}