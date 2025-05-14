using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Shared.Models.Schedule;

public class Schedule
{
	[Key] public int Id { get; set; }

	[ForeignKey(nameof(Course))] public int CourseId { get; set; }

	[ForeignKey(nameof(Professor))] public int ProfessorId { get; set; }


	/// Room № ? or remote 
	public string? Location { get; set; }
	
	public ICollection<Group> Groups { get; set; } = new List<Group>();
	
	public Course Course { get; set; } = null!;

	public Professor Professor { get; set; } = null!;


	// Represent in Unix TimeStamp
	public long StartTime { get; set; }
	public long EndTime { get; set; }


}