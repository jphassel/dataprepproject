USE [master]
GO
/****** Object:  Database [Wide_table]    Script Date: 01/12/2024 19:32:20 ******/
CREATE DATABASE [Wide_table]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Wide_table', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Wide_table.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Wide_table_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Wide_table_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Wide_table] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Wide_table].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Wide_table] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Wide_table] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Wide_table] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Wide_table] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Wide_table] SET ARITHABORT OFF 
GO
ALTER DATABASE [Wide_table] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Wide_table] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Wide_table] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Wide_table] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Wide_table] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Wide_table] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Wide_table] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Wide_table] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Wide_table] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Wide_table] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Wide_table] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Wide_table] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Wide_table] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Wide_table] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Wide_table] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Wide_table] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Wide_table] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Wide_table] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Wide_table] SET  MULTI_USER 
GO
ALTER DATABASE [Wide_table] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Wide_table] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Wide_table] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Wide_table] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Wide_table] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Wide_table] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Wide_table] SET QUERY_STORE = ON
GO
ALTER DATABASE [Wide_table] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Wide_table]
GO
/****** Object:  Table [dbo].[wide_sales]    Script Date: 01/12/2024 19:32:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wide_sales](
	[sales_id] [int] IDENTITY(1,1) NOT NULL,
	[year] [int] NULL,
	[month] [int] NULL,
	[product_id] [varchar](33) NULL,
	[product_category_name] [varchar](100) NULL,
	[customer_id] [varchar](33) NULL,
	[customer_city] [varchar](30) NULL,
	[customer_state] [char](2) NULL,
	[seller_id] [varchar](33) NULL,
	[seller_city] [varchar](30) NULL,
	[seller_state] [char](2) NULL,
	[price] [money] NULL,
	[freight_value] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[sales_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Wide_table] SET  READ_WRITE 
GO
