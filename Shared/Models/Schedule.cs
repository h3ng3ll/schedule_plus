using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using EducationalInsitution.Models.Core;

namespace Shared.Models;


public class Schedule
{
    [Key]
    public int Id { get; set; }
    
	[ForeignKey(nameof(Course))]
    public int CourseId { get; set; }
    
    [ForeignKey(nameof(Professor))]
    public int ProfessorId { get; set; }
    
    [ForeignKey(nameof(Group))]
    public int GroupId { get; set; }
    
    /// Room № ? or remote 
    public string? Location { get; set; }
    
    
    public Course Course { get; set; } = null!;
    public Group Group { get; set; } = null!;
    public Professor Professor { get; set; } = null!;
    
    
    // Represent in Unix TimeStamp
    public long  StartTime { get; set; }
    public long  EndTime { get; set; }
}