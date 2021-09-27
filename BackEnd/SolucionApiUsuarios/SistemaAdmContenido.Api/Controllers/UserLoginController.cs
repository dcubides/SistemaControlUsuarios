using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using SistemaAdmContenido.Api.Responses;
using SistemaAdmContenido.Core.DTOs;
using SistemaAdmContenido.Core.Entities;
using SistemaAdmContenido.Core.Interfaces;
using SistemaAdmContenido.Infraestructure.Repositories;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SistemaAdmContenido.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

    public class UserLoginController : Controller
    {
        private readonly ISecurityRepository _securityRepository;
        private readonly IMapper _mapper;

        public UserLoginController(ISecurityRepository securityRepository, IMapper mapper)
        {
            _securityRepository = securityRepository;
            _mapper = mapper;
        }

        [HttpGet]
        public async Task<IActionResult> GetUser()
        {
            var users = await _securityRepository.GetUserSecurity();

            var userssDto = _mapper.Map<IEnumerable<SecurityDto>>(users);
            var response = new Apiresponses<IEnumerable<SecurityDto>>(userssDto);
            return Ok(response);
        }

        [HttpGet("{id}")]

        public async Task<IActionResult> GetPostsId(int id)
        {
            var post = await _securityRepository.GetSecurityId(id);
            var postsDto = _mapper.Map<PostDto>(post);
            var response = new Apiresponses<PostDto>(postsDto);
            return Ok(response);
        }

        [HttpPost]
        public async Task<IActionResult> Post(SecurityDto usuDto)
        {

            var usuario = _mapper.Map<Security>(usuDto);
            await _securityRepository.InsertUserSecurity(usuario);
            usuDto = _mapper.Map<SecurityDto>(usuario);
            var response = new Apiresponses<SecurityDto>(usuDto);
            return Ok(response);
        }

        [HttpPut]
        public async Task<IActionResult> Put(int id, SecurityDto usuDto)
        {
            var user = _mapper.Map<Security>(usuDto);
            user.SecurityId = id;
            var result = await _securityRepository.UpdateUserSecurity(user);
            var response = new Apiresponses<bool>(result);
            return Ok(response);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> delete(int id)
        {

            var result = await _securityRepository.DeleteUserSecurity(id);
            var response = new Apiresponses<bool>(result);
            return Ok(response);
        }

        [HttpPost]
        [Route("login")]
        public async Task<IActionResult> login(UserLogin datos)
        {

            var result = await _securityRepository.GetLogincredentials(datos);
            var user = _mapper.Map<SecurityDto>(result);
            var response = new Apiresponses<SecurityDto>(user);
            return Ok(response);
        }

    }
}
