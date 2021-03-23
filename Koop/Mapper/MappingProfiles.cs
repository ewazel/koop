using AutoMapper;
using Koop.Models;
using Koop.Models.Auth;

namespace Koop.Mapper
{
    public class MappingProfiles : Profile
    {
        public MappingProfiles()
        {
            CreateMap<UserSignUp, User>();
        }
    }
}