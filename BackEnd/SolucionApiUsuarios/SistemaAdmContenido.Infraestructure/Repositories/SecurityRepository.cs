using Microsoft.EntityFrameworkCore;
using SistemaAdmContenido.Core.Entities;
using SistemaAdmContenido.Core.Interfaces;
using SistemaAdmContenido.Infraestructure.Data;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace SistemaAdmContenido.Infraestructure.Repositories
{
    public class SecurityRepository : ISecurityRepository
    {
        private readonly SistemaAdmContenidoContext _context;
        public SecurityRepository(SistemaAdmContenidoContext contex)
        {
            _context = contex;
        }

        public async Task<bool> DeleteUserSecurity(int id)
        {
            var userLogin = await _context.Securities.FirstOrDefaultAsync(x => x.SecurityId == id);
            _context.Securities.Remove(userLogin);

            int rows = await _context.SaveChangesAsync();

            return rows > 0;
        }

        public async Task<Security> GetLogincredentials(UserLogin user)
        {
               return  await _context.Securities.FirstOrDefaultAsync(x => x.User == user.User && x.Password == user.Password);
        }

        public async Task<Security> GetSecurityId(int id)
        {
            var userLogin = await _context.Securities.FirstOrDefaultAsync(x => x.SecurityId == id);
            return userLogin;
        }

        public async Task<IEnumerable<Security>> GetUserSecurity()
        {
            var userLogin = await _context.Securities.ToListAsync();

            return userLogin;
        }

        public async  Task InsertUserSecurity(Security userLogin)
        {
            _context.Securities.Add(userLogin);
            await _context.SaveChangesAsync();
        }

        public async Task<bool> UpdateUserSecurity(Security user)
        {
            var userLogin = await _context.Securities.FirstOrDefaultAsync(x => x.SecurityId == user.SecurityId);
            userLogin.NameUser = user.NameUser;
            userLogin.Phone = user.Phone;
            userLogin.User = user.User;
            userLogin.Address = user.Address;
            userLogin.Age = user.Age;
            userLogin.Email = user.Email;
            userLogin.Password = user.Password;
            userLogin.Rol = user.Rol;

            int rows = await _context.SaveChangesAsync();

            return rows > 0;
        }
    }
}
