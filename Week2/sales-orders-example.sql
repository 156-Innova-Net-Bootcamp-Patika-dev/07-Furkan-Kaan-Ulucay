USE [innovatest]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 20.01.2022 16:28:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryDescription] [nvarchar](50) NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 20.01.2022 16:28:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustFirstName] [nvarchar](50) NOT NULL,
	[CustLastName] [nvarchar](50) NOT NULL,
	[CustStreetAddress] [nvarchar](200) NOT NULL,
	[CustCity] [nvarchar](50) NULL,
	[CustState] [nvarchar](50) NULL,
	[CustZipCode] [int] NULL,
	[CustAreaCode] [int] NULL,
	[CustPhoneNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK__customer__A4AE64B8532C2485] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 20.01.2022 16:28:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[EmpFirstName] [nvarchar](50) NULL,
	[EmpLastName] [nvarchar](50) NULL,
	[EmpStreetAddress] [nvarchar](250) NULL,
	[EmpCity] [nvarchar](50) NULL,
	[EmpState] [nvarchar](50) NULL,
	[EmpZipCode] [int] NULL,
	[EmpAreaCode] [smallint] NULL,
	[EmpPhoneNumber] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 20.01.2022 16:28:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[OrderNumber] [int] NOT NULL,
	[ProductNumber] [int] NOT NULL,
	[QuotedPrice] [int] NOT NULL,
	[QuantityOrdered] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 20.01.2022 16:28:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[OrderNumber] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NULL,
	[ShipDate] [date] NULL,
	[CustomerID] [int] NULL,
	[EmployeeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_vendors]    Script Date: 20.01.2022 16:28:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_vendors](
	[ProductNumber] [int] NOT NULL,
	[VendorID] [int] NOT NULL,
	[WholesalePrice] [int] NULL,
	[DaysToDeliver] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 20.01.2022 16:28:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[ProductNumber] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[ProductDescription] [nvarchar](100) NULL,
	[RetailPrice] [int] NULL,
	[QuantityOnHand] [nvarchar](50) NULL,
	[CategoryID] [int] NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[ProductNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendors]    Script Date: 20.01.2022 16:28:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendors](
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
	[VendName] [nvarchar](50) NULL,
	[VendStreetAddress] [nvarchar](150) NULL,
	[VendCity] [nvarchar](50) NULL,
	[VendState] [nvarchar](50) NULL,
	[VendZipCode] [int] NULL,
	[VendPhoneNumber] [nvarchar](50) NULL,
	[VendFaxNumber] [nvarchar](50) NULL,
	[VendWebPage] [nvarchar](50) NULL,
	[VendEmailAddress] [nvarchar](50) NULL,
 CONSTRAINT [PK_vendors] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK_order_details_orders] FOREIGN KEY([OrderNumber])
REFERENCES [dbo].[orders] ([OrderNumber])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK_order_details_orders]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[customers] ([CustomerID])
GO
ALTER TABLE [dbo].[orders]  WITH NOCHECK ADD  CONSTRAINT [FK_orders_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_employees]
GO
ALTER TABLE [dbo].[product_vendors]  WITH CHECK ADD  CONSTRAINT [FK_product_vendors_products] FOREIGN KEY([ProductNumber])
REFERENCES [dbo].[products] ([ProductNumber])
GO
ALTER TABLE [dbo].[product_vendors] CHECK CONSTRAINT [FK_product_vendors_products]
GO
ALTER TABLE [dbo].[product_vendors]  WITH CHECK ADD  CONSTRAINT [FK_product_vendors_vendors] FOREIGN KEY([VendorID])
REFERENCES [dbo].[vendors] ([VendorID])
GO
ALTER TABLE [dbo].[product_vendors] CHECK CONSTRAINT [FK_product_vendors_vendors]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[categories] ([CategoryID])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_categories]
GO
