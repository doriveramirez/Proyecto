USE [master]
GO
/****** Object:  Database [VideoGamesDatabase]    Script Date: 02/12/2019 17:39:32 ******/
CREATE DATABASE [VideoGamesDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VideoGamesDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\VideoGamesDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VideoGamesDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\VideoGamesDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [VideoGamesDatabase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VideoGamesDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VideoGamesDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VideoGamesDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VideoGamesDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VideoGamesDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VideoGamesDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [VideoGamesDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VideoGamesDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VideoGamesDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VideoGamesDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VideoGamesDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VideoGamesDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VideoGamesDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VideoGamesDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VideoGamesDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VideoGamesDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VideoGamesDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VideoGamesDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VideoGamesDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VideoGamesDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VideoGamesDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VideoGamesDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VideoGamesDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VideoGamesDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [VideoGamesDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [VideoGamesDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VideoGamesDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VideoGamesDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VideoGamesDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VideoGamesDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'VideoGamesDatabase', N'ON'
GO
ALTER DATABASE [VideoGamesDatabase] SET QUERY_STORE = OFF
GO
USE [VideoGamesDatabase]
GO
/****** Object:  User [pepe]    Script Date: 02/12/2019 17:39:32 ******/
CREATE USER [pepe] FOR LOGIN [pepe] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DESKTOP-3T6TSJI\AlumnadoTarde]    Script Date: 02/12/2019 17:39:32 ******/
CREATE USER [DESKTOP-3T6TSJI\AlumnadoTarde] FOR LOGIN [DESKTOP-3T6TSJI\AlumnadoTarde] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [admin]    Script Date: 02/12/2019 17:39:32 ******/
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
/****** Object:  Table [dbo].[Company]    Script Date: 02/12/2019 17:39:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [nchar](32) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[FoundationDate] [date] NULL,
	[NumberOfUsers] [int] NULL,
	[Picture] [image] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distributor]    Script Date: 02/12/2019 17:39:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distributor](
	[Id] [nchar](32) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[NumberOfGamesPublished] [int] NOT NULL,
	[Picture] [image] NULL,
 CONSTRAINT [PK_Distributor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Platform]    Script Date: 02/12/2019 17:39:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Platform](
	[Id] [nchar](32) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[ReleaseDate] [date] NULL,
	[SoldUnits] [int] NULL,
	[Description] [nvarchar](255) NULL,
	[Picture] [image] NULL,
	[Author] [nvarchar](30) NULL,
 CONSTRAINT [PK_Platform] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Platform_VideoGame]    Script Date: 02/12/2019 17:39:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Platform_VideoGame](
	[PlatformId] [nchar](32) NOT NULL,
	[VideoGameId] [nchar](32) NOT NULL,
 CONSTRAINT [PK_Platform_VideoGame] PRIMARY KEY CLUSTERED 
(
	[VideoGameId] ASC,
	[PlatformId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 02/12/2019 17:39:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[Id] [nchar](32) NOT NULL,
	[Played] [bit] NULL,
	[Mark] [int] NULL,
	[Description] [nvarchar](255) NULL,
	[UserID] [nchar](32) NULL,
	[VideogameID] [nchar](32) NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usr]    Script Date: 02/12/2019 17:39:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usr](
	[Id] [nchar](32) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[Dni] [nvarchar](9) NULL,
	[Password] [nvarchar](20) NULL,
	[Username] [nvarchar](20) NULL,
	[CompanyID] [nchar](32) NULL,
	[Picture] [image] NULL,
 CONSTRAINT [PK_Usr] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VideoGame]    Script Date: 02/12/2019 17:39:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoGame](
	[Id] [nchar](32) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ReleaseDate] [date] NULL,
	[SoldUnits] [int] NULL,
	[NumberOfAvailablePlatforms] [int] NULL,
	[UserID] [nchar](32) NULL,
	[DistributorID] [nchar](32) NULL,
	[Picture] [image] NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_VideoGame] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Platform_VideoGame]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_Platform] FOREIGN KEY([PlatformId])
REFERENCES [dbo].[Platform] ([Id])
GO
ALTER TABLE [dbo].[Platform_VideoGame] CHECK CONSTRAINT [FK_Table_1_Platform]
GO
ALTER TABLE [dbo].[Platform_VideoGame]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_VideoGame] FOREIGN KEY([VideoGameId])
REFERENCES [dbo].[VideoGame] ([Id])
GO
ALTER TABLE [dbo].[Platform_VideoGame] CHECK CONSTRAINT [FK_Table_1_VideoGame]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Usr] FOREIGN KEY([UserID])
REFERENCES [dbo].[Usr] ([Id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Usr]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_VideoGame] FOREIGN KEY([VideogameID])
REFERENCES [dbo].[VideoGame] ([Id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_VideoGame]
GO
ALTER TABLE [dbo].[Usr]  WITH CHECK ADD  CONSTRAINT [FK_Usr_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Usr] CHECK CONSTRAINT [FK_Usr_Company]
GO
ALTER TABLE [dbo].[VideoGame]  WITH CHECK ADD  CONSTRAINT [FK_VideoGame_Distributor] FOREIGN KEY([DistributorID])
REFERENCES [dbo].[Distributor] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VideoGame] CHECK CONSTRAINT [FK_VideoGame_Distributor]
GO
ALTER TABLE [dbo].[VideoGame]  WITH CHECK ADD  CONSTRAINT [FK_VideoGame_Usr] FOREIGN KEY([UserID])
REFERENCES [dbo].[Usr] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VideoGame] CHECK CONSTRAINT [FK_VideoGame_Usr]
GO
USE [master]
GO
ALTER DATABASE [VideoGamesDatabase] SET  READ_WRITE 
GO
