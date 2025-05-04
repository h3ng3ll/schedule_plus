using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using Shared.Models.g;

namespace EducationalInsitution.Models.Core;

public class Professor
{
    [Key] public int Id;
    [ForeignKey(nameof(User))] public required int UserId { get; set; }
}