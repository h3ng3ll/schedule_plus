namespace server_api.DTOs.Course;

public class CoursesResponse
{

        public int Id { get; set; }

        public string Name { get; set; }

        public string Teacher { get; set; }

        public string Group { get; set; }
        
        public DateTime Date { get; set; }
        
        public string Time { get; set; }
        
        public string Room { get; set; }
}