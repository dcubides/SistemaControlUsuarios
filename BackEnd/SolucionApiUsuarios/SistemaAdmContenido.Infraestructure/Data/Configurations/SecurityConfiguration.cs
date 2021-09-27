using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SistemaAdmContenido.Core.Entities;
using SistemaAdmContenido.Core.Enumerations;
using System;
using System.Collections.Generic;
using System.Text;

namespace SistemaAdmContenido.Infraestructure.Data.Configurations
{
    class SecurityConfiguration : IEntityTypeConfiguration<Security>
    {
        public void Configure(EntityTypeBuilder<Security> builder)
        {
            builder.ToTable("Seguridad");
            builder.HasKey(e => e.SecurityId);


            builder.Property(e => e.SecurityId)
                .HasColumnName("IdSeguridad");

            builder.Property(e => e.User)
                .HasColumnName("Usuario")
                .HasMaxLength(50)
                .IsRequired()
                .IsUnicode(false);

            builder.Property(e => e.NameUser)
                .HasColumnName("NombreUsuario")
                .HasMaxLength(200)
                .IsRequired()
                .IsUnicode(false);

            builder.Property(e => e.Password)
                .HasColumnName("Contrasena")
                .HasMaxLength(2000)
                .IsRequired()
                .IsUnicode(false);

            builder.Property(e => e.Address)
                .HasColumnName("Direccion")
                .HasMaxLength(200)
                .IsUnicode(false);

            builder.Property(e => e.Phone)
                 .HasColumnName("Telefono")
                 .HasMaxLength(200)
                 .IsUnicode(false);

            builder.Property(e => e.Email)
                .HasColumnName("Email")
                 .HasMaxLength(200)
                 .IsUnicode(false);


            builder.Property(e => e.Age)
                .HasColumnName("Edad")
                .IsUnicode(false);

            builder.Property(e => e.Rol)
               .HasColumnName("Rol")
               .HasMaxLength(15)
               .IsRequired()
               .IsUnicode(false)
               .HasConversion(
                x => x.ToString(),
                x => (RoleType)Enum.Parse(typeof(RoleType), x)
               );
           


        }
    }
}
