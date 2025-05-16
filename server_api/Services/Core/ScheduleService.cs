
using AutoMapper;
using Shared.Utils.DB;

namespace server_api.Services.Core;

public interface IScheduleService
{
    
}

public class ScheduleService(
    ApplicationContext context,
    IMapper mapper,
    IGroupService groupService
    ) : IScheduleService
{
    
}