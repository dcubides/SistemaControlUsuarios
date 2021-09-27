using AutoMapper;
using SistemaAdmContenido.Core.DTOs;
using SistemaAdmContenido.Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace SistemaAdmContenido.Infraestructure.Mappings
{
    public class AutomapperProfile : Profile
    {
        public AutomapperProfile()
        {
            CreateMap<Post, PostDto>();
            CreateMap<PostDto, Post>();
            CreateMap<Security, SecurityDto>();
            CreateMap<SecurityDto, Security>();
        }
    }
}
