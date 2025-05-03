using System;
using System.Collections.Generic;

namespace Shared.Models.g;

public partial class Schedule
{
    public int Id { get; set; }

    public int CourseId { get; set; }

    public int ProfessorId { get; set; }

    public string? Location { get; set; }

    public int Day { get; set; }

    public long StartTime { get; set; }

    public long EndTime { get; set; }

    public virtual Course Course { get; set; } = null!;

    public virtual User Professor { get; set; } = null!;
}
