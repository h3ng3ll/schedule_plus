using System.ComponentModel.DataAnnotations;
using Shared.Models;

namespace server_api.DTOs;

public class RegisterStudentRequest : RegisterUserRequest
{

    public int GroupId { get; set; } 
 
}