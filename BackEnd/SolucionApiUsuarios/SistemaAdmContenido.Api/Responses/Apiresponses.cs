using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SistemaAdmContenido.Api.Responses
{
    public class Apiresponses<T>
    {
        public Apiresponses(T data)
        {
            Data = data;
        }
        public T Data { get; set; }
    }
}
