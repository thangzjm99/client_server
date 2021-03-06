USE [master]
GO
/****** Object:  Database [BanHangDienTu]    Script Date: 2/23/2021 4:28:20 PM ******/
CREATE DATABASE [BanHangDienTu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BanHangDienTu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BanHangDienTu.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BanHangDienTu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BanHangDienTu_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BanHangDienTu] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BanHangDienTu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BanHangDienTu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BanHangDienTu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BanHangDienTu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BanHangDienTu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BanHangDienTu] SET ARITHABORT OFF 
GO
ALTER DATABASE [BanHangDienTu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BanHangDienTu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BanHangDienTu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BanHangDienTu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BanHangDienTu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BanHangDienTu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BanHangDienTu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BanHangDienTu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BanHangDienTu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BanHangDienTu] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BanHangDienTu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BanHangDienTu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BanHangDienTu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BanHangDienTu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BanHangDienTu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BanHangDienTu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BanHangDienTu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BanHangDienTu] SET RECOVERY FULL 
GO
ALTER DATABASE [BanHangDienTu] SET  MULTI_USER 
GO
ALTER DATABASE [BanHangDienTu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BanHangDienTu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BanHangDienTu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BanHangDienTu] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BanHangDienTu] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BanHangDienTu', N'ON'
GO
ALTER DATABASE [BanHangDienTu] SET QUERY_STORE = OFF
GO
USE [BanHangDienTu]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 2/23/2021 4:28:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [text] NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/23/2021 4:28:21 PM ******/
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
	[created_at] [timestamp] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2/23/2021 4:28:21 PM ******/
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
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQ]    Script Date: 2/23/2021 4:28:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQ](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[question] [varchar](255) NULL,
	[answer] [varchar](255) NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_FAQ] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2/23/2021 4:28:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [varchar](255) NULL,
	[customer_id] [bigint] NULL,
	[staff_id] [bigint] NULL,
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
/****** Object:  Table [dbo].[Order_detail]    Script Date: 2/23/2021 4:28:21 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 2/23/2021 4:28:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [varchar](10) NULL,
	[category_id] [bigint] NULL,
	[name] [varchar](255) NULL,
	[slug] [varchar](255) NULL,
	[overview] [varchar](255) NULL,
	[image] [text] NULL,
	[description] [varchar](255) NULL,
	[detail] [varchar](255) NULL,
	[price] [float] NULL,
	[unit] [varchar](255) NULL,
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
/****** Object:  Table [dbo].[Slider]    Script Date: 2/23/2021 4:28:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [text] NULL,
	[created_at] [timestamp] NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 2/23/2021 4:28:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[address] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[created_at] [timestamp] NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [code], [name], [slug], [description]) VALUES (9, N'9', N'Beds', NULL, N'Beds')
INSERT [dbo].[Category] ([id], [code], [name], [slug], [description]) VALUES (10, N'10', N'Sofa', NULL, N'Sofa')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([id], [name], [phone], [address], [membership], [email], [created_at], [username], [password], [status]) VALUES (1, N'Quoc thang', N'12345789', N'ha noi', NULL, N'thangzjm99@gmail.com', CAST(N'2020-06-13T22:39:56.000' AS DateTime), N'thang9923', N'thang123', 1)
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [membership], [email], [created_at], [username], [password], [status]) VALUES (2, N'Quoc thang', N'12345789', N'ha noi', NULL, N'thangzjm999@gmail.com', CAST(N'2020-06-13T22:40:23.000' AS DateTime), N'adminxxx', N'123123', 1)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [code], [customer_id], [staff_id], [address], [phone], [email], [total_price], [note], [status], [created_at]) VALUES (10012, N'Dinh Quoc Thang', NULL, NULL, N'47 Kham Thien', N'12346789', N'thangzjm2504@gmail.com', 800, NULL, NULL, CAST(N'2021-02-21T10:39:20.497' AS DateTime))
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
SET IDENTITY_INSERT [dbo].[Order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [code], [category_id], [name], [slug], [overview], [image], [description], [detail], [price], [unit], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (16, N'14', 9, N'Baltoro high gloss', NULL, NULL, N'Baltoro_High_Gloss_Hydraulic_Storage_Bed_Queen_LP.jpg', NULL, NULL, 200, NULL, NULL, NULL, 1, 1, CAST(N'2021-02-21T10:30:08.000' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [category_id], [name], [slug], [overview], [image], [description], [detail], [price], [unit], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (17, N'15', 9, N'Duetto Platform', NULL, NULL, N'Duetto_Platform_Bed_LP.jpg', NULL, NULL, 300, NULL, NULL, NULL, 1, 1, CAST(N'2021-02-21T10:32:28.000' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [category_id], [name], [slug], [overview], [image], [description], [detail], [price], [unit], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (18, N'16', 10, N'Oxford Sofa', NULL, NULL, N'Oxford_Sofa_FNSF51ODCO30R00SAAAA.jpg', NULL, NULL, 100, NULL, NULL, NULL, 1, 1, CAST(N'2021-02-21T10:33:23.000' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [category_id], [name], [slug], [overview], [image], [description], [detail], [price], [unit], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (19, N'17', 10, N'Dark Green Sofa', NULL, NULL, N'FNSF51ABMB3_-_main_1.jpg', NULL, NULL, 150, NULL, NULL, NULL, 1, 1, CAST(N'2021-02-21T10:34:46.000' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [category_id], [name], [slug], [overview], [image], [description], [detail], [price], [unit], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (20, N'18', 10, N'Gray Sofa ', NULL, NULL, N'FNSF51EAGY3_-_main_1.png', NULL, NULL, 100, NULL, NULL, NULL, 1, 1, CAST(N'2021-02-21T10:35:28.000' AS DateTime))
INSERT [dbo].[Product] ([id], [code], [category_id], [name], [slug], [overview], [image], [description], [detail], [price], [unit], [sale], [star], [is_stock], [is_active], [created_at]) VALUES (21, N'13', 9, N'Aspen Merch LP', NULL, NULL, N'Aspen_Merch_LP.jpg', NULL, NULL, 200, NULL, NULL, NULL, 1, 1, CAST(N'2021-02-21T10:37:28.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Staff] FOREIGN KEY([staff_id])
REFERENCES [dbo].[Staff] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Staff]
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
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [BanHangDienTu] SET  READ_WRITE 
GO
