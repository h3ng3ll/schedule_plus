using Newtonsoft.Json;
using Shared.Models;
using Shared.Utils.DB;

namespace server_api.Models;

public class NotificationQueryParameters
{
    // public List<int>? GroupIds { get; set; }
    
    [JsonProperty("departmentIds")]
    public List<int>? DepartmentIds { get; set; }

    [JsonProperty("includeProfessors")]
    public bool IncludeProfessors { get; set; } = false;
    
    [JsonProperty("includeStudents")]
    public bool IncludeStudents { get; set; } = false;
    

}


