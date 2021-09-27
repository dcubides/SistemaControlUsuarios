USE [master]
GO
/****** Object:  Database [SistemaAdmContenido]    Script Date: 9/27/2021 1:09:06 AM ******/
CREATE DATABASE [SistemaAdmContenido]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SistemaAdmContenido', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SistemaAdmContenido.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SistemaAdmContenido_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SistemaAdmContenido.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SistemaAdmContenido].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SistemaAdmContenido] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [SistemaAdmContenido] SET ANSI_NULLS ON 
GO
ALTER DATABASE [SistemaAdmContenido] SET ANSI_PADDING ON 
GO
ALTER DATABASE [SistemaAdmContenido] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [SistemaAdmContenido] SET ARITHABORT ON 
GO
ALTER DATABASE [SistemaAdmContenido] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SistemaAdmContenido] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SistemaAdmContenido] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SistemaAdmContenido] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SistemaAdmContenido] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [SistemaAdmContenido] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [SistemaAdmContenido] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SistemaAdmContenido] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [SistemaAdmContenido] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SistemaAdmContenido] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SistemaAdmContenido] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SistemaAdmContenido] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SistemaAdmContenido] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SistemaAdmContenido] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SistemaAdmContenido] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SistemaAdmContenido] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SistemaAdmContenido] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SistemaAdmContenido] SET RECOVERY FULL 
GO
ALTER DATABASE [SistemaAdmContenido] SET  MULTI_USER 
GO
ALTER DATABASE [SistemaAdmContenido] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SistemaAdmContenido] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SistemaAdmContenido] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SistemaAdmContenido] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SistemaAdmContenido] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SistemaAdmContenido', N'ON'
GO
USE [SistemaAdmContenido]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 9/27/2021 1:09:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comentario](
	[IdComentario] [int] NOT NULL,
	[IdPublicacion] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Comentario] PRIMARY KEY CLUSTERED 
(
	[IdComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Publicacion]    Script Date: 9/27/2021 1:09:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Publicacion](
	[IdPublicacion] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Descripcion] [varchar](1000) NOT NULL,
	[Imagen] [varchar](500) NULL,
 CONSTRAINT [PK_Publicacion] PRIMARY KEY CLUSTERED 
