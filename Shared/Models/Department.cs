
using System.ComponentModel.DataAnnotations;

namespace Shared.Models;

public class Department
{
    [Key]
    public int Id { get; set; }
    public required string Name { get; set; }
}