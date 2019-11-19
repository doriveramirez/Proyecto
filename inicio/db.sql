USE [master]
GO
/****** Object:  Database [Publicaciones]    Script Date: 19/11/2019 15:11:34 ******/
CREATE DATABASE [Publicaciones]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Publicaciones', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Publicaciones.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Publicaciones_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Publicaciones_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Publicaciones] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Publicaciones].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Publicaciones] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Publicaciones] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Publicaciones] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Publicaciones] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Publicaciones] SET ARITHABORT OFF 
GO
ALTER DATABASE [Publicaciones] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Publicaciones] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Publicaciones] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Publicaciones] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Publicaciones] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Publicaciones] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Publicaciones] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Publicaciones] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Publicaciones] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Publicaciones] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Publicaciones] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Publicaciones] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Publicaciones] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Publicaciones] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Publicaciones] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Publicaciones] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Publicaciones] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Publicaciones] SET RECOVERY FULL 
GO
ALTER DATABASE [Publicaciones] SET  MULTI_USER 
GO
ALTER DATABASE [Publicaciones] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Publicaciones] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Publicaciones] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Publicaciones] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Publicaciones] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Publicaciones', N'ON'
GO
ALTER DATABASE [Publicaciones] SET QUERY_STORE = OFF
GO
USE [Publicaciones]
GO
/****** Object:  User [pepe]    Script Date: 19/11/2019 15:11:35 ******/
CREATE USER [pepe] FOR LOGIN [pepe] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [admin]    Script Date: 19/11/2019 15:11:35 ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [admin]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [admin]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [admin]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [admin]
GO
ALTER ROLE [db_datareader] ADD MEMBER [admin]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [admin]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [admin]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [admin]
GO
/****** Object:  Table [dbo].[Analisis]    Script Date: 19/11/2019 15:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Analisis](
	[Id] [int] NOT NULL,
	[Jugado] [bit] NULL,
	[Nota] [int] NULL,
	[Analisis] [nchar](255) NULL,
 CONSTRAINT [PK_Analisis] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 19/11/2019 15:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](50) NULL,
	[FechaFundacion] [date] NULL,
	[NumeroUsuarios] [int] NULL,
	[Imagen] [image] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distribuidora]    Script Date: 19/11/2019 15:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distribuidora](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](50) NOT NULL,
	[NumeroJuegosPublicados] [int] NOT NULL,
	[Imagen] [image] NULL,
 CONSTRAINT [PK_Distribuidora] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plataforma]    Script Date: 19/11/2019 15:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plataforma](
	[Id] [int] NOT NULL,
	[Nombre] [nchar](30) NULL,
	[FechaLanzamiento] [date] NULL,
	[VentasGeneradas] [int] NULL,
	[Descripcion] [nchar](255) NULL,
	[Imagen] [image] NULL,
	[Autor] [nchar](30) NULL,
 CONSTRAINT [PK_Plataforma] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plataforma_Videojuego]    Script Date: 19/11/2019 15:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plataforma_Videojuego](
	[PlataformaId] [int] NULL,
	[VideojuegoId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 19/11/2019 15:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](50) NULL,
	[FechaNac] [date] NULL,
	[Dni] [nchar](9) NULL,
	[Password] [nchar](20) NULL,
	[Usuario] [nchar](20) NULL,
	[CompanyID] [int] NULL,
	[Imagen] [image] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_Analisis]    Script Date: 19/11/2019 15:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_Analisis](
	[AnalisisId] [int] NULL,
	[UsuarioId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Videojuego]    Script Date: 19/11/2019 15:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Videojuego](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](50) NULL,
	[FechaPublicacion] [date] NULL,
	[VentasGenerados] [int] NULL,
	[NumeroPlataformasDisponibles] [int] NULL,
	[UsuarioID] [int] NULL,
	[DistribuidoraID] [int] NULL,
	[Imagen] [image] NULL,
 CONSTRAINT [PK_Videojuego] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Videojuego_Analisis]    Script Date: 19/11/2019 15:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Videojuego_Analisis](
	[VideojuegoId] [int] NULL,
	[AnalisisId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Plataforma_Videojuego]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_Plataforma] FOREIGN KEY([PlataformaId])
REFERENCES [dbo].[Plataforma] ([Id])
GO
ALTER TABLE [dbo].[Plataforma_Videojuego] CHECK CONSTRAINT [FK_Table_1_Plataforma]
GO
ALTER TABLE [dbo].[Plataforma_Videojuego]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_Videojuego] FOREIGN KEY([VideojuegoId])
REFERENCES [dbo].[Videojuego] ([Id])
GO
ALTER TABLE [dbo].[Plataforma_Videojuego] CHECK CONSTRAINT [FK_Table_1_Videojuego]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Company]
GO
ALTER TABLE [dbo].[Usuario_Analisis]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Analisis_Analisis] FOREIGN KEY([AnalisisId])
REFERENCES [dbo].[Analisis] ([Id])
GO
ALTER TABLE [dbo].[Usuario_Analisis] CHECK CONSTRAINT [FK_Usuario_Analisis_Analisis]
GO
ALTER TABLE [dbo].[Usuario_Analisis]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Analisis_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Usuario_Analisis] CHECK CONSTRAINT [FK_Usuario_Analisis_Usuario]
GO
ALTER TABLE [dbo].[Videojuego]  WITH CHECK ADD  CONSTRAINT [FK_Videojuego_Distribuidora] FOREIGN KEY([DistribuidoraID])
REFERENCES [dbo].[Distribuidora] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Videojuego] CHECK CONSTRAINT [FK_Videojuego_Distribuidora]
GO
ALTER TABLE [dbo].[Videojuego]  WITH CHECK ADD  CONSTRAINT [FK_Videojuego_Usuario] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Videojuego] CHECK CONSTRAINT [FK_Videojuego_Usuario]
GO
ALTER TABLE [dbo].[Videojuego_Analisis]  WITH CHECK ADD  CONSTRAINT [FK_Videojuego_Analisis_Analisis] FOREIGN KEY([AnalisisId])
REFERENCES [dbo].[Analisis] ([Id])
GO
ALTER TABLE [dbo].[Videojuego_Analisis] CHECK CONSTRAINT [FK_Videojuego_Analisis_Analisis]
GO
ALTER TABLE [dbo].[Videojuego_Analisis]  WITH CHECK ADD  CONSTRAINT [FK_Videojuego_Analisis_Videojuego] FOREIGN KEY([VideojuegoId])
REFERENCES [dbo].[Videojuego] ([Id])
GO
ALTER TABLE [dbo].[Videojuego_Analisis] CHECK CONSTRAINT [FK_Videojuego_Analisis_Videojuego]
GO
USE [master]
GO
ALTER DATABASE [Publicaciones] SET  READ_WRITE 
GO
