using SistemaAdmContenido.Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace SistemaAdmContenido.Core.Interfaces
{
    public interface IPostRepository
    {
        Task<IEnumerable<Post>> GetPost();
        Task<Post> GetPostId(int id);
        Task InsertPost(Post post);
        Task<bool> UpdatePost(Post post);
        Task<bool> DeletePost(int id);

    }
}
