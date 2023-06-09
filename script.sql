USE [master]
GO
/****** Object:  Database [Ulov2]    Script Date: 4/13/2023 8:42:17 PM ******/
CREATE DATABASE [Ulov2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ulov2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Ulov2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ulov2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Ulov2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Ulov2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ulov2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ulov2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ulov2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ulov2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ulov2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ulov2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ulov2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ulov2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ulov2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ulov2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ulov2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ulov2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ulov2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ulov2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ulov2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ulov2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ulov2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ulov2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ulov2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ulov2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ulov2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ulov2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ulov2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ulov2] SET RECOVERY FULL 
GO
ALTER DATABASE [Ulov2] SET  MULTI_USER 
GO
ALTER DATABASE [Ulov2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ulov2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ulov2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ulov2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ulov2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ulov2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Ulov2', N'ON'
GO
ALTER DATABASE [Ulov2] SET QUERY_STORE = ON
GO
ALTER DATABASE [Ulov2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Ulov2]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/13/2023 8:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 4/13/2023 8:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/13/2023 8:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Articul] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[UnitId] [int] NOT NULL,
	[Cost] [money] NOT NULL,
	[MaxDiscount] [int] NOT NULL,
	[ManufacturerId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CurrentDiscount] [int] NOT NULL,
	[StorageCount] [int] NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Image] [varbinary](max) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Articul] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 4/13/2023 8:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 4/13/2023 8:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Катушки')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Приманки')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Амуниция и снаряжение')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Леска')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (5, N'Оснастка')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (1, N'Stinger')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (2, N'Kuusamo')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (3, N'Usami')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (4, N'LumiCom')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (5, N'Aquatech')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (6, N'SevereLand')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (7, N'Westin')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (8, N'Ultron')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (9, N'Balsax')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (10, N'Momoi')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (11, N'Gamma')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'105BV8', N'Палатка зимняя', 1, 200.0000, 3, 6, 6, 3, 8, 25, N'Палатка зимняя SevereLand IT210', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'504KAE', N'Наконечник', 1, 400.0000, 10, 2, 2, 5, 10, 14, N'Kuusamo Tele Kirppu 5-10g', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'6Z2TGT', N'Балансир', 1, 500.0000, 9, 2, 2, 2, 2, 7, N'Kuusamo Tasapaino X-PRO', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'8JICK8', N'Леска Gamma Ice ', 1, 280.0000, 11, 11, 11, 4, 10, 4, N'Леска Gamma Ice Fluorocarbon', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'A0ZBSB', N'Штаны', 1, 7450.0000, 6, 7, 7, 3, 3, 31, N'Штаны утепленные Westin W4 2-Layer Bibs', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'B4DS9I', N'Кормушка', 1, 65.0000, 5, 5, 5, 5, 9, 6, N'Кормушка Aquatech малая', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'BJJ2XD', N'Черпак', 1, 410.0000, 5, 2, 2, 3, 1, 28, N'Черпак Kuusamo 90мм', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'CZ96A8', N'Кормушка', 1, 130.0000, 9, 5, 5, 5, 13, 27, N'Кормушка Aquatech большая', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'E6IZV3', N'Кивок лавсановый', 1, 500.0000, 3, 1, 1, 5, 8, 15, N'Кивок лавсановый спортивный Stinger', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'EJ9GSG', N'Катушка', 1, 520.0000, 5, 1, 1, 1, 2, 13, N'Катушка Stinger Arctic Char', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'JE6VN0', N'Рукавицы', 1, 600.0000, 9, 6, 6, 3, 4, 1, N'Рукавицы SevereLand Snow Visor', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'L4Y4MS', N'Мормышка', 1, 360.0000, 6, 4, 4, 2, 2, 25, N'Мормышка LumiCom Дробина с отверстием', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'LXB2A9', N'Мормышка', 1, 900.0000, 4, 4, 4, 2, 5, 8, N'Мормышка W LumiCom Капля с ушком ', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'M37WHA', N'Катушка', 1, 1750.0000, 10, 1, 1, 1, 3, 20, N'Катушка Stinger Arctic Char Trigger 105L', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'M3UEHS', N'Катушка', 1, 810.0000, 10, 1, 1, 1, 2, 27, N'Катушка Stinger Arctic Char Pro', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'M6XARO', N'Воблер', 1, 200.0000, 3, 3, 3, 2, 6, 16, N'Воблеры Usami Wasabi Vib', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'MGIP6R', N'Балансир', 1, 120.0000, 5, 3, 3, 2, 12, 12, N'Балансир Usami Dansa Pike Special', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'MVIR2L', N'Леска Ultron Elite ', 1, 100.0000, 10, 8, 8, 4, 14, 13, N'Леска Ultron Elite Platinum Winter 30m', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'OACIX8', N'Шапка-маска ', 1, 950.0000, 9, 6, 6, 3, 12, 19, N'Шапка-маска SevereLand Sub Zero', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'OQIXDR', N'Кивок силиконовый', 1, 350.0000, 6, 1, 1, 5, 4, 12, N'Кивок силиконовый Stinger', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'OU1EGM', N'Леска  Balsax Ice', 1, 70.0000, 5, 9, 9, 4, 1, 28, N'Леска Balsax Ice King', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'PCIS4E', N'Блесна', 1, 440.0000, 4, 2, 2, 2, 15, 30, N'Kuusamo Professor 4 50/8', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'PDLQ16', N'Кивок рессорный', 1, 1200.0000, 4, 1, 1, 5, 12, 25, N'Кивки рессорные Stinger Баланс-R', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'PILLFW', N'Блесна', 1, 300.0000, 11, 1, 1, 2, 10, 8, N'Блесна Stinger 305-080', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'Q50897', N'Ящик зимний', 1, 1350.0000, 10, 5, 5, 3, 9, 19, N'Ящик зимний Aquatech', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'R25FXL', N'Леска Momoi Hi-Max ', 1, 80.0000, 5, 10, 10, 4, 6, 10, N'Леска Momoi Hi-Max Sky Blue', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'R7N43T', N'Леска Balsax Ice ', 1, 30.0000, 10, 9, 9, 4, 9, 3, N'Леска Balsax Ice Power', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'SOIPEQ', N'Катушка', 1, 600.0000, 5, 1, 1, 1, 5, 22, N'Катушка Stinger Arctic Char XP', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'UEOGV3', N'Наконечник', 1, 400.0000, 4, 2, 2, 5, 4, 15, N'Kuusamo Tele Kirppu Mormy', NULL)
INSERT [dbo].[Product] ([Articul], [Name], [UnitId], [Cost], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [StorageCount], [Description], [Image]) VALUES (N'V5KORQ', N'Термобелье', 1, 1000.0000, 4, 6, 6, 3, 13, 16, N'Термобелье SevereLand DryShield', NULL)
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (1, N'Stinger')
INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (2, N'Kuusamo')
INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (3, N'Usami')
INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (4, N'LumiCom')
INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (5, N'Aquatech')
INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (6, N'SevereLand')
INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (7, N'Westin')
INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (8, N'Ultron')
INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (9, N'Balsax')
INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (10, N'Momoi')
INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (11, N'Gamma')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([Id], [Name]) VALUES (1, N'шт')
SET IDENTITY_INSERT [dbo].[Unit] OFF
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[Manufacturer] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Unit]
GO
USE [master]
GO
ALTER DATABASE [Ulov2] SET  READ_WRITE 
GO
