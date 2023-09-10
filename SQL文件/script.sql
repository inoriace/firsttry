USE [master]
GO
/****** Object:  Database [CommodityDB]    Script Date: 2023/9/10 13:16:58 ******/
CREATE DATABASE [CommodityDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'commodityDB', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\commodityDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'commodityDB_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\commodityDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CommodityDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CommodityDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CommodityDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CommodityDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CommodityDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CommodityDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CommodityDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CommodityDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CommodityDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CommodityDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CommodityDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CommodityDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CommodityDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CommodityDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CommodityDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CommodityDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CommodityDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CommodityDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CommodityDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CommodityDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CommodityDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CommodityDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CommodityDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CommodityDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CommodityDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CommodityDB] SET  MULTI_USER 
GO
ALTER DATABASE [CommodityDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CommodityDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CommodityDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CommodityDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CommodityDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CommodityDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CommodityDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [CommodityDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CommodityDB]
GO
/****** Object:  Table [dbo].[Commodity]    Script Date: 2023/9/10 13:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commodity](
	[ID] [int] NOT NULL,
	[photoref] [varchar](100) NULL,
	[name] [varchar](50) NULL,
	[price] [int] NOT NULL,
 CONSTRAINT [PK_Commodity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2023/9/10 13:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] NOT NULL,
	[CommodityId] [int] NOT NULL,
	[OrderTime] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shopcart]    Script Date: 2023/9/10 13:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shopcart](
	[ID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[CommodityID] [int] NOT NULL,
 CONSTRAINT [PK_Shopcart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2023/9/10 13:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] NOT NULL,
	[USERname] [varchar](20) NULL,
	[password] [varchar](20) NULL,
	[balance] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Commodity] ([ID], [photoref], [name], [price]) VALUES (1, N'images\1.jpg', N'手办1号', 100)
INSERT [dbo].[Commodity] ([ID], [photoref], [name], [price]) VALUES (2, N'images\2.jpg', N'手办2号', 200)
GO
INSERT [dbo].[Order] ([Id], [CommodityId], [OrderTime], [UserId]) VALUES (1, 2, CAST(N'2023-09-09T22:05:00.253' AS DateTime), 1)
INSERT [dbo].[Order] ([Id], [CommodityId], [OrderTime], [UserId]) VALUES (2, 1, CAST(N'2023-09-09T22:05:00.347' AS DateTime), 1)
INSERT [dbo].[Order] ([Id], [CommodityId], [OrderTime], [UserId]) VALUES (3, 2, CAST(N'2023-09-09T22:11:30.787' AS DateTime), 1)
INSERT [dbo].[Order] ([Id], [CommodityId], [OrderTime], [UserId]) VALUES (4, 1, CAST(N'2023-09-09T22:12:45.483' AS DateTime), 1)
GO
INSERT [dbo].[User] ([ID], [USERname], [password], [balance]) VALUES (1, N'test1', N'test1', 300)
INSERT [dbo].[User] ([ID], [USERname], [password], [balance]) VALUES (2, N'test2', N'test2', 0)
GO
USE [master]
GO
ALTER DATABASE [CommodityDB] SET  READ_WRITE 
GO
