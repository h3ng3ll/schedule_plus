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

    [MaxLength(255)] public  string? Name { get; set; }
    [MaxLength(255)] public  string Email { get; set; }
    public string PasswordHash { get; set; }
    
    [Required] public required Role Role { get; set; }
    public required string? ImgUrl { get; set; }
}