(
	[IdPublicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Seguridad]    Script Date: 9/27/2021 1:09:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Seguridad](
	[IdSeguridad] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[NombreUsuario] [varchar](200) NOT NULL,
	[Contrasena] [varchar](2000) NOT NULL,
	[Direccion] [varchar](200) NULL,
	[Telefono] [varchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[Edad] [int] NULL,
	[Rol] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSeguridad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 9/27/2021 1:09:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Email] [varchar](30) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Telefono] [varchar](10) NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (1, 29, 2, N'Ea vero eius omnis. Tenetur adipisci dolorem magnam iste officia. Et perspiciatis quisquam placeat voluptas et fugit ea ipsa. Aut sunt omnis et. Est aut qui recusandae maxime magnam corrupti officiis. Numquam harum error atque sed assumenda. Eos commodi aperiam natus saepe pariatur cum tempore porro ut...', CAST(N'1994-12-21 00:48:37.190' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (2, 24, 13, N'Voluptatem eaque error quis aspernatur ut unde. Nesciunt illum voluptas. Ad dolorum placeat? Soluta fugit itaque. Fugit vel exercitationem. Quia et aut.
Sit expedita eligendi. Natus minus nobis! Nesciunt unde hic. Animi odit consequatur! Sed cupiditate commodi. Sit dolor aut? Voluptatibus ut eius. Reiciendis et qui! Rerum consequuntur dolorem.
Ea alias omnis.', CAST(N'2007-10-02 22:56:39.590' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (3, 26, 11, N'Magnam qui iusto. Neque aliquam est aut iure delectus iusto ut facere; excepturi soluta omnis deleniti consequuntur veniam et. Officia sunt nisi aliquam. Sed velit aliquid et! Illo iste nihil? Id laborum ducimus. Voluptatibus voluptatem porro...
Fugit quaerat maxime. Asperiores aut fugiat? Et dolorum debitis! Optio nobis voluptas.
Voluptatem impedit eos.', CAST(N'1994-01-20 16:00:01.700' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (4, 2, 11, N'Corporis similique minus. Ipsa doloribus consequuntur ea ut ex est; sit minus debitis libero reiciendis optio amet aut. Ut eum autem! Distinctio architecto dicta. Sequi possimus explicabo. In exercitationem ut. Delectus qui illum!
Fugiat laudantium eligendi. Vero modi libero. Voluptate vitae nihil! Nemo praesentium incidunt. Qui voluptatem error. Nulla et sed. Voluptatem quia minima.', CAST(N'1998-04-12 20:42:33.920' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (5, 13, 12, N'Quam nulla adipisci rem aut natus ad adipisci amet. Eos dolorem nisi nihil quam reprehenderit! Est iste earum...
Ullam sint reprehenderit libero alias omnis. Quia amet pariatur dolores qui aliquam cumque est ut placeat. Minima libero minus provident dignissimos architecto quae non nostrum. At neque vel. Repellat omnis accusantium. Sapiente et aspernatur.', CAST(N'1975-01-26 03:54:35.490' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (6, 9, 9, N'Consequatur laudantium deleniti. Sed tempora sed sit dicta pariatur ut laborum consequatur sunt. Ea corrupti error, modi nihil expedita nam blanditiis cumque temporibus. Et quae cum voluptas maiores unde et ex vitae non; alias consequatur ut aperiam eius veritatis unde accusantium vel quia.', CAST(N'2014-03-09 08:53:57.350' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (7, 31, 8, N'Est sed minus reprehenderit eum dolores iusto tempora sapiente adipisci.', CAST(N'1981-12-25 04:01:37.770' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (8, 50, 10, N'Distinctio sunt sed temporibus repellendus iste labore dolor enim qui. Iure ea sit hic consectetur harum deleniti similique vel ad? Rem rerum est accusantium fugit ut eos unde commodi ea.
Est ullam non, ut minima adipisci dignissimos vitae nobis sed.', CAST(N'1986-08-04 01:45:40.110' AS DateTime), 0)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (9, 6, 3, N'Dolorum quis quo porro dolore vel. Qui voluptates id qui pariatur explicabo assumenda quod corporis id? Eaque explicabo deserunt; tempore dolores impedit. Illum odio harum nemo sit omnis et in. Repellendus ut cupiditate impedit; aperiam illo sequi quo dolorem, veritatis omnis consequatur et non.', CAST(N'2018-02-10 09:35:21.470' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (10, 46, 2, N'Sed consequatur sit. Exercitationem minima vel. Dolores voluptatem molestiae; vel qui cupiditate. Minus fuga dolorem? Fugit ut dolorem; dolor distinctio unde. Omnis deserunt magnam.
Animi fugiat et; sunt voluptatem error? Debitis ipsam suscipit! Error nam magnam. Sequi est omnis; maxime quia saepe. Odit assumenda corrupti. Voluptatem est adipisci. Sit omnis ut!
Repudiandae adipisci;', CAST(N'1990-04-06 00:58:36.330' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (11, 33, 18, N'Omnis atque sed qui sed. Deleniti itaque, eum aut voluptatem ullam veritatis odio quia consectetur! Veritatis quis eveniet unde asperiores, voluptate doloribus omnis perspiciatis et; aut fuga et est, et iste ipsam inventore tenetur nostrum. Explicabo ab, debitis et reprehenderit et fugit eligendi reiciendis rerum.', CAST(N'1989-03-19 14:47:04.170' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (12, 40, 1, N'Blanditiis quis ut suscipit alias perspiciatis. Consequuntur eligendi repellendus laboriosam quas maxime qui, sunt tempore error; quod unde vel et culpa ut nihil aspernatur. Et sequi et voluptate pariatur ipsum expedita. Tenetur quasi aliquid sit tenetur et ea dolore accusantium deserunt! In veniam quod. Vitae aperiam natus. Non sed inventore!', CAST(N'1970-03-12 17:29:08.890' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (13, 19, 4, N'Ut error reprehenderit autem consequatur impedit soluta ex aut ipsam; repellat suscipit officiis molestias iste omnis nisi ad consequatur assumenda.', CAST(N'2007-08-24 15:30:35.290' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (14, 44, 16, N'Velit quasi sed. Explicabo aut rem laborum qui dignissimos non dolore voluptate...
Et laboriosam enim facere iste suscipit ut. Autem fugit perferendis vel animi itaque ex et qui! Cumque omnis beatae eius molestiae voluptatem qui. At soluta pariatur. Laboriosam eveniet illo? Harum iste unde! Autem expedita ea? Velit autem nihil.', CAST(N'1988-05-07 17:03:37.070' AS DateTime), 0)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (15, 14, 1, N'Vero neque placeat. Corporis ut impedit. Adipisci ut id.
Sit qui perspiciatis; sed quod corporis; ipsum ut iste. Enim veritatis consequatur? Incidunt voluptatem perspiciatis! Quia enim vel. Sint sequi doloribus; perspiciatis natus nesciunt. Enim nam non! Odit in sed.
Sed non sit; et voluptas aut. Omnis reiciendis iusto. Rem error aut. Architecto natus delectus.', CAST(N'2011-10-30 04:03:25.870' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (16, 25, 17, N'Illum numquam excepturi consectetur ab vitae totam harum nemo aut.', CAST(N'2005-03-20 01:11:31.180' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (17, 20, 10, N'Error necessitatibus aut illum. Quia ut quasi iusto omnis; natus dignissimos explicabo excepturi et voluptatem at quia. Asperiores officia aut ea. Natus aperiam fuga eveniet. Voluptatem est architecto possimus reprehenderit eum doloremque! Omnis sint sapiente qui numquam eius voluptate magni fugit. Iste rerum quasi ratione inventore iste. In repudiandae consequuntur?', CAST(N'1986-05-05 20:08:27.290' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (18, 36, 2, N'Omnis nesciunt est voluptas ut natus corrupti autem veritatis placeat. Sunt et ratione sunt non quia minus a sit eos? Iure nisi voluptatem quisquam quo, ut quia provident velit voluptatem. Ipsa deserunt quia ab quia et, est voluptas maxime aliquam!', CAST(N'2017-08-08 12:14:09.130' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (19, 16, 18, N'Ipsa a et nostrum nam facere voluptatem saepe. Sed ea odit suscipit facilis deleniti. Eaque beatae doloremque facere perferendis quibusdam. Perspiciatis voluptatem deleniti natus! Aut fugit voluptate minima nemo deleniti aut similique. Perspiciatis sit sed voluptas dolores sit.
Quae cupiditate odio. Iste alias provident ipsum quam eligendi quibusdam aliquid! Omnis quia dolor? Incidunt fugit et.', CAST(N'2011-12-30 17:28:13.200' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (20, 16, 11, N'Unde perspiciatis omnis. Quae odit et. Laudantium unde eveniet! Ex ut illum. Similique dolores cumque? Et sunt consectetur. Fuga dolor sit? Dolorum voluptas aut. Harum a quia. Rerum qui ratione.
Odit expedita eligendi. Est officiis odio! Numquam voluptatem fuga. Iste porro sunt. Placeat eum autem! Rerum et corporis. Excepturi sunt consequatur!
Dignissimos perspiciatis omnis. Ratione placeat;', CAST(N'1998-06-24 17:20:23.000' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (21, 4, 14, N'Ipsa reiciendis cumque. Sed dolor enim. Ipsa aut illum. Ut sunt odit. Quae aperiam ipsum! Ut voluptatem assumenda. Omnis possimus magnam. Numquam aliquid non; laboriosam voluptas modi. Ut officiis distinctio.
Repellat voluptatem eligendi. Debitis iste velit. Est mollitia nobis. Sit numquam molestiae. Assumenda possimus natus; ut et laboriosam. Minima quae voluptatem.
Ipsam qui et.', CAST(N'1985-04-17 01:40:32.050' AS DateTime), 0)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (22, 29, 14, N'Iusto at est harum voluptatem fugit praesentium voluptatem magni. Fugiat rerum sit maiores fugiat ut? Consequatur aperiam accusantium sit dignissimos perferendis numquam. Soluta adipisci excepturi culpa laborum et ut amet omnis. Suscipit vel omnis corrupti architecto adipisci ab dicta? Voluptate quam aut ad. Provident incidunt rerum fugit? Voluptas facere vel porro blanditiis et nemo eligendi!', CAST(N'2008-01-21 20:32:19.700' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (23, 33, 6, N'Similique quo eveniet ipsam pariatur aliquid. Totam veritatis voluptatibus unde necessitatibus ut nobis. Non eius aliquam. Quos accusantium omnis ex iste veniam reiciendis. Eligendi aliquam error molestiae aut aliquam reiciendis voluptate. Vel nemo error aut eaque et laboriosam! Animi obcaecati consequuntur laboriosam qui laborum sit. Soluta pariatur quam.
Consequatur nihil voluptas.', CAST(N'1984-03-22 08:34:58.970' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (24, 10, 18, N'Soluta omnis dolorem neque natus cupiditate explicabo velit; sed unde dicta iusto voluptatem. Ad et laborum expedita, quaerat maiores voluptatibus magnam porro qui.
Odit necessitatibus ex. Et autem nisi. Aut porro cum. Et eius ut! Omnis eaque totam; accusantium id sed. Ullam aspernatur fuga; esse eum et? Et aut et.
', CAST(N'2019-05-10 03:21:40.930' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (25, 30, 6, N'Voluptatem deleniti et. Libero temporibus quo; perspiciatis nam amet. Illo perferendis architecto.
Natus voluptatem ipsa. Eos dolorem unde? Voluptatem atque nostrum. Id tempore doloribus. Ab similique voluptatem? Laudantium animi et...
Obcaecati natus quidem. Dignissimos impedit qui. Facilis officia a! Laborum quia tempora; quibusdam aliquid magni. Rerum et qui. Ullam voluptatem a!', CAST(N'2009-07-26 06:11:10.380' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (26, 38, 18, N'Numquam vero tempore porro sapiente; neque tempore officia dolor rerum culpa. Sint eum dolorem vitae fugit ut perferendis voluptates. Voluptatem nihil temporibus rerum molestiae rerum incidunt non voluptas. Corporis blanditiis sint reprehenderit omnis quasi est. Enim totam sapiente non possimus ullam quo iure similique et; hic cum quia. Aut et aut? Praesentium voluptas distinctio.', CAST(N'1975-04-15 00:31:56.370' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (27, 34, 11, N'Qui molestias neque obcaecati rem sequi. Autem ad temporibus pariatur! Ad quo culpa; et ipsam cumque doloribus esse sequi eos illum nemo. Ut iste officiis soluta. Laboriosam unde molestias iure vitae velit. Autem rem error beatae excepturi voluptatem. Eum alias dolores nobis in eaque quo quia nemo itaque.', CAST(N'1995-10-08 22:51:53.210' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (28, 9, 2, N'Cupiditate voluptatem quidem ut et eum aut vel. Veritatis ut possimus!
Neque culpa qui. Excepturi nobis quae! Illum maiores veritatis? Odit voluptatem debitis; eum et fugiat. Quaerat doloremque ut; maxime sit quia. Iusto nemo voluptatem. Ea beatae delectus. Ipsa aut labore!
Ullam alias totam. Sit quo facilis; qui perspiciatis aut.', CAST(N'1988-05-16 08:45:41.940' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (29, 13, 10, N'Et non magni sed quia hic. Assumenda nostrum quia sit distinctio numquam eligendi nam reprehenderit vero? Laborum nisi molestiae! Eaque sed architecto error aliquam veritatis adipisci dolores pariatur; ut autem veritatis odit. Nihil eligendi aut a et aut. Aperiam nemo ducimus tempore sint esse iure sed. Nulla unde voluptatem. Voluptate sed est.', CAST(N'2019-06-17 12:17:21.750' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (30, 7, 18, N'Est cupiditate dolorum quia dolores facere. Odio repellat deserunt. Enim quas iste. Et asperiores et? Dolorem porro sunt. Sed voluptas ex. Ab quae omnis. Mollitia ut aliquid...
Voluptatem fugiat dignissimos. Ut animi quo! Voluptatum voluptatem sequi. Officia omnis maxime! Provident ullam possimus. Non natus pariatur; nisi accusamus architecto. Corrupti eos doloremque.', CAST(N'1985-07-23 02:14:38.250' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (31, 23, 13, N'Ut nemo consequatur et voluptatibus voluptatem quae dicta voluptate corrupti.', CAST(N'2011-02-05 17:04:36.220' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (32, 30, 14, N'Minus facere et; autem non suscipit quisquam, ut nam nemo odit aliquid nihil.
Ut est voluptatem sunt corrupti tenetur, sit accusamus sed consequuntur. In molestias et maxime quos odio, ut dignissimos optio similique. Impedit accusantium soluta reprehenderit vitae aut culpa ad voluptatem rem.', CAST(N'1984-03-15 13:13:03.060' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (33, 25, 18, N'Iusto et incidunt alias. Nisi eum omnis? Consequatur architecto voluptas ex qui; laudantium placeat sed dolor explicabo; rem delectus assumenda eos exercitationem; sapiente unde incidunt? Eum sed vel enim quod cum consequuntur dignissimos. Unde ea neque sit sed ut distinctio. Minima est recusandae quo rerum.
Quia atque id. Deserunt rem iste!', CAST(N'2002-11-05 09:33:38.650' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (34, 46, 12, N'Corporis molestiae perspiciatis ex ea et quisquam magnam blanditiis tempora. Delectus culpa ut consequuntur! Aliquid debitis voluptates omnis, natus laudantium distinctio fuga rerum rem. Aspernatur non omnis iste minima amet et atque. Libero non itaque ut. Eveniet et doloremque. Officia hic ducimus. Numquam voluptate ratione. Accusamus rerum aperiam. Nemo voluptatem rerum.', CAST(N'1970-04-18 01:24:15.310' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (35, 41, 9, N'Nesciunt ut aut. Repellat doloremque voluptas! Ut magnam non. Sed velit provident!
Saepe quas velit. Voluptatibus labore illum. Est tenetur porro! Incidunt officia in.
Qui iste unde. Voluptatem et quasi! Voluptatem est minus? Rerum aperiam aut. Debitis minima modi. Laboriosam voluptatem delectus. Error aut odio. Magnam maxime corrupti. Id consequuntur velit.', CAST(N'2010-01-05 02:26:47.680' AS DateTime), 0)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (36, 40, 15, N'Saepe sit quis molestias dolorem. Fugit voluptas perferendis quidem ut!
Ipsa perspiciatis harum, impedit rem sunt et incidunt earum exercitationem. Impedit et eos quia nihil nobis eum vitae exercitationem? Omnis quae iste numquam! Doloribus quia nisi. Esse quia dolores. Ut minima placeat? Doloremque est voluptas! Unde vel rerum. Nihil vel velit...', CAST(N'2006-12-24 03:21:21.740' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (37, 15, 14, N'Dolor omnis doloremque perspiciatis et, ut aperiam ut eius debitis; voluptatem enim voluptas, saepe est eos voluptatem voluptate aut natus. Eos corporis facere illo, a quibusdam iste ut quasi numquam.', CAST(N'2013-04-14 17:25:31.720' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (38, 22, 2, N'Sit quae atque amet et labore rerum voluptate error necessitatibus. Voluptatem perspiciatis ut, tenetur cum deserunt ut repudiandae sunt odit; deserunt dolorem saepe unde autem, cumque veritatis perferendis consequatur repellendus. Dolor accusamus amet alias voluptas commodi praesentium quia dolore ab.', CAST(N'2017-09-06 22:04:30.430' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (39, 4, 9, N'Et nobis fugit labore optio quia consequatur laudantium omnis laudantium. Laborum voluptatibus qui repellendus earum. Ad inventore autem! Deserunt fugit iste sed. Ut eveniet repellendus nam ratione. Similique odio est rem qui et maiores. Cupiditate maiores tempore aut ut rerum porro cum fugit! Dolores id dignissimos; odio iure laboriosam. Mollitia et nulla.
Dolorum cum eum.', CAST(N'2016-09-01 06:48:13.140' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (40, 3, 6, N'Vel a odio labore iusto. Non ea aut sequi velit dolore delectus dolor aut et. Tempore labore error! Error quod aut.
Voluptatem sunt repellendus. Aut eum facilis. Dolore dicta numquam. Sed et eos. Odit est provident. Natus et aut!
Ea et fugit. Quibusdam corporis et; aperiam doloremque ad. Tempore error sint. Totam error eaque.', CAST(N'2009-04-22 13:28:44.340' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (41, 23, 2, N'Fuga esse et ipsam ex ut. Reiciendis delectus dolore omnis natus expedita. Eligendi ratione quo unde voluptas at error; dolores repellat libero id soluta et cupiditate non itaque. Aliquam deleniti unde itaque? Error quis modi et atque suscipit velit quibusdam sed distinctio; velit aperiam vel. Et commodi sit. Ab tenetur veniam? Corrupti quia tempore.', CAST(N'2001-01-21 22:52:13.020' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (42, 29, 10, N'Iusto ut qui reprehenderit porro doloremque est eligendi reiciendis laudantium. Quaerat ut pariatur, iure vel quasi eum illo quaerat iure.', CAST(N'1981-05-09 04:31:27.080' AS DateTime), 0)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (43, 32, 4, N'Exercitationem iste praesentium veritatis aliquid quia. Odit inventore maxime culpa odit quia incidunt.
Voluptatem ipsum omnis voluptas iure quam. Ipsa ea, ipsum nisi incidunt eveniet recusandae quis ipsa voluptatem. Non libero sed? Et ullam non! Atque sed ipsum.
Iste aliquid qui. Eaque et ut! Ut molestiae quo. Ab id necessitatibus;', CAST(N'1983-12-22 19:33:21.340' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (44, 22, 11, N'Libero et eius. Numquam reprehenderit natus! Quia maiores illum. Quae enim delectus. Voluptatem at laudantium. Expedita et aspernatur...
Ratione sit et. Et velit mollitia. Sed eius et.
Voluptate reiciendis ducimus. Aut rerum ut. Voluptas ut error. Dignissimos aliquam nesciunt! Magnam aut veritatis. Itaque voluptas dolorum; consequatur est dolorem. Minus est rerum. Temporibus esse veniam. Saepe.', CAST(N'2011-12-25 07:13:44.660' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (45, 9, 17, N'Architecto expedita unde. Aut qui rerum. Blanditiis ut omnis. Laborum dolor et. Et laboriosam neque. Laudantium aspernatur doloribus. Sed tempora libero? Delectus necessitatibus qui.
Quia reprehenderit architecto. Eum dolorum ullam. Odit ipsam repudiandae! Aut accusantium consequuntur. Autem velit dicta. Perspiciatis dolores sit. Voluptas non unde. Delectus architecto veniam.
Officiis cumque.', CAST(N'2013-09-15 23:39:56.110' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (46, 34, 2, N'Ipsam architecto incidunt consequatur neque. Itaque aut excepturi omnis; quas eum ad quam neque. Aspernatur autem repellendus iste quod, est sit recusandae qui dolores. Laudantium quia magni et fugiat dolorem est perferendis tempore explicabo. Aliquam necessitatibus obcaecati cupiditate velit non quo nesciunt perspiciatis molestias.', CAST(N'1988-12-12 08:23:13.620' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (47, 32, 5, N'Accusantium voluptas veniam. Numquam ea vero. Consectetur et tempore? Tempora a qui. Sit asperiores esse. Eligendi illo facilis. Et sit tenetur; magnam soluta ut. Alias quod inventore. Quis fugit autem.
Consequatur voluptatem a.
Repellendus ut dolores; corporis inventore aut. Labore est nobis. Dolorem sapiente qui. Et accusantium dolorum? Sint consequatur ut! Omnis eveniet tempora? Quia!', CAST(N'2011-08-31 02:15:11.910' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (48, 6, 16, N'Debitis accusantium eos. At laboriosam iste. Sed dicta ut. Odit ut cum. Omnis amet et. Perspiciatis dolore eum! Numquam qui eaque. Reprehenderit cum aliquid? Sunt ullam delectus. Et totam asperiores.
Aperiam beatae est. Dolorem distinctio unde. Quasi quas tempora. Nihil minus recusandae. Officiis optio eligendi! Et qui ullam; sunt dolore maxime.', CAST(N'1990-12-16 20:50:55.060' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (49, 22, 16, N'Ullam rerum qui. Sint sit consequuntur; qui alias ipsam. Aliquam nostrum illo. Illum a dolor! Aut quibusdam atque; rerum voluptatem veniam; sit dolorum facilis.
Quidem reiciendis cum. Et assumenda est. In consectetur unde. Exercitationem voluptatibus ducimus. Odio minima tenetur. Rerum voluptatum minus? Ea beatae sed. Qui sed harum? Sit enim qui...
Ut quasi non. Distinctio quam minima.', CAST(N'2002-11-07 07:02:45.030' AS DateTime), 1)
INSERT [dbo].[Comentario] ([IdComentario], [IdPublicacion], [IdUsuario], [Descripcion], [Fecha], [Activo]) VALUES (50, 29, 19, N'Ullam nihil animi deserunt et voluptas iure sunt dolor debitis; voluptatem nulla quo consequatur minima nisi explicabo. In maxime quia autem omnis! Iusto voluptatem natus qui dolor est hic delectus; a quia ratione culpa? Ut aliquam ea tenetur natus! Sed quos enim molestiae eveniet qui voluptatibus totam, ex architecto.', CAST(N'1977-08-13 14:35:43.910' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Publicacion] ON 

INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (1, 14, CAST(N'1970-03-13 06:19:47.220' AS DateTime), N'Beatae doloremque error maxime dicta placeat numquam voluptatem sed laborum. Assumenda ratione et sed facilis quis omnis ut ab consectetur. Eum nihil odio et earum eius dolore nesciunt incidunt aut! Nostrum beatae amet mollitia rerum, nemo sit nisi deleniti hic. Deleniti repellat, eos dolores eveniet ea quis velit qui quaerat! Aut temporibus excepturi quas sunt consequuntur animi cupiditate harum quia.', N'https://lemi.hinto.hu/ithhait/to/hinallare/buter.png')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (2, 20, CAST(N'2008-04-20 14:14:01.540' AS DateTime), N'Molestias neque ut suscipit ad magnam officia explicabo sed assumenda. Architecto consequuntur sed, inventore adipisci quisquam qui eaque culpa eos? Placeat dolorem velit esse voluptatibus harum asperiores dolor omnis sed. Dolore voluptatem ut reprehenderit quia voluptatem asperiores quo modi praesentium! Quia doloribus sequi corrupti, iste voluptatem consectetur ipsum ipsa nihil. Voluptatem rerum et dignissimos perspiciatis eligendi, nemo totam dolore est; consequatur voluptas, et sed sit eveniet sed quibusdam voluptatem incidunt. Iste eaque ab quam vel similique placeat enim repellat dolore? Laudantium voluptatem, saepe sit quia ratione porro aut nihil veniam.', N'http://asse.nl/tedveour/hatnd.gif')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (3, 1, CAST(N'1980-01-18 16:31:37.940' AS DateTime), N'Qui fugit nostrum tempore sed iste. Nobis maxime fugit.
Distinctio molestiae ullam odio eum qui voluptatem et; eos id iste nam quo quod perspiciatis velit id. Ab saepe et non tempore sapiente. Ad eligendi, neque id et cupiditate modi aspernatur et voluptatem. Sit molestiae eos nesciunt mollitia quidem pariatur asperiores sit sint. Natus cumque, in provident sed sapiente totam vitae aperiam qui. Nostrum deleniti qui quo itaque voluptas est at quisquam error! Totam iure ipsam velit vel qui fuga perspiciatis voluptatem reprehenderit. Qui est nam quia dicta velit aut, tenetur molestiae commodi.', N'http://vehistito.com/ereentfor/er/esnt/reevebutha.bmp')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (4, 18, CAST(N'2019-11-11 13:43:40.080' AS DateTime), N'Id quibusdam quas consequatur sint dolores. Non et ut nulla numquam dicta nulla et voluptas delectus! Minima qui voluptatem repellat dolorum eveniet placeat. Et dolores adipisci id sunt sed! Accusantium hic fugiat. Iste consequatur aut ut.
Aut eos quis est voluptate aut. Numquam fugiat saepe. Ad rerum aut fugit dolore perspiciatis. Ut earum voluptatem sit voluptatem reiciendis assumenda. Excepturi maiores magni vitae perferendis sed aliquid odio sed. Necessitatibus totam, alias veniam quia placeat enim est necessitatibus quibusdam! Excepturi aut doloremque similique rerum sapiente aspernatur est ex vel. Adipisci perspiciatis pariatur ducimus impedit ea similique officia. Quae fugiat esse. Ut reprehenderit sapiente.', N'http://geboki.andwatotha.br/ntat/hinionwas/teto.png')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (5, 14, CAST(N'1993-11-05 13:43:18.360' AS DateTime), N'Non nihil tempore officia quam architecto sed nisi. Consequatur dolore error natus facilis! Alias asperiores sequi quis molestias omnis qui error tempora. Omnis totam non quo illo quisquam? Nihil quaerat placeat magni. Assumenda voluptas omnis sed earum suscipit.
Aut est nemo. Et sit sapiente modi! Quia vel veritatis quaerat iste cumque numquam? Sit natus laborum quaerat error quia officia illum non voluptatem. Ut sit sed quis. Non eligendi officia ad ex natus excepturi porro. In id sed quibusdam sed voluptatum aut ut et eaque. Quia eveniet molestiae ut vero facilis. Totam commodi error delectus deserunt iste nobis cumque! Aperiam sapiente deleniti.', N'http://hoqiji.tedion.dk/ulduldyou/arorhatan.bmp')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (6, 14, CAST(N'2019-12-08 08:08:45.620' AS DateTime), N'Nesciunt itaque quia maiores perferendis. Perferendis dolorem est autem est consequatur numquam! Officiis sed dolor sequi omnis error sunt. Totam voluptas ex ducimus aliquid! Ut molestiae sunt aperiam dicta vero officia. Laboriosam rerum deserunt eum, perspiciatis ut voluptas perspiciatis sed nostrum! Id quos tempore aliquam rem nam ut dolore neque quibusdam.
Sed fuga quaerat consequuntur molestias nemo ut ipsum nostrum dolorem. At voluptatem laboriosam tempore sequi qui cupiditate aut enim est. Deleniti optio assumenda ut eum aspernatur ex consequuntur, et perspiciatis. Ea enim veritatis in cupiditate libero id minima harum odit.', N'https://meyou.ua/itntin/ter/enatesyou.gif')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (7, 3, CAST(N'2002-10-23 02:56:52.320' AS DateTime), N'Sint non nobis possimus omnis minima reprehenderit iste omnis nam. Aut vel maxime animi impedit voluptatem velit nihil error consequatur. Ipsum ullam sed eum omnis ratione error unde dolore aut. A unde reprehenderit eum voluptatem nobis sunt dolor beatae quod. Quia numquam ipsa saepe vel natus ducimus magnam quis voluptatum.', N'https://wititarewa.org/shoionnd/attioyouea.jpg')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (8, 9, CAST(N'1982-10-31 19:13:25.020' AS DateTime), N'Fugiat voluptate in aliquid sint doloribus id eveniet quam tempora. A expedita repudiandae sit quo. Sunt sequi ex fugit eaque consectetur eaque blanditiis; repudiandae ut totam enim tempore voluptate assumenda eius qui perspiciatis. Et dicta odit nobis et quaerat officiis et voluptatem et. Omnis praesentium culpa ipsam accusamus, perferendis quos quasi quae qui! Sunt maxime iste unde laudantium qui nihil cupiditate officiis asperiores. Perspiciatis sed cupiditate sunt obcaecati vel voluptates quas sit mollitia. Omnis rerum mollitia error beatae a necessitatibus minus consequatur et; est cumque dolor ea doloremque sed nesciunt et, voluptas eius.', N'https://noqu.ntheneretio.at/sho/to/arshoouse.bmp')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (9, 12, CAST(N'1984-01-02 21:08:43.090' AS DateTime), N'In dignissimos totam et earum aut dolore natus non labore. Voluptas consequatur maxime incidunt quas atque non est temporibus repudiandae. Non rerum, omnis ipsa autem voluptas illum quos harum ut. Sit ad, consectetur quam nobis enim voluptas sit delectus voluptatem. Possimus temporibus praesentium ut consequatur dolorem velit ipsam quibusdam harum. Error eos doloremque nobis delectus assumenda repellendus dolorum ipsum cum!
Dolor sapiente, laudantium quam autem error eos explicabo saepe cum. Aliquid voluptatem, voluptates error nobis iure debitis similique possimus qui. Quos quo nesciunt quo cumque in nisi corrupti tenetur sed.', N'https://arever.dk/he/ithshove/mealat/thforhenen.jpg')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (10, 20, CAST(N'2014-10-20 02:06:06.650' AS DateTime), N'Quis ipsam omnis excepturi, omnis et cupiditate aperiam minima qui. Quas pariatur tempora et suscipit atque vero et non consequatur. Assumenda ut harum hic aut nemo ut neque aut omnis. Autem magnam qui eum perferendis nihil quas maxime vero dolorem. Vel voluptas alias sed nesciunt dolor repellendus soluta id quas.', N'http://li.erewasstare.it/ome/te/butisith/ithand.jpg')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (11, 8, CAST(N'2004-03-10 00:19:42.870' AS DateTime), N'Recusandae dolorem impedit libero et a aspernatur nihil eum perferendis. Iste et tempore ut culpa, sit vero eaque tempora totam. Est eaque voluptas ex eos et perspiciatis laborum porro tenetur! Distinctio veritatis explicabo voluptatem aperiam deleniti quam non autem et. Consequatur eos maiores sunt quos explicabo sed quia sint voluptate!
Et earum qui ratione dolor sed qui error ut officia. Dolor sit qui dolor deserunt sed beatae necessitatibus magni velit. Praesentium quis quia expedita, natus possimus et dolorum nesciunt nisi! Consequatur voluptatem est, voluptas aut et aut impedit omnis natus.', N'https://bovota.stforver.hk/anit/al/oul/enndonion.png')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (12, 4, CAST(N'2003-11-12 15:11:57.960' AS DateTime), N'Excepturi perspiciatis in sed suscipit aut architecto dolorem quis quisquam.
Libero quasi quia quos vitae et autem, necessitatibus aut ipsum; ut et id, at est aperiam magnam itaque quia dolorem. Ut qui, facere amet ut vel error est iste odit.', N'https://tiitalal.fi/eauldion/ingwaserera.png')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (13, 1, CAST(N'2018-10-28 10:20:35.060' AS DateTime), N'Hic velit eligendi provident. Omnis inventore quisquam aliquam odio; nemo tempore quae; atque labore ex porro odit veritatis ipsum minus voluptates aperiam. Molestias eos quod vitae qui odio rerum voluptatem, excepturi nisi. Ut nemo culpa, eveniet nulla ea ut distinctio qui enim? Voluptatibus inventore, aperiam enim distinctio et unde perspiciatis et amet. Neque consequatur nam accusantium sunt corrupti magni iste qui esse. Fugit voluptates perspiciatis modi et ut saepe iusto doloremque soluta. Quis quos perspiciatis quia ut quia, aut excepturi odit nam.
Totam commodi qui quae omnis perspiciatis nostrum ipsam totam dicta.', N'http://entan.de/ortedtha/ionoulour/wit/orsho.png')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (14, 17, CAST(N'1986-04-20 08:19:55.820' AS DateTime), N'Alias reiciendis quis autem. Distinctio error voluptatum sit quia, laboriosam dicta voluptatum omnis aspernatur. Sit et reiciendis veniam excepturi quos non provident autem natus. Sunt perspiciatis optio dolores, modi illum non quia quo aut! Aut perspiciatis ut et cupiditate sint odit rerum vel. Id omnis consectetur quia voluptatum quia non est...
Tempora dolor ut. Natus omnis rem ut nulla ex quo consequatur ut! Culpa provident non quis quaerat quibusdam unde; et consectetur eos qui quis ut iste rerum unde. Minima voluptates in.
Neque officia deleniti. Aliquam aut quisquam; odio et porro; rem aut unde. Est accusamus numquam. Ut et est.', NULL)
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (15, 19, CAST(N'2009-10-11 13:12:55.020' AS DateTime), N'Aut laboriosam provident consequatur aliquid aut in omnis nisi doloremque. Beatae dignissimos et voluptas quia repellendus. Cum deserunt nostrum vero adipisci et nihil aut. Rerum exercitationem omnis officiis corporis minus minima inventore ut tempore. Quibusdam id sed architecto repudiandae qui commodi dolorum sed quas! Quia atque recusandae maiores et in. Velit aut aperiam optio quo! Consequatur quia impedit incidunt expedita. Autem voluptatibus nesciunt qui; autem porro mollitia recusandae.
Voluptatem ut non in nihil laboriosam et accusantium fugit. Possimus provident sunt doloribus! Ut et sapiente.
Consequatur velit quos quis neque. Possimus asperiores consequatur voluptatem libero nihil quaerat et error sed. Soluta at numquam.', N'http://ndarhever.nz/eaand/wasourmeera.png')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (16, 13, CAST(N'1999-11-06 14:21:19.940' AS DateTime), N'Quod magni et sed magni velit quam ipsum dolor.
Quo qui ex quo sunt.
Velit necessitatibus voluptas laudantium. Rerum ut odit, dicta aut ad quaerat libero quasi modi. Molestiae voluptatem delectus cumque ut alias ipsa non est harum. Similique sit ut consectetur dolorum aliquid ex eius hic et; incidunt doloribus ipsam, quo velit sit totam adipisci fugiat labore. Animi neque mollitia error natus et veniam ut eaque qui. Autem ipsam, pariatur libero velit corporis sed dolores ut sit. Amet beatae omnis molestiae quae deleniti, rerum minus sit ratione...', N'https://bejifu.eaterthe.fr/ntteron/allwas/uldatnt/youitentwit.gif')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (17, 6, CAST(N'1992-07-24 22:47:15.900' AS DateTime), N'Culpa cumque quae quia in optio, expedita quis laboriosam quis. Cum impedit ut voluptatem at voluptates sequi sed suscipit sed. Ullam ut sapiente vitae eos unde iusto error provident voluptatem. Perspiciatis qui deserunt corporis amet voluptates facilis voluptatum sed ratione.', N'https://yououlforle.org/ereatare/ereteden/youashis.png')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (18, 8, CAST(N'1978-10-29 19:25:11.220' AS DateTime), N'Similique facere sit; sit sequi reprehenderit nam. Ratione dolores asperiores esse ad est voluptatibus sed aut. Suscipit molestiae dolore adipisci minima et facere aut! Sit iste nihil ut iste ut veniam aut in natus. Quisquam ut, unde iusto aut libero consequuntur et rerum non! Provident tempore aperiam iste. Temporibus est illum ut. Quisquam voluptatem eligendi eos ad soluta. Numquam totam repudiandae.
Hic odit ullam qui modi molestiae ducimus. Fugit perferendis voluptatum iste ea recusandae ex. Ducimus reprehenderit et? Impedit et molestiae soluta sit illo perspiciatis iure non. Quia cumque eos! Dolores reprehenderit et. Maiores amet sit. Ratione iste magni. Natus aliquid facilis. Sit qui laborum.', N'https://eraanander.ua/neat/tertiothst.jpg')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (19, 3, CAST(N'2008-07-05 14:46:54.700' AS DateTime), N'Unde ratione doloremque amet et velit corrupti; commodi dolor dolorem quae. Inventore suscipit accusantium amet nisi natus laudantium minima molestias. Consequuntur nostrum dolores omnis. Repellat unde et voluptates laborum dolore et ut adipisci voluptatem. Architecto non tempora tenetur, eaque cumque dolorem at error incidunt.
Ut perspiciatis qui tempore possimus alias qui. Voluptatem quo reiciendis dolor numquam sit qui eos.
Sequi autem magni odit porro id corrupti fugit sed voluptas. Beatae ipsa voluptatem perspiciatis sint. Et delectus minus velit labore voluptatibus qui magnam? Nihil harum sed nostrum. Voluptas sint magni sit rem. Officiis optio quo! Magni et ut.', N'http://stenreou.it/ndasver/itshoea.png')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (20, 13, CAST(N'1998-08-19 15:03:51.050' AS DateTime), N'Facere vitae tempora sint ipsa veritatis maiores exercitationem ipsum est. Sunt tempore labore voluptas nulla est labore voluptatem voluptas repudiandae! Unde magni consequuntur eligendi, perferendis nisi recusandae nulla perspiciatis et. Consequatur a sed et minus libero, sed laudantium aut error! Quae eius quasi expedita ut explicabo vitae magni ipsam nisi.', N'http://areha.es/butnotuld/evetedbut/thth/ntan.gif')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (21, 8, CAST(N'1990-03-19 03:39:42.460' AS DateTime), N'Est iste eaque dicta voluptatem amet. Et tempora ut laborum. Culpa velit nesciunt unde! Accusamus perspiciatis reprehenderit culpa enim non nihil laborum. Unde quia labore reiciendis excepturi sed animi! Earum culpa cupiditate nulla voluptatibus.
Voluptatem sint illum corporis dolorem nisi. Iusto magni delectus incidunt voluptatem sit iste. Eum sint pariatur quia molestias voluptas dolorem unde. Enim explicabo perspiciatis. Modi molestiae totam dignissimos atque ut minus. Consequatur eius nisi quia aliquam qui! Aliquid sed incidunt molestiae animi nostrum. Unde est perspiciatis ut optio sed! Expedita officiis eum.
Omnis et porro. Et minima quae! Voluptatem vitae tempora. Tenetur adipisci in; iste ea neque.', N'https://evewahisto.eg/neat/edithtoeve.gif')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (22, 2, CAST(N'1983-09-18 20:37:42.370' AS DateTime), N'Voluptas ut nemo perspiciatis iste alias blanditiis in aperiam. Quae corporis error facere architecto libero sit ut natus expedita! Et laborum eum perspiciatis id ullam aut voluptate non? Perspiciatis neque dolores est necessitatibus voluptatibus magni. Sunt id unde rerum. Autem et minima quaerat ipsa ullam natus quae voluptatem. Odio atque sed alias! Enim illo quaerat. Nemo error sint aut ad est molestiae sit amet voluptatibus.
Ea molestiae sed quis minima id quae omnis repellat sed. Sunt atque quasi fugiat aperiam quos omnis similique id ipsum...
Earum iure placeat eius excepturi quia voluptate nemo est facere.', N'http://ionour.com/ithas/arterhatng.jpg')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (23, 16, CAST(N'1985-05-24 15:23:39.530' AS DateTime), N'Nihil ut et suscipit. Recusandae dolore laborum officia voluptatem; error ad et. Consequatur aut sed, sequi rerum laborum nam magni sed est. Quia voluptatem necessitatibus minima; quia quod in aut velit ut. Optio hic perspiciatis quam nesciunt ea nostrum unde! Totam ipsa ea. Reiciendis ducimus exercitationem magnam eos id voluptas.
Maxime blanditiis unde odio totam iste. Atque sit laudantium unde eaque! Magnam quam suscipit; ea et quo. Quibusdam omnis necessitatibus aperiam et ut eligendi enim! Dignissimos omnis deleniti et non autem. Magni odit voluptatum minima. Voluptates a sequi sed autem recusandae veritatis enim ut unde...', N'https://tedtedheed.ge/herth/nd/ereisis/stseedit.bmp')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (24, 17, CAST(N'1973-06-16 00:35:37.890' AS DateTime), N'Pariatur libero sed eum velit harum saepe, nihil consectetur obcaecati.', N'http://seyupa.aswasvereve.ca/eayouwas/for/uld/thiretioal.jpg')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (25, 13, CAST(N'1991-12-15 18:27:36.000' AS DateTime), N'Non aperiam fuga aut perferendis. Sapiente nemo facilis doloremque eligendi exercitationem iste voluptas!
Rerum corporis aliquid nulla unde sit. Ipsam fuga consequatur nam accusamus? Accusamus error minima laudantium. Nihil unde enim doloremque beatae. Qui ad id aut nam asperiores accusantium magni consequatur quod! Provident sed numquam quia temporibus cum. Odio repellendus dolorem voluptatem molestiae cumque blanditiis molestiae. Consequatur optio sit beatae non aperiam quas ut corrupti.
Nemo facilis accusamus eligendi in qui aperiam sed. Sunt voluptatibus natus sed maxime perspiciatis? Et sunt quo; velit error animi voluptate cupiditate corrupti. Corrupti sunt doloribus et error repellat cupiditate. Omnis sequi dolorem? Culpa dolores rem.', N'https://katate.onnd.kr/eveedwa/thato.jpg')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (26, 16, CAST(N'1973-01-09 11:34:05.660' AS DateTime), N'Nihil velit provident accusamus in eos animi ipsa illo consequatur. Est possimus atque corporis qui nostrum voluptatem libero earum laborum.', N'https://pahoga.atthnest.ch/esthiera/nt/thiioned/tedvethaan.jpg')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (27, 11, CAST(N'1974-08-07 00:28:12.320' AS DateTime), N'Temporibus sunt rerum iste quas placeat. Molestiae et molestiae aliquid voluptate aut. Tempore sed numquam sint vel iste consequatur et voluptatem qui. Quod voluptas sed voluptas iste ipsa doloremque totam quo recusandae; minus molestias iure placeat sed error rerum omnis laborum voluptas. Culpa ut totam, veniam officiis doloremque explicabo obcaecati ipsa modi; est et quas atque expedita error, non sit quasi repellendus.
Facere rem provident numquam sunt voluptatem ratione qui ducimus omnis. Voluptatibus molestiae, unde incidunt exercitationem voluptatem fugiat excepturi officiis et.
Ab et aliquid omnis qui modi nihil nisi eos neque.', N'https://heqi.ourometefor.ca/ntthise/tiostesat.png')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (28, 7, CAST(N'2004-05-31 00:46:02.180' AS DateTime), N'Autem et qui aliquid omnis fugit quae aperiam. Numquam dolorem quis quia rerum natus. Minus qui dicta repudiandae perspiciatis ut voluptatem est omnis! Optio quia fuga; non praesentium et earum necessitatibus nulla laudantium. Deleniti illo iste et nesciunt numquam excepturi natus praesentium; aut sint et hic veritatis unde laudantium. Quo repellat possimus; quibusdam cum quia quo voluptatum.
Velit incidunt corporis qui vitae neque quisquam exercitationem adipisci. Eius aut cupiditate; velit eos sed. Et magni nobis. Perferendis nemo aliquid. Doloremque quis unde. Enim nemo qui; dolor reiciendis iste. Et distinctio corrupti; ab qui voluptatibus.
Inventore voluptatem vero. Officiis possimus eum; dolores iste dolor.', N'https://hi.forat.no/an/ereallwit/oulinte/wition.gif')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (29, 17, CAST(N'1997-01-18 20:30:59.070' AS DateTime), N'Praesentium commodi exercitationem minus mollitia quisquam soluta maxime nihil explicabo. Cum earum explicabo rerum sit vero. Laboriosam omnis ut cumque ut doloremque laboriosam! Odit culpa et perferendis voluptas odit sint et quia. Modi voluptas nisi ut. Voluptatem nam eum dolores in beatae similique corrupti. Ut sapiente nesciunt inventore totam natus? Adipisci non error unde omnis rerum nesciunt neque, reiciendis odit.
Vero accusamus dicta ducimus ipsum eum; tempora numquam fuga labore unde; natus non qui sed qui quae nesciunt. Iste modi qui fuga sapiente optio voluptas omnis cumque voluptas. Non a doloremque nam exercitationem sit provident omnis voluptatem ut.', N'https://jaqini.erase.se/eraes/ou/senehat.gif')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (30, 2, CAST(N'1978-01-09 03:57:19.740' AS DateTime), N'Nesciunt maiores mollitia unde ipsum repellat sed vel ipsum. Maiores corrupti ipsum similique voluptatem quod suscipit.
Officiis sit qui sed ut voluptatem. Consectetur dolorum voluptatum. Autem culpa maxime officia quia omnis ab aperiam perspiciatis sed; voluptates ut dolorem aspernatur. Est eligendi nulla velit a exercitationem esse; cum ullam pariatur et ut minima et nesciunt. Reiciendis numquam repudiandae ut fugiat perspiciatis, eius voluptatibus ipsum dolorum. Consequatur doloremque ipsam error animi sed dicta nostrum vel veniam. Qui accusantium sequi sit ut voluptatibus eum repellendus quidem accusamus. Porro possimus amet voluptatem esse incidunt distinctio quis iure eos.', N'https://shobutitst.at/alourne/andineve/veritthient.bmp')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (31, 15, CAST(N'2017-09-22 00:48:38.830' AS DateTime), N'Officiis voluptates provident quia corporis harum ut rerum quis natus. Aut qui natus et voluptas aliquid est consequatur est ea.', N'http://ye.tionthenhad.tw/hererauld/teesne/ver/erfor.bmp')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (32, 10, CAST(N'1997-04-14 10:08:16.630' AS DateTime), N'Quo sequi sed sequi. Consectetur soluta voluptatem? Nihil delectus a aliquid. Sapiente ut necessitatibus eum. Molestiae debitis porro totam voluptatem obcaecati non dolorem. Necessitatibus unde alias ut perferendis et. Voluptatibus velit mollitia! Est assumenda maxime in voluptatem enim dolores. Sint iure natus iste ipsum iste fuga officia.
Voluptas et pariatur eum facilis temporibus adipisci quis. Dolor neque inventore. Sit voluptatem cum. Suscipit reprehenderit velit? Voluptatem dolores quia. Error fugiat quidem. Aut eos quas. Distinctio quidem reiciendis; eaque quidem autem...
Vel nam reiciendis. Est qui sit? Enim est voluptatum. Ut inventore omnis. Sit amet deserunt; ex doloremque sunt. Exercitationem eius provident.', N'https://dakuzu.asteease.com/asleour/uld/alerehatti.bmp')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (33, 3, CAST(N'1995-08-07 15:05:40.330' AS DateTime), N'Voluptas error dolores inventore vero error reiciendis sed repellendus rerum. Sed quos tempora alias voluptatibus molestiae voluptatem nemo neque sunt.', N'http://sawejo.anennotor.fi/verhering/nearion/anuldent/witwitnot.jpg')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (34, 5, CAST(N'1980-06-21 09:00:07.070' AS DateTime), N'Ullam aut iste natus quia. Molestiae consequatur iusto dignissimos laboriosam quae laudantium aut. Eum quisquam eum rerum voluptatem exercitationem quasi natus odit! Neque debitis quia repellendus. Ut perferendis et in. Inventore cupiditate sit dolorem ut debitis facilis sit autem et; sequi a odio. Perspiciatis ullam aperiam fuga qui? Nisi eos sunt ut et quia aut consectetur.
Sint qui non temporibus architecto amet soluta minima. Ut perspiciatis quisquam. Rerum unde nihil rem perspiciatis impedit ea ullam voluptatem quaerat. Et aut perspiciatis. Rerum et omnis. Eligendi doloremque vitae...
Sit quis aliquid. Rem vel velit? Aut ut omnis. Consequuntur accusantium deleniti; qui corporis nisi. Dolorum accusamus unde. Distinctio omnis ea.', NULL)
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (35, 14, CAST(N'1989-07-01 16:12:09.810' AS DateTime), N'Qui perferendis iste eligendi et qui illo omnis. Autem asperiores illo.
Voluptatum qui quod quasi. Nesciunt qui perspiciatis at perspiciatis asperiores eaque quis nihil! Aliquid unde obcaecati cum. Fugiat magni sunt eligendi sint repellat velit veritatis fugit aspernatur. A ipsa pariatur qui voluptatem eos aut rem consequuntur unde. Voluptatem rerum sit non illum praesentium necessitatibus, sed saepe id! Deserunt error atque doloribus fugiat omnis vel at non rem. Labore quod ut velit laudantium necessitatibus dolorum maxime fuga quos! Voluptas nisi quo molestiae eaque, sed qui repudiandae velit quasi.', N'https://youeangour.us/anseand/esalledhad.jpg')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (36, 16, CAST(N'1991-04-05 08:44:43.370' AS DateTime), N'Et quas maiores perspiciatis pariatur animi error. Unde perspiciatis odit sint. In qui nisi praesentium, autem quia iusto ipsam aut ut. Et qui eos dolores voluptatem nisi necessitatibus iste. Reprehenderit molestiae blanditiis? Possimus id eligendi voluptate veniam aperiam similique et iste. Ex error ab doloremque officiis est. Dolorum eum quae itaque obcaecati voluptas laudantium quo.
Necessitatibus sint alias qui magni ipsum asperiores vel doloremque. Dolor iste officia sunt dolores rerum quibusdam eveniet sint ut...
Accusantium earum quam. Totam ut ipsa unde modi blanditiis veniam quisquam assumenda quod! Et nihil voluptas vel qui et ut pariatur voluptas error.', N'https://wasbutthior.ge/hierto/oulhadomeera.gif')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (37, 9, CAST(N'1989-04-16 06:24:49.300' AS DateTime), N'Vero reiciendis eaque perspiciatis nihil, ex eum est tempora et; nam est ratione ut rerum illo voluptas placeat ut labore; dolor omnis, repellendus magnam explicabo et qui cum modi voluptatem.
Sit aliquid et rerum, suscipit numquam corrupti architecto et eos.', N'https://qutaka.notoulalthe.at/arisand/hentth/st/hisst.jpg')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (38, 19, CAST(N'2009-01-16 08:11:12.130' AS DateTime), N'Inventore error dolorum molestias necessitatibus eum quia omnis est sed. Aut voluptate sed consequatur illo in minima voluptatem sit aut! Eum eius eos natus vel autem modi reiciendis quia alias? Iste qui ut voluptatem qui officia rerum animi nisi id. Ut perspiciatis possimus sit libero sit cum obcaecati quasi quae. Et consequatur est ipsam exercitationem, qui veniam quibusdam est quis. Excepturi animi iste, eveniet consequatur ducimus maiores atque quo quae!', N'http://bi.arinsetha.dk/wamese/hatngwa/ti/notis.png')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (39, 8, CAST(N'1994-04-01 19:24:34.780' AS DateTime), N'Nesciunt ipsam quam non eos perspiciatis sed quia. Earum quia tempore consequatur exercitationem rem quibusdam rem sed. Laborum et fugiat sint aut est et accusamus velit. Dolorem alias debitis quo vero nemo. Vel aut ut dolores et quia voluptatem quisquam ullam.
Adipisci enim aut ea. Ex vitae nemo explicabo. Nesciunt et blanditiis quos unde? Modi veniam nostrum perspiciatis. Iure eius ea tempore aliquid. Sed perspiciatis ut; et maiores ipsa. Ut similique ea; dolorem quis ad.
Aut ut exercitationem. Voluptatem dolores non. Est quia voluptatem! Rem unde iusto. Quos fugiat sint. Aut sit quia. Inventore quisquam dolor. Quas molestias inventore? Fugiat nihil cumque.', N'https://thealedand.org/notthaon/sho/hinherandher.gif')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (40, 6, CAST(N'2006-03-04 04:10:22.020' AS DateTime), N'Eos accusantium ut quas sed et. Obcaecati ipsum perspiciatis et modi eveniet animi et soluta. Quis nam praesentium voluptatem voluptas qui ex enim ut qui. Sed aut voluptatum omnis culpa beatae! Sunt odit dicta. Dolore incidunt labore id facere qui dolor officia! Consequatur commodi magnam sunt, tempore libero ullam unde quis rerum. In alias cum omnis molestiae!
Unde dolor possimus distinctio autem vel sint; dolor atque nisi rerum cumque dolorum. Expedita rem beatae cum quia nostrum vel sed! Natus fuga nostrum debitis voluptas officia accusantium tempora aut eaque. Tenetur explicabo dolorem consequatur velit et libero sed, sit beatae.', N'https://wo.entent.net/allted/vehatha/ionither/thiwashen.png')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (41, 18, CAST(N'1984-11-07 15:28:32.080' AS DateTime), N'Voluptates ut quia sit qui quam. Et magnam explicabo deleniti; ex nobis sint voluptate et nemo odio. Veritatis ea, omnis sed nam eaque aut molestiae ad ut. Eius et accusantium. Repellendus consequuntur quo at ratione ut sit fugit et sequi. Commodi voluptatem ut sed obcaecati aut labore sit illo ratione!
Laudantium quia maxime sit sed non amet consequuntur aut repellat. Perferendis aspernatur qui sed qui non repellendus temporibus eum accusamus. Amet voluptate quae ipsa labore voluptatem ex odio quasi vel; perspiciatis dicta omnis ullam asperiores cupiditate unde fugiat illum modi.', N'https://megiyi.ennthatnd.be/oureve/ittedith/edalat/hinteralour.jpg')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (42, 17, CAST(N'1981-07-17 16:15:41.740' AS DateTime), N'Maxime quis vel hic impedit, voluptatem est quis earum animi. Et sit quaerat ducimus aut, eum totam necessitatibus voluptate aspernatur. Unde quaerat voluptas iure fuga totam et est tempora at. Cum enim ducimus ut et vel laudantium eum omnis ut! Tempore laboriosam veritatis dolore iure adipisci, et velit quo nihil. Aut laborum ipsum nesciunt harum, voluptatem iure et inventore expedita. Quaerat quia obcaecati aspernatur ut voluptas officia dolorem a dignissimos.
Voluptatem odio autem aperiam nisi, vitae delectus illo unde ullam.', N'https://areallinou.es/erealte/eveor/hisand/tedoulnethi.jpg')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (43, 13, CAST(N'1990-08-27 04:37:35.600' AS DateTime), N'Suscipit ad possimus deserunt qui ad rem in dolore. Aut dolor odio eos totam iusto sit quo est harum. Eius et illo aut ipsum exercitationem ut! Repellat nobis quia mollitia minima.
Dolor et ex placeat cum ipsam. Doloribus a suscipit cum officiis. Voluptatem consequuntur cum enim quis, repellat in qui voluptatibus necessitatibus. Expedita laboriosam ad suscipit dolores porro quaerat quia totam? Perferendis iste modi dolores similique mollitia! Debitis consequatur et earum aut quasi neque. Voluptates minus accusamus.
Ducimus et eveniet. Harum sit commodi. Et quis maxime. Eligendi aliquid eaque. Aut quis est. Expedita deleniti soluta. Eos fuga doloremque. Distinctio sit minima. Sed qui magni.', N'http://heye.ornt.hu/oultoand/never/alteheer.gif')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (44, 10, CAST(N'1973-01-09 02:37:56.650' AS DateTime), N'Praesentium non quod iste omnis et optio ea molestiae repudiandae. Ratione ut libero quasi eum in debitis sit, aperiam minus. Facilis obcaecati architecto ut voluptatum ab veritatis autem unde assumenda; quod quo quis ut quia assumenda esse debitis aliquid mollitia...
Quod eius, atque suscipit illo aspernatur excepturi non consectetur qui. Sunt quo dolor possimus recusandae necessitatibus qui dolor praesentium delectus. Quis a delectus sunt perspiciatis vel rerum ex quo ab! Ratione nam, aut omnis odit omnis explicabo omnis error rerum. Consectetur esse quis incidunt cum aut omnis atque repellendus quae.', N'http://onoulngme.uk/uldheere/vehenher/th/eaoreahat.jpg')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (45, 5, CAST(N'1976-06-13 14:45:30.710' AS DateTime), N'Quaerat maxime, molestias error unde voluptatem iste cupiditate ex sit. Quasi officiis, unde aperiam quia qui voluptatem ut enim similique. Error eum ipsum ut eveniet eos doloremque consequatur nisi adipisci. Placeat non dicta vel unde fugiat praesentium velit vel sit. Perspiciatis fuga provident id illo omnis laborum sunt non numquam? Voluptatem optio ipsum eos quasi repellendus rerum dolor est dolores. Perspiciatis cum recusandae aut at consequatur deleniti accusamus inventore quod. Voluptas quia in, nihil ipsum ducimus quos tenetur vel voluptate.', N'http://thallyou.ge/shoth/herhadasthi.bmp')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (46, 18, CAST(N'1993-12-24 01:35:15.100' AS DateTime), N'Et nesciunt, quod aut soluta libero omnis quas et quas. Ut voluptatem adipisci numquam illo ut sit exercitationem voluptatem voluptas! Consectetur saepe dolorem id perspiciatis vel illo eos unde autem. Velit eius sed voluptatibus quam similique architecto ipsa et cupiditate. Corrupti incidunt non autem est error libero nihil qui iusto. Cumque ex a reiciendis, dolores minima rerum ipsa officiis esse. Tenetur ullam ex porro sit est voluptatem quibusdam ut sed. Tenetur voluptas illo nisi, perspiciatis vitae vero omnis nobis qui. Culpa omnis hic totam exercitationem, quibusdam omnis eos quaerat rerum.', N'https://omeseentte.ar/ed/veallen/ereaverand.jpg')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (47, 9, CAST(N'1982-10-29 13:13:09.860' AS DateTime), N'Ipsum et reiciendis est consequuntur vitae quia obcaecati velit. Laudantium cupiditate consequatur nihil nulla tenetur consequatur beatae quos. Quod quibusdam sit et. Quia asperiores quae et necessitatibus exercitationem perferendis praesentium; debitis qui esse ad repudiandae sint provident; et quidem sit sed maiores repellat.
Laborum qui natus reprehenderit nisi quod et. Natus consequatur ipsam deserunt rerum. Accusantium porro accusantium omnis illo exercitationem expedita id? Non ea est et facilis ratione adipisci ut et! Voluptas impedit velit dignissimos modi repellat architecto enim. Minima voluptatem ea. Voluptates sint suscipit.
Placeat adipisci in. Nobis aut veniam? Qui dolorem perspiciatis. Vero voluptatibus minima. Aut est quaerat; enim tempora eligendi.', N'https://bokode.thiomete.ae/ome/shoesandion.png')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (48, 11, CAST(N'1977-02-20 08:51:52.570' AS DateTime), N'Dolor rerum voluptatem consequatur autem veniam officia. Natus magnam ex sint aliquam dignissimos expedita ipsam? Dolores itaque earum veniam modi et aut est ut voluptatem! Doloribus delectus molestias incidunt est ea accusamus. Perspiciatis quidem velit asperiores nihil autem placeat in aut? Optio dolores qui placeat qui quae ut nisi iste molestiae! Est corporis iste deserunt quod inventore fugit tempora nihil nisi. Sit corrupti at ut sequi illo sunt! Eum aspernatur voluptas molestias autem eos autem aut.
Nihil sunt ut quo, aut neque laudantium id et officiis. Voluptas et rem. Velit qui sit? Earum autem cumque. Voluptas nam aut. Quaerat rerum hic!', NULL)
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (49, 17, CAST(N'1992-12-16 21:38:04.050' AS DateTime), N'Est aut natus nesciunt quaerat sed, aspernatur possimus itaque ad. Vitae facere qui est possimus, earum perferendis quisquam et ratione!', NULL)
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (50, 12, CAST(N'1986-04-26 22:10:53.900' AS DateTime), N'Tempora omnis soluta adipisci est ab omnis vero quia voluptatem. Sit officia quasi quae sit recusandae iste sit sed voluptas.', NULL)
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (53, 1, CAST(N'2021-05-07 00:00:00.000' AS DateTime), N'nuvo post David Cubides 03', N'null')
INSERT [dbo].[Publicacion] ([IdPublicacion], [IdUsuario], [Fecha], [Descripcion], [Imagen]) VALUES (54, 1, CAST(N'2021-05-07 00:00:00.000' AS DateTime), N'nuvo post David Cubides 03', N'null')
SET IDENTITY_INSERT [dbo].[Publicacion] OFF
SET IDENTITY_INSERT [dbo].[Seguridad] ON 

INSERT [dbo].[Seguridad] ([IdSeguridad], [Usuario], [NombreUsuario], [Contrasena], [Direccion], [Telefono], [Email], [Edad], [Rol]) VALUES (1, N'Admin', N'Admin', N'1234', N'Avenida siempre viva 123', N'555555', N'admin@admin.com', 1, N'Administrator')
INSERT [dbo].[Seguridad] ([IdSeguridad], [Usuario], [NombreUsuario], [Contrasena], [Direccion], [Telefono], [Email], [Edad], [Rol]) VALUES (2, N'Visitor', N'Visitor', N'1234', N'Avenida siempre viva 123', N'555555', N'visitor@visitor.com', 1, N'Visitor')
INSERT [dbo].[Seguridad] ([IdSeguridad], [Usuario], [NombreUsuario], [Contrasena], [Direccion], [Telefono], [Email], [Edad], [Rol]) VALUES (3, N'DavidC', N'David Cubides', N'1234', N'sss', N'555', N's@s.com', 12, N'Administrator')
INSERT [dbo].[Seguridad] ([IdSeguridad], [Usuario], [NombreUsuario], [Contrasena], [Direccion], [Telefono], [Email], [Edad], [Rol]) VALUES (4, N'Juan', N'Juan Juan', N'12345', N'dd', N'44', N'f@f.com', 12, N'Visitor')
INSERT [dbo].[Seguridad] ([IdSeguridad], [Usuario], [NombreUsuario], [Contrasena], [Direccion], [Telefono], [Email], [Edad], [Rol]) VALUES (5, N'Albert', N'Albert Einstein', N'energia', N'22', N'22', N'albert@albert.com', 62, N'Administrator')
INSERT [dbo].[Seguridad] ([IdSeguridad], [Usuario], [NombreUsuario], [Contrasena], [Direccion], [Telefono], [Email], [Edad], [Rol]) VALUES (6, N'Alexandra', N'Alexandra Enciso', N'1234', N'ff', N'55', N'ssss', 60, N'Assistant')
SET IDENTITY_INSERT [dbo].[Seguridad] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Email], [FechaNacimiento], [Telefono], [Activo]) VALUES (1, N'Hademar', N'Coleman', N'Ligon@example.com', CAST(N'1973-07-05' AS Date), N'012-9871', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Email], [FechaNacimiento], [Telefono], [Activo]) VALUES (2, N'Reginalda', N'Fife', N'Burrows865@example.com', CAST(N'1971-09-27' AS Date), N'353-5572', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Email], [FechaNacimiento], [Telefono], [Activo]) VALUES (3, N'Lovelle', N'Severson', N'GeorgannSamples457@example.com', CAST(N'1976-11-01' AS Date), N'616-9947', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Email], [FechaNacimiento], [Telefono], [Activo]) VALUES (4, N'Maex', N'Turney', N'Cedric.CSotelo@example.com', CAST(N'1976-09-28' AS Date), NULL, 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Email], [FechaNacimiento], [Telefono], [Activo]) VALUES (5, N'Volbrecht', N'Mattox', N'Loftis@example.com', CAST(N'1990-07-22' AS Date), N'522-4615', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Email], [FechaNacimiento], [Telefono], [Activo]) VALUES (6, N'Dietlinde', N'Seward', N'Francene.E.Acker869@example.co', CAST(N'1986-08-26' AS Date), N'755-7107', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Email], [FechaNacimiento], [Telefono], [Activo]) VALUES (7, N'Helmgard', N'Turpin', N'ssmxzviy.qout@example.com', CAST(N'1971-07-21' AS Date), N'819-2339', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Email], [FechaNacimiento], [Telefono], [Activo]) VALUES (8, N'Heloise', N'Kelsey', N'Abreu222@example.com', CAST(N'1972-07-03' AS Date), N'329-7457', 0)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Email], [FechaNacimiento], [Telefono], [Activo]) VALUES (9, N'Dietra', N'Mattson', N'SeeWild56@example.com', CAST(N'1976-11-04' AS Date), N'199-0109', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Email], [FechaNacimiento], [Telefono], [Activo]) VALUES (10, N'Dominik', N'Overby', N'Severson757@example.com', CAST(N'1999-11-18' AS Date), N'290-1105', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Email], [FechaNacimiento], [Telefono], [Activo]) VALUES (11, N'Mangold', N'Rushing', N'CatherynTaber@example.com', CAST(N'1991-06-09' AS Date), N'210-9996', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Email], [FechaNacimiento], [Telefono], [Activo]) VALUES (12, N'Achime ', N'Cosgrove', N'Verline_Fairbanks2@example.com', CAST(N'1970-01-31' AS Date), N'252-2063', 0)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Email], [FechaNacimiento], [Telefono], [Activo]) VALUES (13, N'Corbinian', N'Bohn', N'Julene.IAbrams@example.com', CAST(N'1977-04-27' AS Date), NULL, 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Email], [FechaNacimiento], [Telefono], [Activo]) VALUES (14, N'Burghard', N'Kelso', N'AbigailKruse91@nowhere.com', CAST(N'1998-02-05' AS Date), N'820-8663', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Email], [FechaNacimiento], [Telefono], [Activo]) VALUES (15, N'Burghild', N'Mauldin', N'jnmo3690@nowhere.com', CAST(N'1970-01-14' AS Date), N'130-5414', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Email], [FechaNacimiento], [Telefono], [Activo]) VALUES (16, N'Fabius', N'Overstreet', N'Sikes@example.com', CAST(N'1996-02-23' AS Date), N'055-4764', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Email], [FechaNacimiento], [Telefono], [Activo]) VALUES (17, N'Balian ', N'Russ', N'Luther@example.com', CAST(N'1980-08-12' AS Date), N'332-7080', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Email], [FechaNacimiento], [Telefono], [Activo]) VALUES (18, N'Gerulf', N'Coles', N'DorothaCass344@example.com', CAST(N'1991-03-17' AS Date), N'446-3801', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Email], [FechaNacimiento], [Telefono], [Activo]) VALUES (19, N'Olf', N'Sewell', N'Burch@example.com', CAST(N'1970-01-06' AS Date), N'459-9752', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Email], [FechaNacimiento], [Telefono], [Activo]) VALUES (20, N'Akelei ', N'Tuttle', N'YasmineJensen@example.com', CAST(N'1975-01-27' AS Date), N'994-4885', 1)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[Comentario]  WITH NOCHECK ADD  CONSTRAINT [FK_Comentario_Publicacion] FOREIGN KEY([IdPublicacion])
REFERENCES [dbo].[Publicacion] ([IdPublicacion])
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Publicacion]
GO
ALTER TABLE [dbo].[Comentario]  WITH NOCHECK ADD  CONSTRAINT [FK_Comentario_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Usuario]
GO
ALTER TABLE [dbo].[Publicacion]  WITH NOCHECK ADD  CONSTRAINT [FK_Publicacion_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Publicacion] CHECK CONSTRAINT [FK_Publicacion_Usuario]
GO
USE [master]
GO
ALTER DATABASE [SistemaAdmContenido] SET  READ_WRITE 
GO
