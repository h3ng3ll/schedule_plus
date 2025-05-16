using Shared.Models;


public class RegisterUserRequest
{
    public string Email { get; set; }
    public string Password { get; set; }
    
    public string? Name { get; set; }
    
    public int DepartmentId { get; set; }
}