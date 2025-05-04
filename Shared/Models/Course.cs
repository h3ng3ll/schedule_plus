using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace Shared.Models;

public class Course
{
    [Key] public required int Id { get; set; }

    [Required] [MaxLength(255)] public required string Name { get; set; }

    [ForeignKey(nameof(User))] public required int ProfessorId { get; set; }

    public User User { get; set; } = null!;
}