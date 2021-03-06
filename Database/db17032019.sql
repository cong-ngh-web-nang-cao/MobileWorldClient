USE [master]
GO
/****** Object:  Database [MobileWorld]    Script Date: 17/03/2019 06:01:42 PM ******/
CREATE DATABASE [MobileWorld]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MobileWorld', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MobileWorld.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MobileWorld_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MobileWorld_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MobileWorld] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MobileWorld].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MobileWorld] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MobileWorld] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MobileWorld] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MobileWorld] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MobileWorld] SET ARITHABORT OFF 
GO
ALTER DATABASE [MobileWorld] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MobileWorld] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MobileWorld] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MobileWorld] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MobileWorld] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MobileWorld] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MobileWorld] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MobileWorld] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MobileWorld] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MobileWorld] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MobileWorld] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MobileWorld] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MobileWorld] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MobileWorld] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MobileWorld] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MobileWorld] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MobileWorld] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MobileWorld] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MobileWorld] SET  MULTI_USER 
GO
ALTER DATABASE [MobileWorld] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MobileWorld] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MobileWorld] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MobileWorld] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MobileWorld] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MobileWorld]
GO
/****** Object:  Table [dbo].[AnhSanPham]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AnhSanPham](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SanPham] [int] NULL,
	[Anh] [varchar](50) NULL,
 CONSTRAINT [PK_AnhSanPham\] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[DonHang] [int] NOT NULL,
	[SanPham] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[ThanhTien] [int] NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[DonHang] ASC,
	[SanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NULL,
 CONSTRAINT [PK_DanhMuc] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KhachHang] [int] NULL,
	[NguoiLap] [int] NULL,
	[NgayDat] [date] NULL,
	[NgayXuat] [date] NULL,
	[TenKH] [nvarchar](50) NULL,
	[DienThoai] [varchar](10) NULL,
	[Email] [varchar](50) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[TinhTrangDon] [int] NULL,
 CONSTRAINT [PK_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DienThoai] [varchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
	[Ten] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[DiaChi] [nvarchar](255) NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](100) NULL,
	[NgaySinh] [date] NULL,
	[DienThoai] [int] NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenNSX] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaSanXuat] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DanhMuc] [int] NULL,
	[NhaSanXuat] [int] NULL,
	[TenSP] [nvarchar](50) NULL,
	[Gia] [int] NULL,
	[CameraTruoc] [int] NULL,
	[CameraSau] [int] NULL,
	[ROM] [int] NULL,
	[RAM] [int] NULL,
	[TheNho] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[AnhSanPham] ON 

INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (1, 1, N'iphone7.1.jpg                            ')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (2, 1, N'iphone7.2.jpg   ')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (3, 1, N'iphone7.3.jpg   ')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (4, 2, N'iphone8.1.jpg   ')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (5, 2, N'iphone8.2.jpg   ')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (6, 2, N'iphone8.3.jpg   ')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (7, 3, N'iphone10.1.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (8, 3, N'iphone10.2.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (9, 3, N'iphone10.3.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (10, 4, N'iphoneXsMax.1.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (11, 4, N'iphoneXsMax.2.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (12, 4, N'iphoneXsMax.3.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (13, 5, N'iphoneXR.1.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (14, 5, N'iphoneXR.2.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (15, 5, N'iphoneXR.3.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (16, 6, N'ssgalaxyA9.1.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (17, 6, N'ssgalaxyA9.2.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (18, 6, N'ssgalaxyA9.3.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (19, 7, N'ssgalaxyS8.1.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (20, 7, N'ssgalaxyS8.2.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (21, 7, N'ssgalaxyS8.3.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (22, 8, N'ssgalaxyS9.1.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (23, 8, N'ssgalaxyS9.2.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (24, 8, N'ssgalaxyS9.3.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (25, 9, N'ssgalaxyS9.1.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (26, 9, N'ssgalaxyS9.2.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (27, 9, N'ssgalaxyS9.3.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (28, 10, N'ssgalaxyNote9.1.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (29, 10, N'ssgalaxyNote9.2.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (30, 10, N'ssgalaxyNote9.3.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (31, 11, N'ssgalaxyNote9.1.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (32, 11, N'ssgalaxyNote9.2.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (33, 11, N'ssgalaxyNote9.3.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (34, 12, N'mate20.1.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (35, 12, N'mate20.2.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (36, 12, N'mate20.3.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (37, 13, N'nova3.1.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (38, 13, N'nova3.2.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (39, 13, N'nova3.3.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (40, 14, N'y9.1.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (41, 14, N'y9.2.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (42, 14, N'y9.3.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (43, 15, N'ssgalaxyS10.1.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (44, 15, N'ssgalaxyS10.2.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (45, 15, N'ssgalaxyS10.3.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (46, 16, N'ssgalaxyS10plus.1.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (47, 16, N'ssgalaxyS10plus.2.jpg')
INSERT [dbo].[AnhSanPham] ([Id], [SanPham], [Anh]) VALUES (48, 16, N'ssgalaxyS10plus.3.jpg')
SET IDENTITY_INSERT [dbo].[AnhSanPham] OFF
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (1, 1, 2, 123)
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (4, 2, 1, 15000000)
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (4, 4, 2, 69980000)
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (5, 2, 1, 15000000)
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (5, 4, 1, 34990000)
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (6, 3, 2, 40000000)
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (6, 4, 1, 34990000)
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (7, 1, 1, 10000000)
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (7, 2, 1, 15000000)
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (8, 3, 1, 20000000)
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (9, 5, 1, 23490000)
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (22, 2, 1, 15000000)
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (22, 3, 1, 20000000)
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (22, 4, 1, 34990000)
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (23, 3, 2, 40000000)
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (23, 4, 3, 104970000)
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (24, 3, 1, 20000000)
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (24, 4, 1, 34990000)
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (25, 3, 1, 20000000)
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (25, 4, 2, 69980000)
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (29, 4, 1, 34990000)
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (30, 4, 1, 34990000)
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (31, 12, 1, 30000000)
INSERT [dbo].[ChiTietDonHang] ([DonHang], [SanPham], [SoLuong], [ThanhTien]) VALUES (31, 16, 1, 33990000)
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([Id], [TenDanhMuc]) VALUES (1, N'Điện Thoại')
INSERT [dbo].[DanhMuc] ([Id], [TenDanhMuc]) VALUES (2, N'Máy Tính Bảng')
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
SET IDENTITY_INSERT [dbo].[DonDatHang] ON 

INSERT [dbo].[DonDatHang] ([Id], [KhachHang], [NguoiLap], [NgayDat], [NgayXuat], [TenKH], [DienThoai], [Email], [DiaChi], [TinhTrangDon]) VALUES (1, NULL, NULL, CAST(N'2019-02-28' AS Date), NULL, N'Vũ Mạnh Tuấn', N'123456789', N'manhtuanst04@gmail.com', N'Hà Nội', NULL)
INSERT [dbo].[DonDatHang] ([Id], [KhachHang], [NguoiLap], [NgayDat], [NgayXuat], [TenKH], [DienThoai], [Email], [DiaChi], [TinhTrangDon]) VALUES (4, NULL, NULL, CAST(N'2019-02-28' AS Date), NULL, N'Vũ Tuấn', N'Vu Tu?n', N'Vu Tu?n', N'Vũ Tuấn', NULL)
INSERT [dbo].[DonDatHang] ([Id], [KhachHang], [NguoiLap], [NgayDat], [NgayXuat], [TenKH], [DienThoai], [Email], [DiaChi], [TinhTrangDon]) VALUES (5, NULL, NULL, CAST(N'2019-02-28' AS Date), NULL, N'tuaan', N'12121212', N'tuan@gmail.com', N'HN', NULL)
INSERT [dbo].[DonDatHang] ([Id], [KhachHang], [NguoiLap], [NgayDat], [NgayXuat], [TenKH], [DienThoai], [Email], [DiaChi], [TinhTrangDon]) VALUES (6, 1, NULL, CAST(N'2019-02-28' AS Date), NULL, N'Vũ Mạnh Tuấn', N'0377560590', N'manhtuanst04@gmail.com', N'Bắc Từ Liêm - Hà Nội', 1)
INSERT [dbo].[DonDatHang] ([Id], [KhachHang], [NguoiLap], [NgayDat], [NgayXuat], [TenKH], [DienThoai], [Email], [DiaChi], [TinhTrangDon]) VALUES (7, 1, NULL, CAST(N'2019-02-28' AS Date), NULL, N'Vũ Mạnh Tuấn', N'0377560590', N'manhtuanst04@gmail.com', N'Bắc Từ Liêm - Hà Nội', NULL)
INSERT [dbo].[DonDatHang] ([Id], [KhachHang], [NguoiLap], [NgayDat], [NgayXuat], [TenKH], [DienThoai], [Email], [DiaChi], [TinhTrangDon]) VALUES (8, NULL, NULL, CAST(N'2019-02-28' AS Date), NULL, N'AAAA', N'2321321', N'dfsdfsd@sdfdsf.com', N'dfsdf dfgf fdgfd', NULL)
INSERT [dbo].[DonDatHang] ([Id], [KhachHang], [NguoiLap], [NgayDat], [NgayXuat], [TenKH], [DienThoai], [Email], [DiaChi], [TinhTrangDon]) VALUES (9, NULL, NULL, CAST(N'2019-03-01' AS Date), NULL, N'', N'', N'', N'', NULL)
INSERT [dbo].[DonDatHang] ([Id], [KhachHang], [NguoiLap], [NgayDat], [NgayXuat], [TenKH], [DienThoai], [Email], [DiaChi], [TinhTrangDon]) VALUES (22, 1, NULL, CAST(N'2019-03-02' AS Date), NULL, N'Vũ Mạnh Tuấn', N'0377560590', N'manhtuanst04@gmail.com', N'Số nhà 3 - Ngách 189/3 - Đường Cầu Diễn- Bắc Từ Liêm - Hà Nội', NULL)
INSERT [dbo].[DonDatHang] ([Id], [KhachHang], [NguoiLap], [NgayDat], [NgayXuat], [TenKH], [DienThoai], [Email], [DiaChi], [TinhTrangDon]) VALUES (23, 1, NULL, CAST(N'2019-03-02' AS Date), NULL, N'Vũ Mạnh Tuấn', N'0377560590', N'manhtuanst04@gmail.com', N'Số nhà 3 - Ngách 189/3 - Đường Cầu Diễn- Bắc Từ Liêm - Hà Nội', NULL)
INSERT [dbo].[DonDatHang] ([Id], [KhachHang], [NguoiLap], [NgayDat], [NgayXuat], [TenKH], [DienThoai], [Email], [DiaChi], [TinhTrangDon]) VALUES (24, NULL, NULL, CAST(N'2019-03-02' AS Date), NULL, N'abvc', N'23432432', N'fdsds', N'sdfdsfdsf', NULL)
INSERT [dbo].[DonDatHang] ([Id], [KhachHang], [NguoiLap], [NgayDat], [NgayXuat], [TenKH], [DienThoai], [Email], [DiaChi], [TinhTrangDon]) VALUES (25, 11, NULL, CAST(N'2019-03-02' AS Date), NULL, N'Mai Thị Lưn', N'999999999', N'mailinh@gmail.com', N'Hà Nội', NULL)
INSERT [dbo].[DonDatHang] ([Id], [KhachHang], [NguoiLap], [NgayDat], [NgayXuat], [TenKH], [DienThoai], [Email], [DiaChi], [TinhTrangDon]) VALUES (29, NULL, NULL, CAST(N'2019-03-04' AS Date), NULL, N'Nguyễn Đức Sơn', N'0123456789', N'sonseo@gmail.com', N'Ngõ 2 - Phạm Văn Đồng - Cầu Giấy - Hà Nội', NULL)
INSERT [dbo].[DonDatHang] ([Id], [KhachHang], [NguoiLap], [NgayDat], [NgayXuat], [TenKH], [DienThoai], [Email], [DiaChi], [TinhTrangDon]) VALUES (30, 11, NULL, CAST(N'2019-03-04' AS Date), NULL, N'Mai Thị Lưn', N'999999999', N'mailinh@gmail.com', N'Cầu Giấy - Hà Nội', NULL)
INSERT [dbo].[DonDatHang] ([Id], [KhachHang], [NguoiLap], [NgayDat], [NgayXuat], [TenKH], [DienThoai], [Email], [DiaChi], [TinhTrangDon]) VALUES (31, NULL, NULL, CAST(N'2019-03-04' AS Date), NULL, N'Ngô Thị Dung', N'12344321', N'dung@gmail.com', N'Ký túc xá Mỹ Đình', NULL)
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([Id], [DienThoai], [MatKhau], [Ten], [Email], [DiaChi]) VALUES (1, N'0377560590', N'1', N'Vũ Mạnh Tuấn', N'manhtuanst04@gmail.com', N'Số nhà 3 - Ngách 189/3 - Đường Cầu Diễn- Bắc Từ Liêm - Hà Nội')
INSERT [dbo].[NguoiDung] ([Id], [DienThoai], [MatKhau], [Ten], [Email], [DiaChi]) VALUES (11, N'999999999', N'1', N'Mai Thị Lưn', N'mailinh@gmail.com', N'Cầu Giấy - Hà Nội')
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
SET IDENTITY_INSERT [dbo].[NhaSanXuat] ON 

INSERT [dbo].[NhaSanXuat] ([Id], [TenNSX]) VALUES (1, N'SamSung')
INSERT [dbo].[NhaSanXuat] ([Id], [TenNSX]) VALUES (2, N'Apple')
INSERT [dbo].[NhaSanXuat] ([Id], [TenNSX]) VALUES (3, N'Xiaomi')
INSERT [dbo].[NhaSanXuat] ([Id], [TenNSX]) VALUES (4, N'Nokia')
INSERT [dbo].[NhaSanXuat] ([Id], [TenNSX]) VALUES (5, N'Oppo')
INSERT [dbo].[NhaSanXuat] ([Id], [TenNSX]) VALUES (6, N'Huawei')
INSERT [dbo].[NhaSanXuat] ([Id], [TenNSX]) VALUES (7, N'Asus')
INSERT [dbo].[NhaSanXuat] ([Id], [TenNSX]) VALUES (8, N'ViVo')
SET IDENTITY_INSERT [dbo].[NhaSanXuat] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([Id], [DanhMuc], [NhaSanXuat], [TenSP], [Gia], [CameraTruoc], [CameraSau], [ROM], [RAM], [TheNho]) VALUES (1, 1, 2, N'iPhone 7', 10000000, 5, 10, 64, 1, 0)
INSERT [dbo].[SanPham] ([Id], [DanhMuc], [NhaSanXuat], [TenSP], [Gia], [CameraTruoc], [CameraSau], [ROM], [RAM], [TheNho]) VALUES (2, 1, 2, N'iPhone 8', 15000000, 5, 12, 128, 2, 0)
INSERT [dbo].[SanPham] ([Id], [DanhMuc], [NhaSanXuat], [TenSP], [Gia], [CameraTruoc], [CameraSau], [ROM], [RAM], [TheNho]) VALUES (3, 1, 2, N'iPhone X', 20000000, 10, 15, 128, 2, 0)
INSERT [dbo].[SanPham] ([Id], [DanhMuc], [NhaSanXuat], [TenSP], [Gia], [CameraTruoc], [CameraSau], [ROM], [RAM], [TheNho]) VALUES (4, 1, 2, N'iPhone Xs Max', 34990000, 10, 15, 256, 3, 0)
INSERT [dbo].[SanPham] ([Id], [DanhMuc], [NhaSanXuat], [TenSP], [Gia], [CameraTruoc], [CameraSau], [ROM], [RAM], [TheNho]) VALUES (5, 1, 2, N'iPhone XR', 23490000, 10, 15, 256, 2, 0)
INSERT [dbo].[SanPham] ([Id], [DanhMuc], [NhaSanXuat], [TenSP], [Gia], [CameraTruoc], [CameraSau], [ROM], [RAM], [TheNho]) VALUES (6, 1, 1, N'SamSung Galaxy A9', 10490000, 8, 18, 128, 4, 128)
INSERT [dbo].[SanPham] ([Id], [DanhMuc], [NhaSanXuat], [TenSP], [Gia], [CameraTruoc], [CameraSau], [ROM], [RAM], [TheNho]) VALUES (7, 1, 1, N'SamSung Galaxy S8', 17990000, 8, 18, 128, 4, 128)
INSERT [dbo].[SanPham] ([Id], [DanhMuc], [NhaSanXuat], [TenSP], [Gia], [CameraTruoc], [CameraSau], [ROM], [RAM], [TheNho]) VALUES (8, 1, 1, N'SamSung Galaxy S9', 19990000, 8, 18, 128, 4, 128)
INSERT [dbo].[SanPham] ([Id], [DanhMuc], [NhaSanXuat], [TenSP], [Gia], [CameraTruoc], [CameraSau], [ROM], [RAM], [TheNho]) VALUES (9, 1, 1, N'SamSung Galaxy S9+', 20900000, 8, 18, 128, 4, 128)
INSERT [dbo].[SanPham] ([Id], [DanhMuc], [NhaSanXuat], [TenSP], [Gia], [CameraTruoc], [CameraSau], [ROM], [RAM], [TheNho]) VALUES (10, 1, 1, N'SamSung Galaxy Note 8', 14990000, 8, 18, 128, 4, 128)
INSERT [dbo].[SanPham] ([Id], [DanhMuc], [NhaSanXuat], [TenSP], [Gia], [CameraTruoc], [CameraSau], [ROM], [RAM], [TheNho]) VALUES (11, 1, 1, N'SamSung Galaxy Note 9', 22990000, 8, 18, 128, 4, 128)
INSERT [dbo].[SanPham] ([Id], [DanhMuc], [NhaSanXuat], [TenSP], [Gia], [CameraTruoc], [CameraSau], [ROM], [RAM], [TheNho]) VALUES (12, 1, 6, N'Huawei Mate20 Pro', 30000000, 8, 18, 128, 4, 128)
INSERT [dbo].[SanPham] ([Id], [DanhMuc], [NhaSanXuat], [TenSP], [Gia], [CameraTruoc], [CameraSau], [ROM], [RAM], [TheNho]) VALUES (13, 1, 6, N'Huawei Nova 3', 9990000, 8, 18, 128, 4, 128)
INSERT [dbo].[SanPham] ([Id], [DanhMuc], [NhaSanXuat], [TenSP], [Gia], [CameraTruoc], [CameraSau], [ROM], [RAM], [TheNho]) VALUES (14, 1, 6, N'Huawei Y9', 5490000, 8, 18, 128, 4, 128)
INSERT [dbo].[SanPham] ([Id], [DanhMuc], [NhaSanXuat], [TenSP], [Gia], [CameraTruoc], [CameraSau], [ROM], [RAM], [TheNho]) VALUES (15, 1, 1, N'SamSung Galaxy S10', 20990000, 8, 18, 128, 4, 128)
INSERT [dbo].[SanPham] ([Id], [DanhMuc], [NhaSanXuat], [TenSP], [Gia], [CameraTruoc], [CameraSau], [ROM], [RAM], [TheNho]) VALUES (16, 1, 1, N'SamSung Galaxy S10+', 33990000, 8, 18, 128, 4, 128)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
ALTER TABLE [dbo].[AnhSanPham]  WITH CHECK ADD  CONSTRAINT [FK_AnhSanPham_SanPham] FOREIGN KEY([SanPham])
REFERENCES [dbo].[SanPham] ([Id])
GO
ALTER TABLE [dbo].[AnhSanPham] CHECK CONSTRAINT [FK_AnhSanPham_SanPham]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonDatHang] FOREIGN KEY([DonHang])
REFERENCES [dbo].[DonDatHang] ([Id])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonDatHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_SanPham] FOREIGN KEY([SanPham])
REFERENCES [dbo].[SanPham] ([Id])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_SanPham]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_NguoiDung] FOREIGN KEY([KhachHang])
REFERENCES [dbo].[NguoiDung] ([Id])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_NguoiDung]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_NhanVien] FOREIGN KEY([NguoiLap])
REFERENCES [dbo].[NhanVien] ([Id])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_NhanVien]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_DanhMuc] FOREIGN KEY([DanhMuc])
REFERENCES [dbo].[DanhMuc] ([Id])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_DanhMuc]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaSanXuat] FOREIGN KEY([NhaSanXuat])
REFERENCES [dbo].[NhaSanXuat] ([Id])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaSanXuat]
GO
/****** Object:  StoredProcedure [dbo].[SoKetQuaTimThay]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SoKetQuaTimThay](@TuKhoa NVARCHAR(50))
AS
BEGIN
	DECLARE @tim NVARCHAR(50);
	
	SET @tim = '%' + @TuKhoa + '%';

	SELECT COUNT(*) AS SoLuong
	FROM dbo.SanPham
	WHERE TenSP LIKE @tim
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CapNhatThongTinNguoiDung]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CapNhatThongTinNguoiDung](@IdNguoiDung INT, @DienThoai varchar(10), @Ten nvarchar(50), @Email varchar(50), @DiaChi nvarchar(255))
AS
BEGIN
	DECLARE @KetQua INT;
	SET @KetQua = 0;
	--Quy ước: trả về 0 là update thành công,  trả về 1 là lỗi trùng điện thoại, trả về 2 là lỗi trùng email, trả về 3 là trùng cả 2

	IF EXISTS(SELECT *FROM dbo.NguoiDung WHERE DienThoai = @DienThoai)
	BEGIN
		IF NOT EXISTS(SELECT *FROM dbo.NguoiDung WHERE DienThoai = @DienThoai AND Id = @IdNguoiDung)
		BEGIN
			SET @KetQua = 1;
		END
	END

	IF EXISTS(SELECT *FROM dbo.NguoiDung WHERE Email = @Email)
	BEGIN
		IF NOT EXISTS(SELECT *FROM dbo.NguoiDung WHERE Email = @Email AND Id = @IdNguoiDung)
		BEGIN
			SET @KetQua = 2;
		END
	END

	IF EXISTS(SELECT *FROM dbo.NguoiDung WHERE DienThoai = @DienThoai AND Email = @Email )
	BEGIN
		IF NOT EXISTS(SELECT *FROM dbo.NguoiDung WHERE DienThoai = @DienThoai  AND Email = @Email AND Id = @IdNguoiDung)
		BEGIN
			SET @KetQua = 3;
		END
	END
	
	IF(@KetQua IS NOT NULL AND @KetQua = 0)
	BEGIN
		UPDATE dbo.NguoiDung SET DienThoai = @DienThoai, Ten = @Ten, Email = @Email, DiaChi = @DiaChi
		WHERE Id = @IdNguoiDung

		SET @KetQua = 0;
	END

	SELECT @KetQua AS KetQua;
END 

GO
/****** Object:  StoredProcedure [dbo].[SP_ChiTietDonHang]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_ChiTietDonHang](@IdDonHang INT)
AS
BEGIN
	SELECT sp.Id, sp.TenSP, sp.Gia, ctdh.SoLuong, ctdh.ThanhTien FROM  dbo.ChiTietDonHang ctdh INNER JOIN dbo.SanPham sp
	ON ctdh.SanPham = sp.Id
	WHERE DonHang = @IdDonHang
END


GO
/****** Object:  StoredProcedure [dbo].[SP_ChiTietSanPham]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_ChiTietSanPham](@Id INT)
AS
BEGIN
	SELECT sp.Id, dm.TenDanhMuc AS DanhMuc,nsx.TenNSX AS NhaSanXuat, sp.TenSP, Gia, sp.CameraTruoc, sp.CameraSau, sp.ROM , sp.RAM, sp.TheNho
	FROM dbo.SanPham sp, dbo.DanhMuc dm, dbo.NhaSanXuat nsx
	WHERE sp.DanhMuc = dm.Id AND sp.NhaSanXuat = nsx.Id AND sp.Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DangNhap]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DangNhap](@kieudangnhap varchar(50), @matkhau varchar(50))
AS
BEGIN
	DECLARE @ketqua int;
	-- 0 là sai, 1 là đúng
	DECLARE @dienthoai varchar(10);
	DECLARE @email varchar(50);

	SELECT @dienthoai = DienThoai FROM dbo.NguoiDung WHERE DienThoai = @kieudangnhap;
	SELECT @email = Email FROM dbo.NguoiDung WHERE Email = @kieudangnhap;

	IF (@dienthoai IS NOT NULL AND @dienthoai != '')--Nếu đăng nhập bằng số điện thoại
	BEGIN
		SELECT @ketqua = COUNT(*) FROM dbo.NguoiDung
		WHERE DienThoai = @kieudangnhap AND MatKhau = @matkhau
	END
	
	IF (@email IS NOT NULL AND @email != '')--Nếu đăng nhập bằng mail
	BEGIN
		SELECT @ketqua = COUNT(*) FROM dbo.NguoiDung
		WHERE Email = @kieudangnhap AND MatKhau = @matkhau
	END

	IF(@ketqua IS NULL) SET @ketqua = 0;

	SELECT @ketqua AS KetQua

END
GO
/****** Object:  StoredProcedure [dbo].[SP_DatHang]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DatHang](@KhachHang INT, @TenKH nvarchar(50), @DienThoai VARCHAR(11), @Email VARCHAR(50), @DiaChi NVARCHAR(255))
AS
BEGIN
	IF(@KhachHang IS NOT NULL AND @KhachHang != 0)
	BEGIN
		INSERT INTO dbo.DonDatHang
		        ( KhachHang ,
		          NgayDat ,
		          TenKH ,
		          DienThoai ,
		          Email ,
		          DiaChi
		        )
		VALUES  ( @KhachHang , -- KhachHang - int
		          GETDATE() , -- NgayDat - date
		          @TenKH , -- TenKH - nvarchar(50)
		          @DienThoai , -- DienThoai - int
		          @Email , -- Email - varchar(50)
		          @DiaChi -- DiaChi - nvarchar(255)
		        )
	END
	ELSE
	BEGIN
		INSERT INTO dbo.DonDatHang
		        ( 
		          NgayDat ,
		          TenKH ,
		          DienThoai ,
		          Email ,
		          DiaChi
		        )
		VALUES  ( 
		          GETDATE() , -- NgayDat - date
		          @TenKH , -- TenKH - nvarchar(50)
		          @DienThoai , -- DienThoai - int
		          @Email , -- Email - varchar(50)
		          @DiaChi -- DiaChi - nvarchar(255)
		        )
	END

	SELECT TOP 1 Id FROM dbo.DonDatHang
	ORDER BY Id DESC
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DonHangCuaBan]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DonHangCuaBan](@NguoiDung INT)
AS
BEGIN
	SELECT ddh.Id ,ddh.NgayDat, nd.Ten ,ddh.DienThoai ,ddh.DiaChi ,ddh.Email , ddh.TinhTrangDon FROM dbo.DonDatHang ddh INNER JOIN dbo.NguoiDung nd
	ON ddh.KhachHang = nd.Id
	WHERE ddh.KhachHang = @NguoiDung
	ORDER BY ddh.NgayDat DESC
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Lay1AnhSanPham]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Lay1AnhSanPham] @Id int
AS
BEGIN
	SELECT TOP(1) Anh FROM dbo.AnhSanPham WHERE SanPham = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LayAnhSanPham]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_LayAnhSanPham](@Id INT)
AS
BEGIN
	SELECT *FROM dbo.AnhSanPham
	WHERE SanPham = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[SP_LayDonHangTheoId]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_LayDonHangTheoId](@IdDonHang int)
AS
BEGIN
	SELECT ddh.Id ,ddh.NgayDat, nd.Ten ,ddh.DienThoai ,ddh.DiaChi ,ddh.Email , ddh.TinhTrangDon FROM dbo.DonDatHang ddh INNER JOIN dbo.NguoiDung nd
	ON ddh.KhachHang = nd.Id
	WHERE ddh.Id = @IdDonHang
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LaySanPhamTheoLoai]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_LaySanPhamTheoLoai](@DanhMuc INT, @Start INT, @End INT)
AS
BEGIN
	SELECT *FROM
    (
		SELECT *, ROW_NUMBER() OVER(ORDER BY Id) AS RowNum
		FROM dbo.SanPham
		WHERE DanhMuc = @DanhMuc
	)AS tableTemp
	WHERE tableTemp.RowNum BETWEEN @Start AND @End
END


GO
/****** Object:  StoredProcedure [dbo].[SP_LaySoLuongDonHang]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_LaySoLuongDonHang](@idNguoiDung int)
AS
BEGIN
	SELECT COUNT(*) AS SoLuongDonHang FROM dbo.DonDatHang
	WHERE KhachHang = @idNguoiDung AND TinhTrangDon IS null
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LayThongTinNguoiDung]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_LayThongTinNguoiDung](@kieudangnhap VARCHAR(50))
AS
BEGIN
	SELECT *FROM dbo.NguoiDung
	WHERE DienThoai = @kieudangnhap OR Email = @kieudangnhap
END


GO
/****** Object:  StoredProcedure [dbo].[SP_LocKetQua]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_LocKetQua](@sql NCHAR(255))
AS
BEGIN
	EXEC SP_EXECUTESQL
	@STATEMENT = @sql
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SanPhamHot]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_SanPhamHot]
AS
BEGIN
	SELECT sp.Id, dm.TenDanhMuc AS DanhMuc,nsx.TenNSX AS NhaSanXuat, sp.TenSP, Gia, sp.CameraTruoc, sp.CameraSau, sp.ROM , sp.RAM, sp.TheNho
	FROM dbo.SanPham sp, dbo.DanhMuc dm, dbo.NhaSanXuat nsx
	WHERE sp.DanhMuc = dm.Id AND sp.NhaSanXuat = nsx.Id AND sp.Gia BETWEEN 20000000 AND 50000000
	ORDER BY sp.Gia DESC
END


GO
/****** Object:  StoredProcedure [dbo].[SP_SanPhamMoi]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[SP_SanPhamMoi] 
AS
BEGIN
	SELECT TOP(5) sp.Id, dm.TenDanhMuc AS DanhMuc,nsx.TenNSX AS NhaSanXuat, sp.TenSP, Gia, sp.CameraTruoc, sp.CameraSau, sp.ROM , sp.RAM, sp.TheNho
	FROM dbo.SanPham sp, dbo.DanhMuc dm, dbo.NhaSanXuat nsx
	WHERE sp.DanhMuc = dm.Id AND sp.NhaSanXuat = nsx.Id
END


GO
/****** Object:  StoredProcedure [dbo].[SP_SanPhamTheoHangSX]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SanPhamTheoHangSX](@Id INT)
AS
BEGIN
	SELECT sp.Id, dm.TenDanhMuc AS DanhMuc,nsx.TenNSX AS NhaSanXuat, sp.TenSP, Gia, sp.CameraTruoc, sp.CameraSau, sp.ROM , sp.RAM, sp.TheNho
	FROM dbo.SanPham sp, dbo.DanhMuc dm, dbo.NhaSanXuat nsx
	WHERE sp.DanhMuc = dm.Id AND sp.NhaSanXuat = nsx.Id AND sp.NhaSanXuat = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[SP_SoLuongSanPhamTheoLoai]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[SP_SoLuongSanPhamTheoLoai](@DanhMuc INT)
AS
BEGIN

		SELECT COUNT(*) AS SoLuong
		FROM dbo.SanPham
		WHERE DanhMuc = @DanhMuc
END


GO
/****** Object:  StoredProcedure [dbo].[SP_ThemChiTietDonHang]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_ThemChiTietDonHang](@DonHang INT, @SanPham INT, @SoLuong INT , @ThanhTien INT)
AS
BEGIN
	INSERT INTO dbo.ChiTietDonHang
	        ( DonHang ,
	          SanPham ,
	          SoLuong ,
	          ThanhTien
	        )
	VALUES  ( @DonHang , -- DonHang - int
	          @SanPham , -- SanPham - int
	          @SoLuong , -- SoLuong - int
	          @ThanhTien  -- ThanhTien - int
	        )
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ThemNguoiDung]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[SP_ThemNguoiDung](@DienThoai varchar(10), @MatKhau varchar(50), @Ten nvarchar(50), @Email varchar(50), @DiaChi nvarchar(255))
AS
BEGIN
	DECLARE @KetQua INT;
	SET @KetQua = 0;
	--Quy ước: trả về 0 là thêm thành công,  trả về 1 là lỗi trùng điện thoại, trả về 2 là lỗi trùng email, trả về 3 là trùng cả 2

	IF EXISTS(SELECT *FROM dbo.NguoiDung WHERE DienThoai = @DienThoai)
	BEGIN
		SET @KetQua = 1;
	END

	IF EXISTS(SELECT *FROM dbo.NguoiDung WHERE Email = @Email)
	BEGIN
		SET @KetQua = 2;
	END

	IF EXISTS(SELECT *FROM dbo.NguoiDung WHERE DienThoai = @DienThoai AND Email = @Email )
	BEGIN
		SET @KetQua = 3;
	END
	
	IF(@KetQua IS NOT NULL AND @KetQua = 0)
	BEGIN
		INSERT INTO dbo.NguoiDung
		        ( DienThoai ,
		          MatKhau ,
		          Ten ,
		          Email ,
		          DiaChi
		        )
		VALUES  ( @DienThoai , -- DienThoai - varchar(50)
		          @MatKhau , -- MatKhau - varchar(50)
		          @Ten , -- Ten - nvarchar(50)
		          @Email , -- Email - varchar(50)
		          @DiaChi  -- DiaChi - nvarchar(255)
		        )
		
	END

	SELECT @KetQua AS KetQua;
END 


GO
/****** Object:  StoredProcedure [dbo].[SP_TimKiemSanPham]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_TimKiemSanPham](@TuKhoa NVARCHAR(50), @Start INT, @End INT)
AS
BEGIN
	DECLARE @tim NVARCHAR(50);
	
	SET @tim = '%' + @TuKhoa + '%';

	SELECT *FROM
    (
		SELECT *, ROW_NUMBER() OVER(ORDER BY Id) AS RowNum
		FROM dbo.SanPham
		WHERE TenSP LIKE @tim
	)AS tableTemp
	WHERE tableTemp.RowNum BETWEEN @Start AND @End
END
GO
/****** Object:  StoredProcedure [dbo].[test]    Script Date: 17/03/2019 06:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[test](@TuKhoa NVARCHAR(50))
AS
BEGIN
	DECLARE @tim NVARCHAR(50);
	
	SET @tim = '%' + @TuKhoa + '%';

	SELECT *FROM dbo.SanPham
	WHERE TenSP LIKE @tim
END
GO
USE [master]
GO
ALTER DATABASE [MobileWorld] SET  READ_WRITE 
GO
