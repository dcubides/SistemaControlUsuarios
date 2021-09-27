using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SistemaAdmContenido.Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace SistemaAdmContenido.Infraestructure.Data.Configurations
{
   public class CommentConfiguration : IEntityTypeConfiguration<Comment>
    {
        public void Configure(EntityTypeBuilder<Comment> builder)
        {
            builder.ToTable("Comentario");
            builder.HasKey(e => e.CommentId);

            builder.Property(e => e.CommentId)
                .HasColumnName("IdComentario")
                .ValueGeneratedNever();

            builder.Property(e => e.PostId)
               .HasColumnName("IdPublicacion");


            builder.Property(e => e.UserId)
                .HasColumnName("IdUsuario");

            builder.Property(e => e.Description)
                .IsRequired()
                .HasColumnName("Descripcion")
                .HasMaxLength(500)
                .IsUnicode(false);

            builder.Property(e => e.Date)
                .HasColumnType("datetime")
                .HasColumnName("Fecha");

            builder.Property(e => e.IsActive)
                .HasColumnName("Activo");

            builder.HasOne(d => d.Post)
                .WithMany(p => p.Coments)
                .HasForeignKey(d => d.PostId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Comentario_Publicacion");

            builder.HasOne(d => d.User)
                .WithMany(p => p.Comment)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Comentario_Usuario");
        }
    }
}
