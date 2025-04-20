using System.ComponentModel.DataAnnotations;

namespace Shared.Models;

public enum Role
{
    Student,
    Teacher,
    Admin,
}

public class User
{
    [Key] public int Id { get; set; }

    [Required] [MaxLength(255)] public required string Name { get; set; }
    [Required] [MaxLength(255)] public required string Email { get; set; }
    [Required] public required string Role { get; set; }
    public required string? ImgUrl { get; set; }
}