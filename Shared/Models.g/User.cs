using System;
using System.Collections.Generic;

namespace Shared.Models.g;

public partial class User
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public string Email { get; set; } = null!;

    public int Role { get; set; }

    public string? ImgUrl { get; set; }

    public string PasswordHash { get; set; } = null!;

    public virtual ICollection<Course> Courses { get; set; } = new List<Course>();

    public virtual ICollection<Schedule> Schedules { get; set; } = new List<Schedule>();
}
