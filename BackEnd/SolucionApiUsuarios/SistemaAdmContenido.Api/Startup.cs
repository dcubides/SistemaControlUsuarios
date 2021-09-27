using AutoMapper;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using SistemaAdmContenido.Core.Interfaces;
using SistemaAdmContenido.Infraestructure.Data;
using SistemaAdmContenido.Infraestructure.Filters;
using SistemaAdmContenido.Infraestructure.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SistemaAdmContenido.Api
{
    public class Startup
    {
        readonly string MiCors = "MiCors";
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            //automapper
            services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

            //cors

            services.AddCors(options => {
                options.AddPolicy(name: MiCors,
                                  builder =>
                                  {
                                      builder.WithHeaders("*");
                                      builder.WithOrigins("*");
                                  });
            });

            services.AddControllers();

            //conexion dbcontext
            services.AddDbContext<SistemaAdmContenidoContext>(options =>
            {
                options.UseSqlServer(Configuration.GetConnectionString("CadenaDeConexion"));
            });

            //midelware
            services.AddMvc(options =>
            {
                options.Filters.Add<ValidationFilter>();
            });

            //dependencias para iyeccion
            services.AddTransient<IPostRepository, postrepository>();
            services.AddTransient<ISecurityRepository, SecurityRepository>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            
            app.UseHttpsRedirection();

            app.UseRouting();
            app.UseCors(MiCors);
            app.UseAuthorization();
            

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
