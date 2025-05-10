namespace server_api.DTOs.Course;

public class CoursesRequest
{
    public int Page { get; set; } = 1;
    public int Limit { get; set; } = 1;
}