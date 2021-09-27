using SistemaAdmContenido.Core.Entities;
using SistemaAdmContenido.Core.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SistemaAdmContenido.Infraestructure.Data;
using Microsoft.EntityFrameworkCore;

namespace SistemaAdmContenido.Infraestructure.Repositories
{
    public class postrepository : IPostRepository
    {

        private readonly SistemaAdmContenidoContext _context;

        public postrepository(SistemaAdmContenidoContext context)
        {
            _context = context;
        }

        async public Task InsertPost(Post post)
        {
            _context.Posts.Add(post);
            await _context.SaveChangesAsync();
        }

        async Task<IEnumerable<Post>> IPostRepository.GetPost()
        {
           var posts = await  _context.Posts.ToListAsync();
            
           return posts;
        }

        async Task<Post> IPostRepository.GetPostId(int id)
        {
            var post = await _context.Posts.FirstOrDefaultAsync(x => x.PostId == id);
            return post;
        }

        async Task<bool> IPostRepository.UpdatePost(Post post) 
        {
            var postRes = await  _context.Posts.FirstOrDefaultAsync(x => x.PostId == post.PostId);
            postRes.Date = post.Date;
            postRes.Description = post.Description;
            postRes.Image = post.Image;

            int rows = await _context.SaveChangesAsync();

            return rows > 0;
        }

        async Task<bool> IPostRepository.DeletePost(int id)
        {
            var postRes = await _context.Posts.FirstOrDefaultAsync(x => x.PostId == id);
            _context.Posts.Remove(postRes);

            int rows = await _context.SaveChangesAsync();

            return rows > 0;

        }
    }
}
