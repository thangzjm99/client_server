USE [master]
GO
/****** Object:  Database [BanDoNoiThat]    Script Date: 3/13/2021 4:32:14 PM ******/
CREATE DATABASE [BanDoNoiThat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BanDoNoiThat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BanDoNoiThat.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BanDoNoiThat_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BanDoNoiThat_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BanDoNoiThat] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BanDoNoiThat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BanDoNoiThat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BanDoNoiThat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BanDoNoiThat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BanDoNoiThat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BanDoNoiThat] SET ARITHABORT OFF 
GO
ALTER DATABASE [BanDoNoiThat] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BanDoNoiThat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BanDoNoiThat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BanDoNoiThat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BanDoNoiThat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BanDoNoiThat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BanDoNoiThat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BanDoNoiThat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BanDoNoiThat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BanDoNoiThat] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BanDoNoiThat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BanDoNoiThat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BanDoNoiThat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BanDoNoiThat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BanDoNoiThat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BanDoNoiThat] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BanDoNoiThat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BanDoNoiThat] SET RECOVERY FULL 
GO
ALTER DATABASE [BanDoNoiThat] SET  MULTI_USER 
GO
ALTER DATABASE [BanDoNoiThat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BanDoNoiThat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BanDoNoiThat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BanDoNoiThat] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BanDoNoiThat] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BanDoNoiThat', N'ON'
GO
ALTER DATABASE [BanDoNoiThat] SET QUERY_STORE = OFF
GO
USE [BanDoNoiThat]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/13/2021 4:32:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[slug] [varchar](255) NULL,
	[description] [text] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 3/13/2021 4:32:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_customer] [bigint] NULL,
	[id_product] [bigint] NULL,
	[detail] [varchar](200) NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/13/2021 4:32:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[address] [text] NULL,
	[membership] [int] NULL,
	[email] [varchar](255) NULL,
	[created_at] [datetime] NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[status] [bit] NOT NULL,
	[is_admin] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQ]    Script Date: 3/13/2021 4:32:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQ](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_customer] [bigint] NULL,
	[detail] [varchar](200) NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_FAQ] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Import]    Script Date: 3/13/2021 4:32:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_product] [bigint] NULL,
	[id_productionCompany] [bigint] NULL,
	[import_price] [float] NULL,
	[quantity] [bigint] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_Import] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/13/2021 4:32:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[customer_name] [varchar](255) NULL,
	[id_customer] [bigint] NULL,
	[address] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[total_price] [float] NULL,
	[note] [varchar](255) NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_detail]    Script Date: 3/13/2021 4:32:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_detail](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_id] [bigint] NULL,
	[product_id] [bigint] NULL,
	[amount] [bigint] NULL,
	[total_price] [float] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_Order_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/13/2021 4:32:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [varchar](10) NULL,
	[id_category] [bigint] NULL,
	[name] [varchar](255) NULL,
	[slug] [varchar](255) NULL,
	[overview] [varchar](255) NULL,
	[image] [text] NULL,
	[description] [varchar](255) NULL,
	[detail] [varchar](255) NULL,
	[unit] [varchar](255) NULL,
	[price] [float] NULL,
	[remain_quantity] [int] NULL,
	[sale] [float] NULL,
	[star] [float] NULL,
	[is_stock] [bit] NULL,
	[is_active] [bit] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductionCompany]    Script Date: 3/13/2021 4:32:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionCompany](
	[id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[name] [varchar](225) NULL,
	[email] [varchar](225) NULL,
	[address] [text] NULL,
	[phone] [varchar](225) NULL,
 CONSTRAINT [PK_ProductionCompany] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [code], [name], [slug], [description], [created_at]) VALUES (9, N'F1', N'Bed', NULL, N'Beds', CAST(N'1900-01-01T00:00:06.000' AS DateTime))
INSERT [dbo].[Category] ([id], [code], [name], [slug], [description], [created_at]) VALUES (10, N'F2', N'Sofa', NULL, N'Sofa', CAST(N'1900-01-01T00:00:06.000' AS DateTime))
INSERT [dbo].[Category] ([id], [code], [name], [slug], [description], [created_at]) VALUES (12, N'F3', N'Dinning table', NULL, N'Dinning table', CAST(N'2021-02-25T22:59:44.000' AS DateTime))
INSERT [dbo].[Category] ([id], [code], [name], [slug], [description], [created_at]) VALUES (13, N'F4', N'Closet ', NULL, N'Closet', CAST(N'2021-02-28T10:31:49.980' AS DateTime))
INSERT [dbo].[Category] ([id], [code], [name], [slug], [description], [created_at]) VALUES (14, N'F5', N'Shoes Rack', NULL, N'Shoes Rack', CAST(N'2021-02-28T10:32:51.707' AS DateTime))
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([id], [name], [phone], [address], [membership], [email], [created_at], [username], [password], [status], [is_admin]) VALUES (5, N'admin', N'0868814474', N'admin', NULL, N'admin@gmail.com', CAST(N'2021-02-25T14:23:02.567' AS DateTime), N'admin', N'21232f297a57a5a743894a0e4a801fc3', 1, 1)
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [membership], [email], [created_at], [username], [password], [status], [is_admin]) VALUES (6, N'Dinh Quoc Thang', N'0868814474', N'kham thien ', NULL, N'thangzjm199@gmail.com', CAST(N'2021-02-25T14:24:25.000' AS DateTime), N'thang1234', N'202cb962ac59075b964b07152d234b70', 1, NULL)
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [membership], [email], [created_at], [username], [password], [status], [is_admin]) VALUES (7, N'Nguyen Hoang Hiep', N'0868814474', N'kham thien 2', NULL, N'thang2@gmail.com', CAST(N'2021-02-25T14:39:05.000' AS DateTime), N'thang2', N'202cb962ac59075b964b07152d234b70', 1, NULL)
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [membership], [email], [created_at], [username], [password], [status], [is_admin]) VALUES (8, N'Nguyen Dinh Thinh', N'33333333333', N'Kham Thien Dong Da', NULL, N'thang3@gmail.com', CAST(N'2021-02-28T14:29:53.657' AS DateTime), N'thang3', N'202cb962ac59075b964b07152d234b70', 1, NULL)
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [membership], [email], [created_at], [username], [password], [status], [is_admin]) VALUES (9, N'Do Viet Anh', N'4444444444', N'Kham Thien Dong Da', NULL, N'thang4@gmail.com', CAST(N'2021-02-28T14:30:14.780' AS DateTime), N'thang4', N'202cb962ac59075b964b07152d234b70', 1, NULL)
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [membership], [email], [created_at], [username], [password], [status], [is_admin]) VALUES (10, N'Cao Minh Duc', N'55555555', N'Duy Tan,Cau Giay', NULL, N'thang5@gmail.com', CAST(N'2021-02-28T14:30:47.847' AS DateTime), N'thang5', N'202cb962ac59075b964b07152d234b70', 1, NULL)
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [membership], [email], [created_at], [username], [password], [status], [is_admin]) VALUES (11, N'Do Tien Thanh', N'666666666', N'Dai Mo,Ha Dong', NULL, N'thang6@gmail.com', CAST(N'2021-02-28T14:31:21.747' AS DateTime), N'thang6', N'202cb962ac59075b964b07152d234b70', 1, NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Import] ON 

INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (19, 16, 6, 100, 20, CAST(N'2021-02-28T14:40:20.393' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (20, 17, 5, 100, 20, CAST(N'2021-02-28T14:40:39.097' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (21, 18, 7, 100, 20, CAST(N'2021-02-28T14:40:49.953' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (22, 19, 9, 100, 20, CAST(N'2021-02-28T14:41:08.940' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (23, 20, 5, 100, 20, CAST(N'2021-02-28T14:41:18.960' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (24, 21, 7, 100, 20, CAST(N'2021-02-28T14:41:41.943' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (25, 24, 6, 100, 15, CAST(N'2021-02-28T14:41:51.810' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (26, 25, 8, 100, 15, CAST(N'2021-02-28T14:42:02.690' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (27, 26, 5, 150, 20, CAST(N'2021-02-28T14:42:20.627' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (28, 27, 5, 100, 20, CAST(N'2021-02-28T14:42:35.097' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (29, 28, 7, 100, 20, CAST(N'2021-02-28T14:42:44.603' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (30, 29, 9, 100, 20, CAST(N'2021-02-28T14:42:54.057' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (31, 29, 6, 100, 20, CAST(N'2021-02-28T14:43:03.977' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (32, 30, 5, 100, 20, CAST(N'2021-02-28T14:43:32.953' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (33, 31, 5, 100, 20, CAST(N'2021-02-28T14:43:45.393' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (34, 32, 9, 100, 20, CAST(N'2021-02-28T14:43:54.753' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (35, 33, 9, 100, 20, CAST(N'2021-02-28T14:44:13.147' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (36, 34, 5, 100, 20, CAST(N'2021-02-28T14:44:25.060' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (37, 35, 7, 100, 20, CAST(N'2021-02-28T14:44:42.280' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (38, 36, 9, 100, 20, CAST(N'2021-02-28T14:44:53.597' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (39, 37, 5, 100, 20, CAST(N'2021-02-28T14:45:10.083' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (40, 37, 5, 100, 20, CAST(N'2021-02-28T14:45:27.410' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (41, 38, 6, 100, 20, CAST(N'2021-02-28T14:45:38.863' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (42, 39, 8, 100, 20, CAST(N'2021-02-28T14:46:02.873' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (43, 40, 9, 100, 20, CAST(N'2021-02-28T14:46:12.530' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (44, 41, 7, 100, 150, CAST(N'2021-02-28T14:46:30.130' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (45, 42, 6, 100, 20, CAST(N'2021-02-28T14:46:45.633' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (46, 43, 5, 100, 20, CAST(N'2021-02-28T14:46:55.593' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (47, 44, 9, 100, 20, CAST(N'2021-02-28T14:47:05.057' AS DateTime))
SET IDENTITY_INSERT [dbo].[Import] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10020, N'Nguyen Dinh Thinh', 8, N'Kham Thien Dong Da', N'33333333333', N'thang3@gmail.com', 1300, NULL, NULL, CAST(N'2021-02-28T14:49:00.460' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10021, N'Nguyen Dinh Thinh', 8, N'Kham Thien Dong Da', N'33333333333', N'thang3@gmail.com', 1100, NULL, NULL, CAST(N'2021-02-28T14:50:23.160' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10022, N'Do Tien Thanh', 11, N'Dai Mo,Ha Dong', N'666666666', N'thang6@gmail.com', 1700, NULL, NULL, CAST(N'2021-02-28T15:04:29.957' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10023, N'Cao Minh Duc', 10, N'Duy Tan,Cau Giay', N'55555555', N'thang5@gmail.com', 1000, NULL, NULL, CAST(N'2021-02-28T15:05:54.107' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10024, N'Do Viet Anh', 9, N'Kham Thien Dong Da', N'4444444444', N'thang4@gmail.com', 1350, NULL, NULL, CAST(N'2021-02-28T15:07:39.730' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10025, N'Nguyen Hoang Hiep', 7, N'kham thien 2', N'0868814474', N'thang2@gmail.com', 400, NULL, NULL, CAST(N'2021-02-28T15:08:19.610' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10026, N'Le quoc anh', NULL, N'hoang quoc viet', N'123456789', N'quocanh@gmail.com', 700, NULL, NULL, CAST(N'2021-03-01T20:36:31.313' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10027, N'Do viet Anh', NULL, N'kham thien', N'0868814474', N'thangzjm2504@gmail.com', 550, NULL, NULL, CAST(N'2021-03-02T15:21:56.207' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10028, N'Nguyen Dinh Thinh', 8, N'Kham Thien Dong Da', N'33333333333', N'thang3@gmail.com', 750, NULL, NULL, CAST(N'2021-03-02T15:22:36.880' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_detail] ON 

INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10030, 10020, 39, 2, 150, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10031, 10020, 29, 3, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10032, 10020, 27, 2, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10033, 10021, 30, 3, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10034, 10021, 36, 2, 250, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10035, 10022, 29, 3, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10036, 10022, 31, 2, 250, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10037, 10022, 17, 2, 300, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10038, 10023, 25, 2, 250, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10039, 10023, 30, 1, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10040, 10023, 42, 2, 150, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10041, 10024, 16, 3, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10042, 10024, 25, 1, 250, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10043, 10024, 33, 1, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10044, 10024, 40, 2, 150, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10045, 10025, 20, 2, 100, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10046, 10025, 27, 1, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10047, 10026, 44, 2, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10048, 10026, 43, 1, 150, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10049, 10026, 39, 1, 150, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10050, 10027, 44, 2, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10051, 10027, 39, 1, 150, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10052, 10028, 44, 3, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10053, 10028, 39, 1, 150, NULL)
SET IDENTITY_INSERT [dbo].[Order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (16, N'B1', 9, N'Baltoro high gloss', NULL, NULL, N'Baltoro_High_Gloss_Hydraulic_Storage_Bed_Queen_LP.jpg', NULL, NULL, NULL, 200, 17, NULL, NULL, 1, 1, CAST(N'2021-02-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (17, N'B2', 9, N'Duetto Platform', NULL, NULL, N'Duetto_Platform_Bed_LP.jpg', NULL, NULL, NULL, 300, 18, NULL, NULL, 1, 1, CAST(N'2021-02-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (18, N'S1', 10, N'Oxford Sofa', NULL, NULL, N'Oxford_Sofa_FNSF51ODCO30R00SAAAA.jpg', NULL, NULL, NULL, 100, 20, NULL, NULL, 1, 1, CAST(N'2021-02-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (19, N'S2', 10, N'Dark Green Sofa', NULL, NULL, N'FNSF51ABMB3_-_main_1.jpg', NULL, NULL, NULL, 150, 20, NULL, NULL, 1, 1, CAST(N'2021-02-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (20, N'S3', 10, N'Gray Sofa ', NULL, NULL, N'FNSF51EAGY3_-_main_1.png', NULL, NULL, NULL, 100, 18, NULL, NULL, 1, 1, CAST(N'2021-02-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (21, N'B3', 9, N'Aspen Merch LP', NULL, NULL, N'Aspen_Merch_LP.jpg', NULL, NULL, NULL, 200, 20, NULL, NULL, 1, 1, CAST(N'2021-02-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (24, N'B4', 9, N'Aspen Begie Bed', NULL, NULL, N'Aspen_Beige_LP.jpg', NULL, NULL, NULL, 250, 15, NULL, NULL, 1, 1, CAST(N'2021-02-28T10:35:48.000' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (25, N'B5', 9, N'Brandenber Bed', NULL, NULL, N'Brandenberg_Storage_Bed_Dark_Walnut_King_LP.jpg', NULL, NULL, NULL, 250, 12, NULL, NULL, 1, 1, CAST(N'2021-02-28T10:43:54.023' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (26, N'B6', 9, N'Fareo Bed', NULL, NULL, N'Faroe_Beige_LP.jpg', NULL, NULL, NULL, 250, 20, NULL, NULL, 1, 1, CAST(N'2021-02-28T10:44:43.823' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (27, N'DT1', 12, N'Wood Dinning Table ', NULL, NULL, N'ALL_Dining_Sets.jpg', NULL, NULL, NULL, 200, 17, NULL, NULL, 1, 1, CAST(N'2021-02-28T10:45:40.213' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (28, N'DT2', 12, N'Caribu Dinning Table', NULL, NULL, N'CAribu_6_Seater_Dining_Table_Set.jpg', NULL, NULL, NULL, 200, 20, NULL, NULL, 1, 1, CAST(N'2021-02-28T10:46:14.440' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (29, N'DT3', 12, N'Takashi Dinning Table', NULL, NULL, N'Taarkashi.jpg', NULL, NULL, NULL, 200, 34, NULL, NULL, 1, 1, CAST(N'2021-02-28T10:46:48.330' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (30, N'C1', 13, N'Baltoro White Closet', NULL, NULL, N'Baltoro_Wardrobe_White_LP.jpg', NULL, NULL, NULL, 200, 16, NULL, NULL, 1, 1, CAST(N'2021-02-28T10:47:44.097' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (31, N'C2', 13, N'Hillton 4 Doors Closet', NULL, NULL, N'Hilton_4_door_SW_LP.jpg', NULL, NULL, NULL, 250, 18, NULL, NULL, 1, 1, CAST(N'2021-02-28T10:48:48.673' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (32, N'C3', 13, N'Hillton 3 Doors Closet', NULL, NULL, N'Hilton_Three_Door_Wardrobe_Two_LP.jpg', NULL, NULL, NULL, 200, 20, NULL, NULL, 1, 1, CAST(N'2021-02-28T12:43:00.877' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (33, N'C4', 13, N'Magelan Armoire Closet', NULL, NULL, N'MAGELLAN_ARMOIRE_LP.jpg', NULL, NULL, NULL, 200, 19, NULL, NULL, 1, 1, CAST(N'2021-02-28T12:43:52.860' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (34, N'C5', 13, N'Magelan Mahogany Closet', NULL, NULL, N'MAGELLAN_ARMOIRE_Mahogany_LP.jpg', NULL, NULL, NULL, 200, 20, NULL, NULL, 1, 1, CAST(N'2021-02-28T12:44:37.923' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (35, N'C6', 13, N'Miler 4 Doors Closet', NULL, NULL, N'Miller_Four_Door_Four_Drawer_LP.jpg', NULL, NULL, NULL, 250, 20, NULL, NULL, 1, 1, CAST(N'2021-02-28T12:45:29.957' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (36, N'S4', 10, N'Janet Adrian Sofa', NULL, NULL, N'Janet_adrian_velvet_LP.jpg', NULL, NULL, NULL, 250, 18, NULL, NULL, 1, 1, CAST(N'2021-02-28T12:47:00.827' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (37, N'S5', 10, N'Mineli 3 Seats Sofa', NULL, NULL, N'Minnelli_3_Seater_Loveseat_LP.jpg', NULL, NULL, NULL, 250, 40, NULL, NULL, 1, 1, CAST(N'2021-02-28T12:47:45.243' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (38, N'S6', 10, N'Mineli 2 Seats Sofa', NULL, NULL, N'Minnelli_Loveseat_00_LP.jpg', NULL, NULL, NULL, 250, 20, NULL, NULL, 1, 1, CAST(N'2021-02-28T12:48:30.203' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (39, N'SR1', 14, N'Baltoro High Shoes Rack', NULL, NULL, N'Baltoro_High_Glos_Shoe_LP.jpg', NULL, NULL, NULL, 150, 15, NULL, NULL, 1, 1, CAST(N'2021-02-28T12:49:40.260' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (40, N'SR2', 14, N'Bennis K12 Shoes Rack', NULL, NULL, N'Bennis_Shoe_Rack_12_Pair_LP.jpg', NULL, NULL, NULL, 150, 18, NULL, NULL, 1, 1, CAST(N'2021-02-28T12:50:18.940' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (41, N'SR3', 14, N'Bennis K18 Shoes Rack', NULL, NULL, N'Bennis_Shoe_Rack_18_Pair_LP.jpg', NULL, NULL, NULL, 200, 150, NULL, NULL, 1, 1, CAST(N'2021-02-28T12:51:06.517' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (42, N'SR4', 14, N'Macro Harmony Shoes Rack', NULL, NULL, N'Marco_Luggage_Bench_Mahogany_Finish_img_5113_copy_1.jpg', NULL, NULL, NULL, 150, 18, NULL, NULL, 1, 1, CAST(N'2021-02-28T12:51:48.733' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (43, N'SR5', 14, N'Oslo Shoes Rack', NULL, NULL, N'Oslo_Shoe_Rack_replace_LP.jpg', NULL, NULL, NULL, 150, 19, NULL, NULL, 1, 1, CAST(N'2021-02-28T12:52:15.607' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (44, N'SR6', 14, N'Wellington Shoes Rack', NULL, NULL, N'Wellington_Shoe_Rack_Bench_transition_LP.jpg', NULL, NULL, NULL, 200, 13, NULL, NULL, 1, 1, CAST(N'2021-02-28T12:53:02.837' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductionCompany] ON 

INSERT [dbo].[ProductionCompany] ([id], [name], [email], [address], [phone]) VALUES (5, N'Restoration Hardware', N'restoration@gmail.com', N'858  Hickory Heights Drive,Baltimore', N'4402424926')
INSERT [dbo].[ProductionCompany] ([id], [name], [email], [address], [phone]) VALUES (6, N'Roche Bobois', N'roche@gmail.com', N'3935  Sycamore Circle,Cleburne', N'6822029377')
INSERT [dbo].[ProductionCompany] ([id], [name], [email], [address], [phone]) VALUES (7, N'Edra', N'edra@gmail.com', N'3241  Birch  Street,El Paso', N'9159834303')
INSERT [dbo].[ProductionCompany] ([id], [name], [email], [address], [phone]) VALUES (8, N'Poliform', N'poliform@gmail.com', N'669  Robinson Court,Mount Pleasant', N'56888124')
INSERT [dbo].[ProductionCompany] ([id], [name], [email], [address], [phone]) VALUES (9, N'Christopher Guy', N'christphe.guy@gmail.com', N'4550  Derek Drive,Youngstown', N'995215542')
SET IDENTITY_INSERT [dbo].[ProductionCompany] OFF
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_is_admin]  DEFAULT ((0)) FOR [is_admin]
GO
ALTER TABLE [dbo].[Import] ADD  CONSTRAINT [DF_Import_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Customer] FOREIGN KEY([id_customer])
REFERENCES [dbo].[Customer] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Customer]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Product] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Product]
GO
ALTER TABLE [dbo].[FAQ]  WITH CHECK ADD  CONSTRAINT [FK_FAQ_Customer] FOREIGN KEY([id_customer])
REFERENCES [dbo].[Customer] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FAQ] CHECK CONSTRAINT [FK_FAQ_Customer]
GO
ALTER TABLE [dbo].[Import]  WITH CHECK ADD  CONSTRAINT [FK_Import_Product] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Import] CHECK CONSTRAINT [FK_Import_Product]
GO
ALTER TABLE [dbo].[Import]  WITH CHECK ADD  CONSTRAINT [FK_Import_ProductionCompany] FOREIGN KEY([id_productionCompany])
REFERENCES [dbo].[ProductionCompany] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Import] CHECK CONSTRAINT [FK_Import_ProductionCompany]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([id_customer])
REFERENCES [dbo].[Customer] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order_detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_detail_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Order_detail] CHECK CONSTRAINT [FK_Order_detail_Order]
GO
ALTER TABLE [dbo].[Order_detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_detail_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Order_detail] CHECK CONSTRAINT [FK_Order_detail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([id_category])
REFERENCES [dbo].[Category] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [BanDoNoiThat] SET  READ_WRITE 
GO
