using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Shared.Models.ScheduleGroups;

namespace Shared.Models;

public class Group
{
    [Key]
    public int Id { get; set; }
    
    [Required]
    public string Name { get; set;  }
    
    public ICollection<ScheduleGroup> ScheduleGroups { get; set; } = new List<ScheduleGroup>();

}