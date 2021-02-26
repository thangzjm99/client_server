USE [master]
GO
/****** Object:  Database [BanDoNoiThat]    Script Date: 2/26/2021 12:32:12 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 2/26/2021 12:32:12 PM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 2/26/2021 12:32:12 PM ******/
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
/****** Object:  Table [dbo].[Import]    Script Date: 2/26/2021 12:32:12 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 2/26/2021 12:32:12 PM ******/
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
/****** Object:  Table [dbo].[Order_detail]    Script Date: 2/26/2021 12:32:12 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 2/26/2021 12:32:12 PM ******/
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
/****** Object:  Table [dbo].[ProductionCompany]    Script Date: 2/26/2021 12:32:12 PM ******/
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

INSERT [dbo].[Category] ([id], [code], [name], [slug], [description], [created_at]) VALUES (9, N'9', N'Beds', NULL, N'Beds', CAST(N'1900-01-01T00:00:06.670' AS DateTime))
INSERT [dbo].[Category] ([id], [code], [name], [slug], [description], [created_at]) VALUES (10, N'10', N'Sofa', NULL, N'Sofa', CAST(N'1900-01-01T00:00:06.677' AS DateTime))
INSERT [dbo].[Category] ([id], [code], [name], [slug], [description], [created_at]) VALUES (12, N'13', N'quoc thang', NULL, NULL, CAST(N'2021-02-25T22:59:44.953' AS DateTime))
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([id], [name], [phone], [address], [membership], [email], [created_at], [username], [password], [status], [is_admin]) VALUES (1, N'Quoc thang', N'12345789', N'ha noi', NULL, N'thangzjm99@gmail.com', CAST(N'2020-06-13T22:39:56.000' AS DateTime), N'thang9923', N'thang123', 1, NULL)
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [membership], [email], [created_at], [username], [password], [status], [is_admin]) VALUES (2, N'Quoc thang', N'12345789', N'ha noi', NULL, N'thangzjm999@gmail.com', CAST(N'2020-06-13T22:40:23.000' AS DateTime), N'adminxxx', N'123123', 1, NULL)
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [membership], [email], [created_at], [username], [password], [status], [is_admin]) VALUES (4, N'quoc thang', N'1233213', N'ha noi', NULL, N'thangzjm2@gmail.com', NULL, N'thang123', N'admin', 1, 1)
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [membership], [email], [created_at], [username], [password], [status], [is_admin]) VALUES (5, N'admin', N'0868814474', N'admin', NULL, N'admin@gmail.com', CAST(N'2021-02-25T14:23:02.567' AS DateTime), N'admin', N'21232f297a57a5a743894a0e4a801fc3', 1, 1)
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [membership], [email], [created_at], [username], [password], [status], [is_admin]) VALUES (6, N'quoc thang', N'0868814474', N'kham thien ', NULL, N'thangzjm199@gmail.com', CAST(N'2021-02-25T14:24:25.467' AS DateTime), N'thang1234', N'202cb962ac59075b964b07152d234b70', 1, NULL)
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [membership], [email], [created_at], [username], [password], [status], [is_admin]) VALUES (7, N'quoc thang', N'0868814474', N'kham thien 2', NULL, N'thang2@gmail.com', CAST(N'2021-02-25T14:39:05.553' AS DateTime), N'thang2', N'202cb962ac59075b964b07152d234b70', 1, NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Import] ON 

INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (9, 17, 2, 100, 2, CAST(N'2021-02-26T09:22:59.673' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (10, 16, 1, 600, 8, CAST(N'2021-02-26T09:26:09.983' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (11, 18, 1, 100, 5, CAST(N'2021-02-26T09:29:30.267' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (12, 16, 1, 600, -13, CAST(N'2021-02-26T09:30:02.010' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (13, 16, 1, 150, 5, CAST(N'2021-02-26T09:30:18.587' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (14, 17, 1, 100, 10, CAST(N'2021-02-26T11:03:52.463' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (15, 18, 1, 100, 10, CAST(N'2021-02-26T11:03:58.973' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (16, 19, 1, 100, 10, CAST(N'2021-02-26T11:04:08.670' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (17, 20, 1, 100, 10, CAST(N'2021-02-26T11:04:19.137' AS DateTime))
INSERT [dbo].[Import] ([id], [id_product], [id_productionCompany], [import_price], [quantity], [created_at]) VALUES (18, 21, 1, 100, 10, CAST(N'2021-02-26T11:04:28.767' AS DateTime))
SET IDENTITY_INSERT [dbo].[Import] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10012, N'Dinh Quoc Thang', NULL, N'47 Kham Thien', N'12346789', N'thangzjm2504@gmail.com', 800, NULL, NULL, CAST(N'2021-02-21T10:39:20.497' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10013, N'quoc thang', 7, N'kham thien 2', N'0868814474', N'thang2@gmail.com', 900, NULL, NULL, CAST(N'2021-02-25T14:39:49.037' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10014, N'Do viet Anh', NULL, N'ha noi', N'23123124123', N'thangzjm99@gmail.com', 800, NULL, NULL, CAST(N'2021-02-26T11:08:45.553' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10015, N'Do viet Anh', NULL, N'bach mai', N'23123124123', N'thangzjm99@gmail.com', 4100, NULL, NULL, CAST(N'2021-02-26T11:10:01.013' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10016, N'Dinh quoc thang', NULL, N'123123', N'1231313', N'thangzjm2504@gmail.com', 4100, NULL, NULL, CAST(N'2021-02-26T11:10:57.670' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10017, N'Dinh quoc thang', NULL, N'13123123', N'23123124123', N'thangzjm2504@gmail.com', 600, NULL, NULL, CAST(N'2021-02-26T11:16:29.753' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10018, N'Dinh quoc thang', NULL, N'ha noi', N'23123124123', N'thangzjm99@gmail.com', 600, NULL, NULL, CAST(N'2021-02-26T11:17:35.927' AS DateTime))
INSERT [dbo].[Order] ([id], [customer_name], [id_customer], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10019, N'quoc thang', 6, N'kham thien ', N'0868814474', N'thangzjm199@gmail.com', 500, NULL, NULL, CAST(N'2021-02-26T12:29:06.580' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_detail] ON 

INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (1, NULL, NULL, 2, 100, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (2, NULL, NULL, 2, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (3, NULL, NULL, 1, 100, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (4, NULL, NULL, 1, 100, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (5, NULL, NULL, 1, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (6, NULL, NULL, 2, 100, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (7, NULL, NULL, 2, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (8, NULL, NULL, 1, 100, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (9, NULL, NULL, 4, 100, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10, NULL, NULL, 2, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (11, NULL, NULL, 1, 100, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (12, NULL, NULL, 1, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (13, NULL, NULL, 1, 100, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (14, NULL, NULL, 1, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (15, NULL, NULL, 1, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (16, NULL, NULL, 3, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (17, NULL, NULL, 1, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10017, NULL, NULL, 4, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10018, 10012, 16, 3, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10019, 10012, 18, 2, 100, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10020, 10013, 17, 1, 300, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10021, 10013, 21, 3, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10022, 10014, 17, 2, 300, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10023, 10014, 20, 2, 100, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10024, 10017, 16, 2, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10025, 10017, 18, 2, 100, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10026, 10018, 16, 2, 200, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10027, 10018, 20, 2, 100, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10028, 10019, 17, 1, 300, NULL)
INSERT [dbo].[Order_detail] ([id], [order_id], [product_id], [amount], [total_price], [created_at]) VALUES (10029, 10019, 21, 1, 200, NULL)
SET IDENTITY_INSERT [dbo].[Order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (16, N'14', 9, N'Baltoro high gloss', NULL, NULL, N'Baltoro_High_Gloss_Hydraulic_Storage_Bed_Queen_LP.jpg', NULL, NULL, NULL, 200, 3, NULL, NULL, 1, 1, CAST(N'2021-02-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (17, N'15', 9, N'Duetto Platform', NULL, NULL, N'Duetto_Platform_Bed_LP.jpg', NULL, NULL, NULL, 300, 9, NULL, NULL, 1, 1, CAST(N'2021-02-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (18, N'16', 10, N'Oxford Sofa', NULL, NULL, N'Oxford_Sofa_FNSF51ODCO30R00SAAAA.jpg', NULL, NULL, NULL, 100, 15, NULL, NULL, 1, 1, CAST(N'2021-02-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (19, N'17', 10, N'Dark Green Sofa', NULL, NULL, N'FNSF51ABMB3_-_main_1.jpg', NULL, NULL, NULL, 150, 10, NULL, NULL, 1, 1, CAST(N'2021-02-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (20, N'18', 10, N'Gray Sofa ', NULL, NULL, N'FNSF51EAGY3_-_main_1.png', NULL, NULL, NULL, 100, 8, NULL, NULL, 1, 1, CAST(N'2021-02-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [id_category], [name], [slug], [overview], [image], [description], [detail], [unit], [price], [remain_quantity], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (21, N'13', 9, N'Aspen Merch LP', NULL, NULL, N'Aspen_Merch_LP.jpg', NULL, NULL, NULL, 200, 9, NULL, NULL, 1, 1, CAST(N'2021-02-21T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductionCompany] ON 

INSERT [dbo].[ProductionCompany] ([id], [name], [email], [address], [phone]) VALUES (1, N'Nha cung cap Xuan Thanh', N'xuanthanh@gmail.com', N'bach mai', N'1234456')
INSERT [dbo].[ProductionCompany] ([id], [name], [email], [address], [phone]) VALUES (2, N'Nha cung cap Thanh Do', N'thangzjm99@gmail.com', N'kham thien', N'8888')
INSERT [dbo].[ProductionCompany] ([id], [name], [email], [address], [phone]) VALUES (3, N'Nha cung cap Thien Hung', N'ThienHung@gmail.com', N'kham thien', N'0868814474')
INSERT [dbo].[ProductionCompany] ([id], [name], [email], [address], [phone]) VALUES (4, N'quoc thang', N'thangzjm99@gmail.com', N'ha noi', N'0868814474')
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
ALTER DATABASE [BanDoNoiThat] SET  READ_WRITE 
GO
