using System;
using System.Collections.Generic;

namespace Shared.Models.g;

public partial class Course
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public int ProfessorId { get; set; }

    public int DepartmentId { get; set; }

    public virtual Department Department { get; set; } = null!;

    public virtual User Professor { get; set; } = null!;

    public virtual ICollection<Schedule> Schedules { get; set; } = new List<Schedule>();
}
