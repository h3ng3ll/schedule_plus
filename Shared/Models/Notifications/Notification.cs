using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Shared.Models;

public class Notification
{
    [Key]
    public int Id { get; set; }
    
    [ForeignKey(nameof(User))]
    public int UserId { get; set; }
    
    public int Title { get; set; }
    public required string Body { get; set; }
    public long CreatedAt { get; set; }

    public User User { get; set; } = null!;
}