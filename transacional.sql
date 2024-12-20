USE [master]
GO
/****** Object:  Database [olist_transactional_db]    Script Date: 01/12/2024 18:52:22 ******/
CREATE DATABASE [olist_transactional_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'olist_transactional_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\olist_transactional_db.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'olist_transactional_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\olist_transactional_db_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [olist_transactional_db] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [olist_transactional_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [olist_transactional_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [olist_transactional_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [olist_transactional_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [olist_transactional_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [olist_transactional_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [olist_transactional_db] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [olist_transactional_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [olist_transactional_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [olist_transactional_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [olist_transactional_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [olist_transactional_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [olist_transactional_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [olist_transactional_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [olist_transactional_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [olist_transactional_db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [olist_transactional_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [olist_transactional_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [olist_transactional_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [olist_transactional_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [olist_transactional_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [olist_transactional_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [olist_transactional_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [olist_transactional_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [olist_transactional_db] SET  MULTI_USER 
GO
ALTER DATABASE [olist_transactional_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [olist_transactional_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [olist_transactional_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [olist_transactional_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [olist_transactional_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [olist_transactional_db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [olist_transactional_db] SET QUERY_STORE = ON
GO
ALTER DATABASE [olist_transactional_db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [olist_transactional_db]
GO
/****** Object:  Table [dbo].[olist_customers_dataset]    Script Date: 01/12/2024 18:52:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[olist_customers_dataset](
	[customer_id] [varchar](33) NOT NULL,
	[customer_unique_id] [varchar](33) NOT NULL,
	[customer_zip_code_prefix] [char](5) NOT NULL,
	[customer_city] [varchar](30) NOT NULL,
	[customer_state] [char](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[olist_order_items_dataset]    Script Date: 01/12/2024 18:52:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[olist_order_items_dataset](
	[order_item_id] [varchar](1) NOT NULL,
	[order_id] [varchar](33) NOT NULL,
	[product_id] [varchar](33) NULL,
	[seller_id] [varchar](33) NOT NULL,
	[shipping_limit_date] [nvarchar](50) NULL,
	[price] [money] NOT NULL,
	[freight_value] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[olist_orders_dataset]    Script Date: 01/12/2024 18:52:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[olist_orders_dataset](
	[order_id] [varchar](33) NOT NULL,
	[customer_id] [varchar](33) NOT NULL,
	[order_status] [varchar](15) NOT NULL,
	[order_purchase_timestamp] [nvarchar](50) NULL,
	[order_approved_at] [nvarchar](50) NULL,
	[order_delivered_carrier_date] [nvarchar](50) NULL,
	[order_delivered_customer_date] [nvarchar](50) NULL,
	[order_estimated_delivery_date] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[olist_products_dataset]    Script Date: 01/12/2024 18:52:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[olist_products_dataset](
	[product_id] [varchar](33) NOT NULL,
	[product_category_name] [varchar](100) NULL,
	[product_name_lenght] [nvarchar](10) NULL,
	[product_description_lenght] [nvarchar](10) NULL,
	[product_photos_qty] [nvarchar](10) NULL,
	[product_weight_g] [nvarchar](10) NULL,
	[product_length_cm] [nvarchar](10) NULL,
	[product_height_cm] [nvarchar](10) NULL,
	[product_width_cm] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[olist_sellers_dataset]    Script Date: 01/12/2024 18:52:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[olist_sellers_dataset](
	[seller_id] [varchar](33) NOT NULL,
	[seller_zip_code_prefix] [char](5) NOT NULL,
	[seller_city] [varchar](30) NOT NULL,
	[seller_state] [char](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[seller_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[olist_order_items_dataset]  WITH CHECK ADD  CONSTRAINT [FK_olist_order_items_order_id] FOREIGN KEY([order_id])
REFERENCES [dbo].[olist_orders_dataset] ([order_id])
GO
ALTER TABLE [dbo].[olist_order_items_dataset] CHECK CONSTRAINT [FK_olist_order_items_order_id]
GO
ALTER TABLE [dbo].[olist_order_items_dataset]  WITH CHECK ADD  CONSTRAINT [FK_olist_order_items_product_id] FOREIGN KEY([product_id])
REFERENCES [dbo].[olist_products_dataset] ([product_id])
GO
ALTER TABLE [dbo].[olist_order_items_dataset] CHECK CONSTRAINT [FK_olist_order_items_product_id]
GO
ALTER TABLE [dbo].[olist_order_items_dataset]  WITH CHECK ADD  CONSTRAINT [FK_olist_order_items_seller_id] FOREIGN KEY([seller_id])
REFERENCES [dbo].[olist_sellers_dataset] ([seller_id])
GO
ALTER TABLE [dbo].[olist_order_items_dataset] CHECK CONSTRAINT [FK_olist_order_items_seller_id]
GO
ALTER TABLE [dbo].[olist_orders_dataset]  WITH CHECK ADD  CONSTRAINT [FK_olist_orders_customer_id] FOREIGN KEY([customer_id])
REFERENCES [dbo].[olist_customers_dataset] ([customer_id])
GO
ALTER TABLE [dbo].[olist_orders_dataset] CHECK CONSTRAINT [FK_olist_orders_customer_id]
GO
USE [master]
GO
ALTER DATABASE [olist_transactional_db] SET  READ_WRITE 
GO

BULK INSERT dbo.olist_customers_dataset
FROM 'C:\Users\jpsha\Downloads\archive\olist_customers_dataset.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT dbo.olist_order_items_dataset
FROM 'C:\Users\jpsha\Downloads\archive\olist_order_items_dataset.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT dbo.olist_orders_dataset
FROM 'C:\Users\jpsha\Downloads\archive\olist_orders_dataset.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT dbo.olist_products_dataset
FROM 'C:\Users\jpsha\Downloads\archive\olist_products_dataset.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT dbo.olist_sellers_dataset
FROM 'C:\Users\jpsha\Downloads\archive\olist_sellers_dataset.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);