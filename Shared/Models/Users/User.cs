using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Shared.Models;

public enum Role
{
    Student,
    Professor,
    Admin,
}

public class User
{
    [Key] public int Id { get; set; }
    [ForeignKey(nameof(Department))] public int? DepartmentId { get; set; }

    [MaxLength(255)] public  string? Name { get; set; }
    [MaxLength(255)] public  string Email { get; set; }
    public required string? ImgUrl { get; set; }
    [Required] public required Role Role { get; set; }

    public Department? Department { get; set; } 
     

    public string PasswordHash { get; set; }
}