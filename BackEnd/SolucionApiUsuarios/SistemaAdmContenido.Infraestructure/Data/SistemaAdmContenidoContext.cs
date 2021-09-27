using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using SistemaAdmContenido.Core.Entities;
using SistemaAdmContenido.Infraestructure.Data.Configurations;

namespace SistemaAdmContenido.Infraestructure.Data
{
    public partial class SistemaAdmContenidoContext : DbContext
    {
        public SistemaAdmContenidoContext()
        {
        }

        public SistemaAdmContenidoContext(DbContextOptions<SistemaAdmContenidoContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Comment> Comments { get; set; }
        public virtual DbSet<Post> Posts { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Security> Securities { get; set; }

        

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new CommentConfiguration());

            modelBuilder.ApplyConfiguration(new PostConfiguration());

            modelBuilder.ApplyConfiguration(new UserConfiguration());

            modelBuilder.ApplyConfiguration(new SecurityConfiguration());


        }
    }
}
