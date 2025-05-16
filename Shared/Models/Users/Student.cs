using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Shared.Models.Users;

public class Student
{
    [Key] public int Id { get; set; }
    
    [ForeignKey(nameof(Group))]
    public int GroupId { get; set; }
    
    [ForeignKey(nameof(User))] public required int UserId { get; set; }
    
    public User User { get; set; } = null!;
    public Group Group { get; set; } =  null!;
    
}