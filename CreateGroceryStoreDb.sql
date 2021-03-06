USE [master]
GO
/****** Object:  Database [GroceryStore]    Script Date: 2019-03-28 12:48:18 PM ******/
CREATE DATABASE [GroceryStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GroceryStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\GroceryStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GroceryStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\GroceryStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GroceryStore] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GroceryStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GroceryStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GroceryStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GroceryStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GroceryStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GroceryStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [GroceryStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GroceryStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GroceryStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GroceryStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GroceryStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GroceryStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GroceryStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GroceryStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GroceryStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GroceryStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GroceryStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GroceryStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GroceryStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GroceryStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GroceryStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GroceryStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GroceryStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GroceryStore] SET RECOVERY FULL 
GO
ALTER DATABASE [GroceryStore] SET  MULTI_USER 
GO
ALTER DATABASE [GroceryStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GroceryStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GroceryStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GroceryStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GroceryStore] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GroceryStore', N'ON'
GO
ALTER DATABASE [GroceryStore] SET QUERY_STORE = OFF
GO
USE [GroceryStore]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2019-03-28 12:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ImageURL] [nvarchar](max) NULL,
	[ImageAlt] [nvarchar](50) NULL,
 CONSTRAINT [Category_PK] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conversion]    Script Date: 2019-03-28 12:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conversion](
	[ConversionId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](5) NOT NULL,
 CONSTRAINT [Conversion_PK] PRIMARY KEY CLUSTERED 
(
	[ConversionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grocery]    Script Date: 2019-03-28 12:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grocery](
	[GroceryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[Weight] [decimal](18, 3) NULL,
	[ConversionId] [int] NULL,
	[ImageURL] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[ImageAlt] [nvarchar](50) NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [Grocery_PK] PRIMARY KEY CLUSTERED 
(
	[GroceryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 2019-03-28 12:48:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[ProvinceStateId] [int] NOT NULL,
	[PostalCode] [nvarchar](7) NOT NULL,
 CONSTRAINT [Location_PK] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProvinceState]    Script Date: 2019-03-28 12:48:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProvinceState](
	[ProvinceStateId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](3) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UseState] [bit] NOT NULL,
 CONSTRAINT [ProvinceState_PK] PRIMARY KEY CLUSTERED 
(
	[ProvinceStateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 2019-03-28 12:48:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[StockId] [int] IDENTITY(1,1) NOT NULL,
	[LocationId] [int] NOT NULL,
	[GroceryId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [Stock_PK] PRIMARY KEY CLUSTERED 
(
	[StockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Name], [ImageURL], [ImageAlt]) VALUES (1, N'Produce', N'https://i.ibb.co/7X54hKJ/fresh-produce-for-sale.jpg', N'Produce')
INSERT [dbo].[Category] ([CategoryId], [Name], [ImageURL], [ImageAlt]) VALUES (2, N'Deli', N'https://i.ibb.co/jgDYRNW/pexels-photo-1290796.jpg', N'Deli')
INSERT [dbo].[Category] ([CategoryId], [Name], [ImageURL], [ImageAlt]) VALUES (3, N'Bakery', N'https://i.ibb.co/wzqG1VT/PIXNIO-260358-900x600.jpg', N'Bakery')
INSERT [dbo].[Category] ([CategoryId], [Name], [ImageURL], [ImageAlt]) VALUES (4, N'Meat', N'https://i.ibb.co/y6TYVzS/meat-2602031-1920.jpg', N'Meat')
INSERT [dbo].[Category] ([CategoryId], [Name], [ImageURL], [ImageAlt]) VALUES (5, N'Dairy', N'https://i.ibb.co/QYXbDfq/milk-1887234-1920.jpg', N'Dairy')
INSERT [dbo].[Category] ([CategoryId], [Name], [ImageURL], [ImageAlt]) VALUES (6, N'Drinks', N'https://i.ibb.co/HTxMGWm/64cccf9956ab2b4eb4e4c61eccac-1459031.jpg', N'Drinks')
INSERT [dbo].[Category] ([CategoryId], [Name], [ImageURL], [ImageAlt]) VALUES (7, N'Frozen', N'https://i.ibb.co/8BYPKnF/5369.jpg', N'Frozen')
INSERT [dbo].[Category] ([CategoryId], [Name], [ImageURL], [ImageAlt]) VALUES (8, N'Pantry', N'https://i.ibb.co/k1KpmH9/non-perishable-food-items.png', N'Pantry')
INSERT [dbo].[Category] ([CategoryId], [Name], [ImageURL], [ImageAlt]) VALUES (9, N'Natural and Organic', NULL, NULL)
INSERT [dbo].[Category] ([CategoryId], [Name], [ImageURL], [ImageAlt]) VALUES (10, N'International', NULL, NULL)
INSERT [dbo].[Category] ([CategoryId], [Name], [ImageURL], [ImageAlt]) VALUES (11, N'Baby Food', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Conversion] ON 

INSERT [dbo].[Conversion] ([ConversionId], [Name], [Code]) VALUES (1, N'Kilograms', N'Kg')
INSERT [dbo].[Conversion] ([ConversionId], [Name], [Code]) VALUES (2, N'Pounds', N'lbs')
SET IDENTITY_INSERT [dbo].[Conversion] OFF
SET IDENTITY_INSERT [dbo].[Grocery] ON 

INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (1, N'All-Purpose Flour', 1.0000, CAST(1.000 AS Decimal(18, 3)), 2, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 8)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (2, N'White Rice', 1.5000, CAST(1.000 AS Decimal(18, 3)), 2, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 8)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (3, N'Sugar', 1.2500, CAST(1.000 AS Decimal(18, 3)), 2, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 8)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (4, N'Pasta', 2.0000, CAST(1.000 AS Decimal(18, 3)), 2, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 8)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (5, N'White Bread', 2.0000, CAST(1.000 AS Decimal(18, 3)), 2, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 3)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (6, N'Wheat Bread', 2.0000, CAST(1.000 AS Decimal(18, 3)), 2, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 3)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (7, N'Whole Milk 2%', 4.0000, CAST(1.000 AS Decimal(18, 3)), 2, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 5)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (8, N'Salted Butter', 3.0000, CAST(1.000 AS Decimal(18, 3)), 2, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 5)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (9, N'Cheddar Cheese', 3.0000, CAST(1.000 AS Decimal(18, 3)), 2, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 5)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (10, N'Eggs', 1.7500, CAST(1.000 AS Decimal(18, 3)), 2, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 5)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (11, N'Red Apples', 1.2900, CAST(1.000 AS Decimal(18, 3)), 2, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 1)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (12, N'Bananas', 0.5600, CAST(1.000 AS Decimal(18, 3)), 2, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 1)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (13, N'Oranges', 1.3300, CAST(1.000 AS Decimal(18, 3)), 2, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 1)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (14, N'Seedless Grapes', 2.6700, CAST(1.000 AS Decimal(18, 3)), 2, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 1)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (15, N'Strawberries', 2.2100, CAST(1.000 AS Decimal(18, 3)), 2, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 1)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (16, N'Lemons', 2.0100, CAST(1.000 AS Decimal(18, 3)), 1, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 1)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (17, N'Tomatoes', 1.9000, CAST(1.000 AS Decimal(18, 3)), 1, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 1)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (18, N'Broccoli', 1.8100, CAST(1.000 AS Decimal(18, 3)), 1, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 1)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (19, N'Dried Beans', 1.3600, CAST(1.000 AS Decimal(18, 3)), 1, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 8)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (20, N'Potatoes', 0.7200, CAST(1.000 AS Decimal(18, 3)), 1, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 1)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (21, N'Ground Beef', 4.1200, CAST(1.000 AS Decimal(18, 3)), 1, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 4)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (22, N'Top Round Steak', 5.7800, CAST(1.000 AS Decimal(18, 3)), 1, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 4)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (23, N'Sirloin Steak', 8.0700, CAST(1.000 AS Decimal(18, 3)), 1, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 4)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (24, N'Boneless Pork Chop', 3.8200, CAST(1.000 AS Decimal(18, 3)), 1, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 4)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (25, N'Boneless Chicken Breast', 3.2100, CAST(1.000 AS Decimal(18, 3)), 1, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 4)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (26, N'Frozen Turkey', 8.0000, CAST(1.000 AS Decimal(18, 3)), 1, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 4)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (27, N'Bacon', 5.7900, CAST(1.000 AS Decimal(18, 3)), 1, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 4)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (28, N'Peanut Butter', 2.5600, CAST(1.000 AS Decimal(18, 3)), 1, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 8)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (29, N'Chocolate Chip Cookies', 3.4700, CAST(1.000 AS Decimal(18, 3)), 1, N'https://i.ibb.co/qJvZgCw/27141804-wicker-basket-with-groceries-isolated-on-white-background.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras semper auctor neque vitae tempus quam. Convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat. Pretium lectus quam id leo in vitae turpis massa sed. Mauris a diam maecenas sed. Sit amet tellus cras adipiscing enim eu turpis egestas. Tristique magna sit amet purus gravida quis blandit turpis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra. Nulla aliquet enim tortor at auctor urna. Sodales neque sodales ut etiam sit. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Sed velit dignissim sodales ut eu sem integer. Leo integer malesuada nunc vel risus. Nulla facilisi cras fermentum odio eu feugiat. Hac habitasse platea dictumst quisque sagittis purus sit.', N'Grocery basket', 8)
INSERT [dbo].[Grocery] ([GroceryId], [Name], [Price], [Weight], [ConversionId], [ImageURL], [Description], [ImageAlt], [CategoryId]) VALUES (30, N'Ice Cream', 4.7000, NULL, NULL, NULL, NULL, NULL, 7)
SET IDENTITY_INSERT [dbo].[Grocery] OFF
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([LocationId], [Address], [City], [ProvinceStateId], [PostalCode]) VALUES (1, N'123 Main St', N'Toronto', 1, N'A1B 2C3')
INSERT [dbo].[Location] ([LocationId], [Address], [City], [ProvinceStateId], [PostalCode]) VALUES (2, N'356 Barton St', N'New York', 11, N'12345')
SET IDENTITY_INSERT [dbo].[Location] OFF
SET IDENTITY_INSERT [dbo].[ProvinceState] ON 

INSERT [dbo].[ProvinceState] ([ProvinceStateId], [Code], [Name], [UseState]) VALUES (1, N'ON', N'Ontario', 0)
INSERT [dbo].[ProvinceState] ([ProvinceStateId], [Code], [Name], [UseState]) VALUES (2, N'QC', N'Quebec', 0)
INSERT [dbo].[ProvinceState] ([ProvinceStateId], [Code], [Name], [UseState]) VALUES (3, N'NS', N'Nova Scotia', 0)
INSERT [dbo].[ProvinceState] ([ProvinceStateId], [Code], [Name], [UseState]) VALUES (4, N'NB', N'New Brunswick', 0)
INSERT [dbo].[ProvinceState] ([ProvinceStateId], [Code], [Name], [UseState]) VALUES (5, N'MB', N'Manitoba', 0)
INSERT [dbo].[ProvinceState] ([ProvinceStateId], [Code], [Name], [UseState]) VALUES (6, N'BC', N'British Columbia', 0)
INSERT [dbo].[ProvinceState] ([ProvinceStateId], [Code], [Name], [UseState]) VALUES (7, N'PE', N'Prince Edward Island', 0)
INSERT [dbo].[ProvinceState] ([ProvinceStateId], [Code], [Name], [UseState]) VALUES (8, N'SK', N'Saskatchewan', 0)
INSERT [dbo].[ProvinceState] ([ProvinceStateId], [Code], [Name], [UseState]) VALUES (9, N'AB', N'Alberta', 0)
INSERT [dbo].[ProvinceState] ([ProvinceStateId], [Code], [Name], [UseState]) VALUES (10, N'NL', N'Newfoundland and Labrador', 0)
INSERT [dbo].[ProvinceState] ([ProvinceStateId], [Code], [Name], [UseState]) VALUES (11, N'NY', N'New York', 1)
SET IDENTITY_INSERT [dbo].[ProvinceState] OFF
SET IDENTITY_INSERT [dbo].[Stock] ON 

INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (1, 1, 1, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (2, 1, 2, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (3, 1, 3, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (4, 1, 4, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (5, 1, 5, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (6, 1, 6, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (7, 1, 7, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (8, 1, 8, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (9, 1, 9, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (10, 1, 10, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (11, 1, 11, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (12, 1, 12, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (13, 1, 13, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (14, 1, 14, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (15, 1, 15, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (16, 1, 16, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (17, 1, 17, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (18, 1, 18, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (19, 1, 19, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (20, 1, 20, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (21, 1, 21, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (22, 1, 22, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (23, 1, 23, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (24, 1, 24, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (25, 1, 25, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (26, 1, 26, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (27, 1, 27, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (28, 1, 28, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (29, 1, 29, 1)
INSERT [dbo].[Stock] ([StockId], [LocationId], [GroceryId], [Quantity]) VALUES (31, 2, 2, 3)
SET IDENTITY_INSERT [dbo].[Stock] OFF
ALTER TABLE [dbo].[Grocery]  WITH CHECK ADD  CONSTRAINT [Grocery_Category_FK] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Grocery] CHECK CONSTRAINT [Grocery_Category_FK]
GO
ALTER TABLE [dbo].[Grocery]  WITH CHECK ADD  CONSTRAINT [Grocery_ConversionId_FK] FOREIGN KEY([ConversionId])
REFERENCES [dbo].[Conversion] ([ConversionId])
GO
ALTER TABLE [dbo].[Grocery] CHECK CONSTRAINT [Grocery_ConversionId_FK]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [Location_ProvinceStateId_FK] FOREIGN KEY([ProvinceStateId])
REFERENCES [dbo].[ProvinceState] ([ProvinceStateId])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [Location_ProvinceStateId_FK]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [Stock_GroceryId_FK] FOREIGN KEY([GroceryId])
REFERENCES [dbo].[Grocery] ([GroceryId])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [Stock_GroceryId_FK]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [Stock_LocationId_FK] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([LocationId])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [Stock_LocationId_FK]
GO
USE [master]
GO
ALTER DATABASE [GroceryStore] SET  READ_WRITE 
GO
