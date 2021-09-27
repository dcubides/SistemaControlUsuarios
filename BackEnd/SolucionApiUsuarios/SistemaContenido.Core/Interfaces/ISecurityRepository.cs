using SistemaAdmContenido.Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace SistemaAdmContenido.Core.Interfaces
{
    public interface ISecurityRepository
    {
        Task<IEnumerable<Security>> GetUserSecurity();
        Task<Security> GetSecurityId(int id);
        Task InsertUserSecurity(Security post);
        Task<bool> UpdateUserSecurity(Security post);
        Task<bool> DeleteUserSecurity(int id);
        Task<Security> GetLogincredentials(UserLogin user);
    }
}
