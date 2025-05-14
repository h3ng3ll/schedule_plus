using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Shared.Models;

public class Student
{
    [Key] public int Id { get; set; }
    [ForeignKey(nameof(User))] public required int UserId { get; set; }
}