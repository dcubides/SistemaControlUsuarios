using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SistemaAdmContenido.Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace SistemaAdmContenido.Infraestructure.Data.Configurations
{
    public class UserConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.ToTable("Usuario");
            builder.HasKey(e => e.UserId);

            builder.Property(e => e.UserId)
               .HasColumnName("IdUsuario");

            builder.Property(e => e.LastNames)
                .HasColumnName("Apellidos")
                .IsRequired()
                .HasMaxLength(50)
                .IsUnicode(false);

            builder.Property(e => e.Email)
                .HasColumnName("Email")
                .IsRequired()
                .HasMaxLength(30)
                .IsUnicode(false);

            builder.Property(e => e.DateBird)
                .HasColumnName("FechaNacimiento")
                .HasColumnType("date");

            builder.Property(e => e.FirsName)
                .HasColumnName("Nombres")
                .IsRequired()
                .HasMaxLength(50)
                .IsUnicode(false);

            builder.Property(e => e.Phone)
                .HasColumnName("Telefono")
                .HasMaxLength(10)
                .IsUnicode(false);

            builder.Property(e => e.IsActive)
                .HasColumnName("Activo");
        }
    }
}
