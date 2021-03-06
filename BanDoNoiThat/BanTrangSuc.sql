USE [master]
GO
/****** Object:  Database [BanTrangSuc]    Script Date: 3/19/2021 8:23:24 PM ******/
CREATE DATABASE [BanTrangSuc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BanNuocHoa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BanNuocHoa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BanNuocHoa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BanNuocHoa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BanTrangSuc] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BanTrangSuc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BanTrangSuc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BanTrangSuc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BanTrangSuc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BanTrangSuc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BanTrangSuc] SET ARITHABORT OFF 
GO
ALTER DATABASE [BanTrangSuc] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BanTrangSuc] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BanTrangSuc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BanTrangSuc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BanTrangSuc] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BanTrangSuc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BanTrangSuc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BanTrangSuc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BanTrangSuc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BanTrangSuc] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BanTrangSuc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BanTrangSuc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BanTrangSuc] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BanTrangSuc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BanTrangSuc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BanTrangSuc] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BanTrangSuc] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BanTrangSuc] SET RECOVERY FULL 
GO
ALTER DATABASE [BanTrangSuc] SET  MULTI_USER 
GO
ALTER DATABASE [BanTrangSuc] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BanTrangSuc] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BanTrangSuc] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BanTrangSuc] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BanTrangSuc] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BanTrangSuc', N'ON'
GO
ALTER DATABASE [BanTrangSuc] SET QUERY_STORE = OFF
GO
USE [BanTrangSuc]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/19/2021 8:23:24 PM ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 3/19/2021 8:23:24 PM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 3/19/2021 8:23:24 PM ******/
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
/****** Object:  Table [dbo].[FAQ]    Script Date: 3/19/2021 8:23:24 PM ******/
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
/****** Object:  Table [dbo].[Import]    Script Date: 3/19/2021 8:23:24 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 3/19/2021 8:23:24 PM ******/
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
/****** Object:  Table [dbo].[Order_detail]    Script Date: 3/19/2021 8:23:24 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 3/19/2021 8:23:24 PM ******/
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
/****** Object:  Table [dbo].[ProductionCompany]    Script Date: 3/19/2021 8:23:24 PM ******/
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

INSERT [dbo].[Category] ([id], [code], [name], [slug], [description], [created_at]) VALUES (15, N'Charms', N'Charms', NULL, N'Charms', CAST(N'2021-03-13T15:55:51.843' AS DateTime))
INSERT [dbo].[Category] ([id], [code], [name], [slug], [description], [created_at]) VALUES (16, N'Bracelets', N'Bracelets', NULL, N'Bracelets', CAST(N'2021-03-13T15:56:04.783' AS DateTime))
INSERT [dbo].[Category] ([id], [code], [name], [slug], [description], [created_at]) VALUES (17, N'Rings', N'Rings', NULL, N'Rings', CAST(N'2021-03-13T15:56:15.800' AS DateTime))
INSERT [dbo].[Category] ([id], [code], [name], [slug], [description], [created_at]) VALUES (18, N'Necklaces', N'Necklaces', NULL, N'Necklaces', CAST(N'2021-03-13T15:56:46.463' AS DateTime))
INSERT [dbo].[Category] ([id], [code], [name], [slug], [description], [created_at]) VALUES (19, N'Earrings', N'Earrings', NULL, N'Earrings', CAST(N'2021-03-13T15:57:00.030' AS DateTime))
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

INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (48, 46, 1, 100, 20, CAST(N'2021-03-13T16:36:07.263' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (49, 47, 2, 100, 20, CAST(N'2021-03-13T16:36:44.853' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (50, 48, 3, 100, 20, CAST(N'2021-03-13T16:37:00.043' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (51, 49, 4, 100, 20, CAST(N'2021-03-13T16:37:12.170' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (52, 50, 5, 100, 20, CAST(N'2021-03-13T16:37:21.900' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (53, 51, 1, 100, 20, CAST(N'2021-03-13T16:37:29.963' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (54, 51, 5, 100, 20, CAST(N'2021-03-13T16:37:41.417' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (55, 52, 1, 100, 20, CAST(N'2021-03-13T16:38:02.740' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (56, 53, 4, 100, 20, CAST(N'2021-03-13T16:38:41.853' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (57, 54, 5, 100, 20, CAST(N'2021-03-13T16:38:49.397' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (58, 55, 4, 100, 20, CAST(N'2021-03-13T16:38:57.220' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (59, 56, 2, 100, 20, CAST(N'2021-03-13T16:39:14.707' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (60, 57, 1, 100, 20, CAST(N'2021-03-13T16:39:22.917' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (61, 58, 1, 100, 20, CAST(N'2021-03-13T16:39:36.057' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (62, 59, 1, 100, 20, CAST(N'2021-03-13T16:39:43.963' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (63, 60, 2, 100, 20, CAST(N'2021-03-13T16:39:53.357' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (64, 61, 2, 100, 20, CAST(N'2021-03-13T16:40:01.660' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (65, 62, 2, 100, 20, CAST(N'2021-03-13T16:40:21.630' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (66, 63, 3, 100, 20, CAST(N'2021-03-13T16:40:30.943' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (67, 64, 3, 100, 20, CAST(N'2021-03-13T16:40:37.523' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (68, 65, 3, 100, 20, CAST(N'2021-03-13T16:40:55.770' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (69, 66, 4, 100, 20, CAST(N'2021-03-13T16:41:07.730' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (70, 67, 4, 100, 20, CAST(N'2021-03-13T16:41:19.180' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (71, 68, 4, 100, 20, CAST(N'2021-03-13T16:41:26.883' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (72, 69, 4, 100, 20, CAST(N'2021-03-13T16:41:34.540' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (73, 70, 5, 100, 20, CAST(N'2021-03-13T16:41:43.470' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (74, 71, 5, 100, 20, CAST(N'2021-03-13T16:41:53.583' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (75, 72, 5, 100, 20, CAST(N'2021-03-13T16:42:05.673' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (76, 73, 5, 100, 20, CAST(N'2021-03-13T16:42:13.017' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (77, 74, 5, 100, 20, CAST(N'2021-03-13T16:42:23.830' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (78, 75, 2, 100, 20, CAST(N'2021-03-13T16:42:34.460' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (79, 46, 4, 100, 10, CAST(N'2021-03-15T20:29:00.367' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (80, 48, 1, 100, 10, CAST(N'2021-03-15T20:29:24.560' AS DateTime))
SET IDENTITY_INSERT [dbo].[Import] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10027, N'Nguyen Hoang Hiep', 7, N'kham thien 2', N'0868814474', N'thang2@gmail.com', 400, NULL, NULL, CAST(N'2021-03-13T16:52:00.493' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10028, N'Nguyen Hoang Hiep', 7, N'kham thien 2', N'0868814474', N'thang2@gmail.com', 1200, NULL, NULL, CAST(N'2021-03-13T16:52:30.133' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10029, N'Nguyen Dinh Thinh', 8, N'Kham Thien Dong Da', N'33333333333', N'thang3@gmail.com', 400, NULL, NULL, CAST(N'2021-03-13T16:52:57.557' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10030, N'Do Viet Anh', 9, N'Kham Thien Dong Da', N'4444444444', N'thang4@gmail.com', 1600, NULL, NULL, CAST(N'2021-03-15T09:20:04.077' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10031, N'Cao Minh Duc', 10, N'Duy Tan,Cau Giay', N'55555555', N'thang5@gmail.com', 800, NULL, NULL, CAST(N'2021-03-15T09:21:29.047' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10032, N'Do Tien Thanh', 11, N'Dai Mo,Ha Dong', N'666666666', N'thang6@gmail.com', 1000, NULL, NULL, CAST(N'2021-03-15T09:22:41.653' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10033, N'Nguyen Hoang Hiep', 7, N'kham thien 2', N'0868814474', N'thang2@gmail.com', 600, NULL, NULL, CAST(N'2021-03-15T09:45:08.653' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10034, N'Nguyen Dinh Thinh', 8, N'Kham Thien Dong Da', N'33333333333', N'thang3@gmail.com', 200, NULL, NULL, CAST(N'2021-03-15T09:49:49.587' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10035, N'Cao Minh Duc', 10, N'Duy Tan,Cau Giay', N'55555555', N'thang5@gmail.com', 800, NULL, NULL, CAST(N'2021-03-15T10:00:40.490' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10036, N'Nguyen Hoang Hiep', 7, N'kham thien 2', N'0868814474', N'thang2@gmail.com', 800, NULL, NULL, CAST(N'2021-03-17T20:35:34.133' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10037, N'Nguyen Dinh Thinh', 8, N'Kham Thien Dong Da', N'33333333333', N'thang3@gmail.com', 600, NULL, NULL, CAST(N'2021-03-17T20:36:03.817' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10038, N'Do Viet Anh', 9, N'Kham Thien Dong Da', N'4444444444', N'thang4@gmail.com', 1000, NULL, NULL, CAST(N'2021-03-17T20:36:55.473' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10039, N'Do Tien Thanh', 11, N'Dai Mo,Ha Dong', N'666666666', N'thang6@gmail.com', 600, NULL, NULL, CAST(N'2021-03-17T20:37:16.033' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10040, N'Cao Minh Duc', 10, N'Duy Tan,Cau Giay', N'55555555', N'thang5@gmail.com', 400, NULL, NULL, CAST(N'2021-03-17T20:37:38.970' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_detail] ON 

INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10050, 10027, 75, 1, 200, CAST(N'2021-03-13T16:52:00.493' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10051, 10027, 48, 1, 200, CAST(N'2021-03-13T16:52:00.493' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10052, 10028, 75, 2, 400, CAST(N'2021-03-13T16:52:30.133' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10053, 10028, 48, 1, 200, CAST(N'2021-03-13T16:52:30.133' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10054, 10028, 65, 1, 200, CAST(N'2021-03-13T16:52:30.133' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10055, 10028, 52, 1, 200, CAST(N'2021-03-13T16:52:30.133' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10056, 10028, 47, 1, 200, CAST(N'2021-03-13T16:52:30.133' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10057, 10029, 68, 1, 200, CAST(N'2021-03-13T16:52:57.557' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10058, 10029, 70, 1, 200, CAST(N'2021-03-13T16:52:57.557' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10059, 10030, 68, 2, 400, CAST(N'2021-03-15T09:20:04.077' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10060, 10030, 49, 2, 400, CAST(N'2021-03-15T09:20:04.077' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10061, 10030, 61, 2, 400, CAST(N'2021-03-15T09:20:04.077' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10062, 10030, 59, 2, 400, CAST(N'2021-03-15T09:20:04.077' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10063, 10031, 46, 1, 200, CAST(N'2021-03-15T09:21:29.047' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10064, 10031, 54, 1, 200, CAST(N'2021-03-15T09:21:29.047' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10065, 10031, 68, 1, 200, CAST(N'2021-03-15T09:21:29.047' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10066, 10031, 74, 1, 200, CAST(N'2021-03-15T09:21:29.047' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10067, 10032, 75, 2, 400, CAST(N'2021-03-15T09:22:41.653' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10068, 10032, 66, 2, 400, CAST(N'2021-03-15T09:22:41.653' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10069, 10032, 61, 1, 200, CAST(N'2021-03-15T09:22:41.653' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10070, 10033, 75, 1, 200, CAST(N'2021-03-15T09:45:08.787' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10071, 10033, 74, 2, 400, CAST(N'2021-03-15T09:45:08.807' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10072, 10034, 75, 1, 200, CAST(N'2021-03-15T09:49:49.713' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10073, 10035, 70, 2, 400, CAST(N'2021-03-15T10:00:40.620' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10074, 10035, 68, 2, 400, CAST(N'2021-03-15T10:00:40.640' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10075, 10036, 69, 1, 200, CAST(N'2021-03-17T20:35:34.277' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10076, 10036, 55, 1, 200, CAST(N'2021-03-17T20:35:34.297' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10077, 10036, 48, 1, 200, CAST(N'2021-03-17T20:35:34.303' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10078, 10036, 73, 1, 200, CAST(N'2021-03-17T20:35:34.303' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10079, 10037, 47, 1, 200, CAST(N'2021-03-17T20:36:03.827' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10080, 10037, 72, 1, 200, CAST(N'2021-03-17T20:36:03.833' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10081, 10037, 75, 1, 200, CAST(N'2021-03-17T20:36:03.837' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10082, 10038, 62, 1, 200, CAST(N'2021-03-17T20:36:55.483' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10083, 10038, 61, 1, 200, CAST(N'2021-03-17T20:36:55.490' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10084, 10038, 66, 1, 200, CAST(N'2021-03-17T20:36:55.493' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10085, 10038, 47, 1, 200, CAST(N'2021-03-17T20:36:55.493' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10086, 10038, 69, 1, 200, CAST(N'2021-03-17T20:36:55.497' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10087, 10039, 58, 3, 600, CAST(N'2021-03-17T20:37:16.040' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10088, 10040, 70, 1, 200, CAST(N'2021-03-17T20:37:38.973' AS DateTime))
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10089, 10040, 49, 1, 200, CAST(N'2021-03-17T20:37:38.977' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (46, N'C1', 15, N'Firely Dango Charms', NULL, NULL, N'798772C02_RGB.jpg', NULL, NULL, NULL, 200, 29, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:06:52.647' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (47, N'C2', 15, N'Blue Daisy Charm', NULL, NULL, N'799341C01_RGB.jpg', NULL, NULL, NULL, 200, 17, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:07:41.067' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (48, N'C3', 15, N'Rainbow Bruno Charm', NULL, NULL, N'799353C01_RGB.jpg', NULL, NULL, NULL, 200, 27, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:08:20.253' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (49, N'C4', 15, N'Disney Alice Charm', NULL, NULL, N'799345C01_RGB.jpg', NULL, NULL, NULL, 200, 17, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:09:03.317' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (50, N'C5', 15, N'Openwork Charm', NULL, NULL, N'799352C01_RGB.jpg', NULL, NULL, NULL, 200, 20, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:09:39.363' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (51, N'C6', 15, N'Triple Cross Heart Charm', NULL, NULL, N'799354C01_RGB.jpg', NULL, NULL, NULL, 200, 40, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:10:07.373' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (52, N'B1', 16, N'Silver Snake Bracelet', NULL, NULL, N'599338C00_RGB.jpg', NULL, NULL, NULL, 200, 19, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:11:23.933' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (53, N'B2', 16, N'Gold Snake Bracelet', NULL, NULL, N'589338C00_RGB.jpg', NULL, NULL, NULL, 200, 20, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:11:50.283' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (54, N'B3', 16, N'Red Woven Bracelet', NULL, NULL, N'568777C01-S_RGB.jpg', NULL, NULL, NULL, 200, 19, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:12:26.387' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (55, N'B4', 16, N'Pink Swirl Bracelet', NULL, NULL, N'589287C01_RGB.jpg', NULL, NULL, NULL, 200, 19, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:13:05.513' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (56, N'B5', 16, N'Long Reflexions Bracelet', NULL, NULL, N'589358C01_RGB.jpg', NULL, NULL, NULL, 200, 20, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:13:44.000' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (57, N'B6', 16, N'Two-tone Barel Bracelet', NULL, NULL, N'599347C00_RGB.jpg', NULL, NULL, NULL, 200, 20, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:14:29.780' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (58, N'R1', 17, N'Daisy Flower Ring', NULL, NULL, N'198799C01_RGB.jpg', NULL, NULL, NULL, 200, 17, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:15:15.877' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (59, N'R2', 17, N'Daisy Flower Gold Ring', NULL, NULL, N'188799C01_RGB.jpg', NULL, NULL, NULL, 200, 18, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:16:05.810' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (60, N'R3', 17, N'Daisy Trio Ring', NULL, NULL, N'188792C01_RGB.jpg', NULL, NULL, NULL, 200, 20, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:16:41.000' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (61, N'R4', 17, N'Wishbone Ring', NULL, NULL, N'197736CZ_RGB.jpg', NULL, NULL, NULL, 200, 16, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:17:12.027' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (62, N'R5', 17, N'Crown Solirarie Ring', NULL, NULL, N'188289C01_RGB.jpg', NULL, NULL, NULL, 200, 19, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:17:45.643' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (63, N'R6', 17, N'Square Halo Ring', NULL, NULL, N'198863C01_RGB.jpg', NULL, NULL, NULL, 200, 20, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:18:18.000' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (64, N'N1', 18, N'Heart Stone Necklace', NULL, NULL, N'399232C01_RGB.jpg', NULL, NULL, NULL, 200, 20, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:18:45.380' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (65, N'N2', 18, N'Rolo Chain Necklace', NULL, NULL, N'399260C00_RGB.jpg', NULL, NULL, NULL, 200, 19, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:19:25.117' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (66, N'N3', 18, N'Heart Tree Necklace', NULL, NULL, N'399261C01_RGB.jpg', NULL, NULL, NULL, 200, 17, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:19:54.667' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (67, N'N4', 18, N'Wishbone Heart Necklace', NULL, NULL, N'399273C01_RGB.jpg', NULL, NULL, NULL, 200, 20, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:20:24.603' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (68, N'N5', 18, N'Key Chain Necklace', NULL, NULL, N'399339C01_RGB.jpg', NULL, NULL, NULL, 200, 14, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:20:51.233' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (69, N'N6', 18, N'Daisy Flower Necklace', NULL, NULL, N'NAMB8056-PNG.jpg', NULL, NULL, NULL, 200, 18, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:21:17.923' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (70, N'E1', 19, N'Heart Stud Earring', NULL, NULL, N'288427C01_RGB.jpg', NULL, NULL, NULL, 200, 16, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:22:12.473' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (71, N'E2', 19, N'Huggie Hoop Earring', NULL, NULL, N'289304C02_RGB.jpg', NULL, NULL, NULL, 200, 20, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:22:42.787' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (72, N'E3', 19, N'Pink Swirl Earring', NULL, NULL, N'289304C03_RGB.jpg', NULL, NULL, NULL, 200, 19, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:23:36.363' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (73, N'E4', 19, N'Star Flower Earring', NULL, NULL, N'299239C01_RGB.jpg', NULL, NULL, NULL, 200, 19, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:24:10.123' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (74, N'E5', 19, N'Mickey Heart Earring', NULL, NULL, N'299258C01_RGB.jpg', NULL, NULL, NULL, 200, 17, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:24:38.947' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (75, N'E6', 19, N'Two-tone Stud Earring', NULL, NULL, N'299349C00_RGB.jpg', NULL, NULL, NULL, 200, 12, NULL, NULL, 1, 1, CAST(N'2021-03-13T16:25:09.290' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductionCompany] ON 

INSERT [dbo].[ProductionCompany] ([id], [name], [email], [address], [phone]) VALUES (1, N'Restoration Soft', N'restoration@gmail.com', N'858  Hickory Heights Drive,Baltimore', N'4402424926')
INSERT [dbo].[ProductionCompany] ([id], [name], [email], [address], [phone]) VALUES (2, N'Roche Bobois', N'roche@gmail.com', N'3935  Sycamore Circle,Cleburne', N'6822029377')
INSERT [dbo].[ProductionCompany] ([id], [name], [email], [address], [phone]) VALUES (3, N'Edra', N'edra@gmail.com', N'3241  Birch  Street,El Paso', N'9159834303')
INSERT [dbo].[ProductionCompany] ([id], [name], [email], [address], [phone]) VALUES (4, N'Poliform', N'poliform@gmail.com', N'669  Robinson Court,Mount Pleasant', N'56888124')
INSERT [dbo].[ProductionCompany] ([id], [name], [email], [address], [phone]) VALUES (5, N'Christopher Guy', N'christphe.guy@gmail.com', N'4550  Derek Drive,Youngstown', N'995215542')
SET IDENTITY_INSERT [dbo].[ProductionCompany] OFF
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_is_admin]  DEFAULT ((0)) FOR [is_admin]
GO
ALTER TABLE [dbo].[Import] ADD  CONSTRAINT [DF_Import_created_at]  DEFAULT (getdate()) FOR [created_at]
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
ALTER DATABASE [BanTrangSuc] SET  READ_WRITE 
GO
