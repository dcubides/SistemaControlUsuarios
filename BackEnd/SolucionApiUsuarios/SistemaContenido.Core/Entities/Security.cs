using SistemaAdmContenido.Core.Enumerations;
using System;
using System.Collections.Generic;
using System.Text;

namespace SistemaAdmContenido.Core.Entities
{
    public class Security
    {
        public int SecurityId { get; set; }
        public string User { get; set; }
        public string NameUser { get; set; }
        public string Password { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public int Age { get; set; }
        public  RoleType Rol { get; set; }



    }
}
