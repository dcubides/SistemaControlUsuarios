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

    public class PostController : Controller
    {
        private readonly IPostRepository _postRepository;
        private readonly IMapper _mapper;
        public PostController(IPostRepository postRepository, IMapper mapper)
        {
            _postRepository = postRepository;
            _mapper = mapper;
        }

        [HttpGet]
        public async Task<IActionResult> GetPosts()
        {
            var posts = await _postRepository.GetPost();
          
            var postsDto = _mapper.Map<IEnumerable<PostDto>>(posts);
            var response = new Apiresponses<IEnumerable<PostDto>>(postsDto);
            return Ok(response);
        }

        [HttpGet("{id}")]

        public async Task<IActionResult> GetPostsId(int id)
        {
            var post = await _postRepository.GetPostId(id);
            var postsDto = _mapper.Map<PostDto>(post);
            var response = new Apiresponses<PostDto>(postsDto);
            return Ok(response);
        }

        [HttpPost]
        public async Task<IActionResult> Post(PostDto postDto)
        {
           
            var post = _mapper.Map<Post>(postDto);
            await _postRepository.InsertPost(post);
            postDto = _mapper.Map<PostDto>(post);
            var response = new Apiresponses<PostDto>(postDto);
            return Ok(response);
        }

        [HttpPut]
        public async Task<IActionResult> Put(int id, PostDto postDto)
        {
            var post = _mapper.Map<Post>(postDto);
            post.PostId = id;
            var result = await _postRepository.UpdatePost(post);
            var response = new Apiresponses<bool>(result);
            return Ok(response);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> delete(int id)
        {
           
           var result = await _postRepository.DeletePost(id);
           var response = new Apiresponses<bool>(result);
           return Ok(response);
        }


    }
}
