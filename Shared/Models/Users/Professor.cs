using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Shared.Models;



public class Professor
{
    [Key] public int Id { get; set; }
    [ForeignKey(nameof(User))] public required int UserId { get; set; }
    
    public User  User { get; set; } = null!;
}