using Shared.Models;
using Shared.Utils.DB;

namespace server_api.Models.IRecipient;


public interface IRecipient
{
    public List<int>? DepartmentId { get; set; }

    Task<List<User>> GetRecipientsAsync(
        ApplicationContext context
    );
}