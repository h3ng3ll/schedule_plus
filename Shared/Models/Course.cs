using System.ComponentModel.DataAnnotations;

namespace Shared.Models;

public class Course
{
    [Key] public required int Id { get; set; }

    [Required] [MaxLength(255)] public required string Name { get; set; }
    
}