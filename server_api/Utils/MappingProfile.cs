using AutoMapper;
using server_api.DTOs;
using server_api.DTOs.Course;
using server_api.DTOs.Group;
using server_api.DTOs.Notification;
using server_api.DTOs.Schedule;
using server_api.DTOs.Schedule.CreateSchedule;
using server_api.DTOs.Student;
using server_api.DTOs.Teacher;
using Shared.Models;
using Shared.Models.Schedule;
using Shared.Models.ScheduleGroups;
using Shared.Models.Users;

namespace server_api.Utils;

public class MappingProfile : Profile
{
    public MappingProfile()
    {
        CreateMap<Professor, ProfessorResponse>();
        CreateMap<Student, StudentResponse>().ForMember(
            dest => dest.User,
            opt => opt.MapFrom(
                src => src.User
            )
        );

        CreateMap<User, UserResponse>().ForMember(
            dest => dest.Department,
            origin => origin.MapFrom(
                src => src.Department
            )
        );


        CreateMap<CreateGroupRequest, Group>();
        CreateMap<Group, GroupResponse>();
        CreateMap<GroupResponse, Group>();


        CreateMap<CreateCourseRequest, Course>();

        CreateMap<CreateDepartmentRequest, Department>();
        CreateMap<UpdateDepartmentRequest, Department>();
        CreateMap<Department, GetDepartmentResponse>();

        CreateMap<RegisterStudentRequest, RegisterUserRequest>();

        CreateMap<RegisterUserRequest, User>();
        CreateMap<Student, StudentResponse>();

        CreateMap<Group, ScheduleGroup>();

        CreateMap<Schedule, ScheduleResponse>()
            .ForMember(
                dest => dest.StartTime,
                opt => opt.MapFrom(
                    src => DateTimeOffset.FromUnixTimeSeconds(
                        src.StartTime
                    ).ToUniversalTime().LocalDateTime
                )
            )
            .ForMember(
                dest => dest.EndTime,
                opt => opt.MapFrom(
                    src => DateTimeOffset.FromUnixTimeSeconds(
                        src.EndTime
                    ).ToUniversalTime().LocalDateTime
                )
            )
            .ForMember(
                dest => dest.Groups,
                opt => opt.MapFrom(
                    src => src.ScheduleGroups.Select(
                        sg => sg.Group
                    )
                )
            );
        ;

        CreateMap<CreateScheduleRequest, Schedule>()
            .ForMember(
                dest => dest.StartTime,
                opt => opt.MapFrom(
                    src => new DateTimeOffset(
                        src.StartTime
                    ).ToUnixTimeSeconds()
                )
            )
            .ForMember(
                dest => dest.EndTime,
                opt => opt.MapFrom(
                    src => new DateTimeOffset(
                        src.EndTime
                    ).ToUnixTimeSeconds()
                )
            );
        CreateMap<UpdateScheduleRequest, Schedule>()
            .ForMember(
                dest => dest.StartTime,
                opt => opt.MapFrom(
                    src => new DateTimeOffset(
                        src.StartTime
                    ).ToUnixTimeSeconds()
                )
            )
            .ForMember(
                dest => dest.EndTime,
                opt => opt.MapFrom(
                    src => new DateTimeOffset(
                        src.EndTime
                    ).ToUnixTimeSeconds()
                )
            );
        CreateMap<Notification, NotificationResponse>();
    }
}