using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Shared.Models.Users;

public class Admin
{
    [Key] public int Id { get; set; }
    [ForeignKey(nameof(User))] public required int UserId { get; set; }
}