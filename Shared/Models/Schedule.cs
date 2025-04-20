using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Shared.Models;

public enum Weekday
{
    Monday,
    Tuesday,
    Wednesday,
    Thursday,
    Friday,
}

public class Schedule
{
    [Key]
    public int Id { get; set; }
    
	[ForeignKey(nameof(Course))]
    public int CourseId { get; set; }
    
    [ForeignKey(nameof(User))]
    public int ProfessorId { get; set; }
    
    /// Room № ? or remote 
    public string? Location { get; set; }
    public required Weekday Day { get; set; }

    
    public Course Course { get; set; } = null!;
    public User User { get; set; } = null!;
    
    // Represent in Unix TimeStamp
    public long  StartTime { get; set; }
    public long  EndTime { get; set; }
}