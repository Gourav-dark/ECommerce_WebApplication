USE [ECommerce_WebApplication]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 2/3/2024 5:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/3/2024 5:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/3/2024 5:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/3/2024 5:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/3/2024 5:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/3/2024 5:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[City] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[PostalCode] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[StreetAddress] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 2/3/2024 5:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2/3/2024 5:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 2/3/2024 5:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[StreetAddress] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[PostalCode] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2/3/2024 5:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderHeaderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderHeaders]    Script Date: 2/3/2024 5:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHeaders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationUserId] [nvarchar](450) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[ShippingDate] [datetime2](7) NOT NULL,
	[OrderTotal] [float] NOT NULL,
	[OrderStatus] [nvarchar](max) NULL,
	[PaymentStatus] [nvarchar](max) NULL,
	[TrackingNumber] [nvarchar](max) NULL,
	[Carrier] [nvarchar](max) NULL,
	[PaymentDate] [datetime2](7) NOT NULL,
	[PaymentDueDate] [date] NOT NULL,
	[PaymentIntentId] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[StreetAddress] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[State] [nvarchar](max) NOT NULL,
	[PostalCode] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[SessionId] [nvarchar](max) NULL,
 CONSTRAINT [PK_OrderHeaders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/3/2024 5:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ISBN] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](max) NOT NULL,
	[ListPrice] [float] NOT NULL,
	[Price] [float] NOT NULL,
	[Price50] [float] NOT NULL,
	[Price100] [float] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCarts]    Script Date: 2/3/2024 5:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCarts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[ApplicationUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_ShoppingCarts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'0a761cf6-691b-4a50-a458-d9ef2e76c7cf', N'Employee', N'EMPLOYEE', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'a418ff4d-e1bb-4341-bf1c-f597f6e070eb', N'Company', N'COMPANY', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'abdede09-6484-487b-93e4-a961fee2137b', N'Customer', N'CUSTOMER', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'c10f25c5-d239-4e15-93c3-70d8bc0fa6f2', N'Admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e5d5ba30-443f-43fd-bba7-8a3b0dc92cea', N'a418ff4d-e1bb-4341-bf1c-f597f6e070eb')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2dc9a9ee-5c10-4762-868f-222767b9a588', N'abdede09-6484-487b-93e4-a961fee2137b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3c654797-3490-484f-9102-50fb9f03c842', N'abdede09-6484-487b-93e4-a961fee2137b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'901b7ea7-7e61-4ae0-abdf-224971aaf4b4', N'c10f25c5-d239-4e15-93c3-70d8bc0fa6f2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e218682d-a6af-4aef-97cd-e0c1eeb1b44a', N'c10f25c5-d239-4e15-93c3-70d8bc0fa6f2')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [City], [Discriminator], [Name], [PostalCode], [State], [StreetAddress], [CompanyId]) VALUES (N'2dc9a9ee-5c10-4762-868f-222767b9a588', N'test02@gmail.com', N'TEST02@GMAIL.COM', N'test02@gmail.com', N'TEST02@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEBzlxDPRJJop8H+ccmVRd0tIK6NIaMyV+jDIUS3veAb4AhXfX9oFW0EjDQGDJhdHXA==', N'P2AFFRL2NDH3IBXDDJONDI2I73YSN4XZ', N'954ab6c7-89b1-4b7c-9cfb-0590731d9e0d', N'7896413123', 0, 0, NULL, 1, 0, N'pp', N'ApplicationUser', N'Test', N'785466', N'up', N'tt', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [City], [Discriminator], [Name], [PostalCode], [State], [StreetAddress], [CompanyId]) VALUES (N'3c654797-3490-484f-9102-50fb9f03c842', N'customer@gmail.com', N'CUSTOMER@GMAIL.COM', N'customer@gmail.com', N'CUSTOMER@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEA+M4Wm3q8uvFYAmyvdeyOA9Z0KLgGLMmaQiGBY1Q/FGB+oW/Z0yyhDue0gfh2D2Bw==', N'DLUKTK4Q577MIOMLNRMRQC4SHP6UBG3Y', N'58e69375-8172-4791-87b3-43c99f7d92aa', N'7896857432', 0, 0, NULL, 1, 0, N'Pune', N'ApplicationUser', N'Customer User', N'965474', N'BH', N'City House', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [City], [Discriminator], [Name], [PostalCode], [State], [StreetAddress], [CompanyId]) VALUES (N'901b7ea7-7e61-4ae0-abdf-224971aaf4b4', N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEC+Rr8CvWRKF/5kMdGg+JFZPw3XAseti9STj+kVqUX3a6rqRSpFeEzoihwTxBmcwKw==', N'ZNFZVP2M3POU7J57HZ7HWCH4HVL22G4H', N'bd1f4525-943a-41b1-b21f-9d69df2f4f03', N'0000000000', 0, 0, NULL, 1, 0, N'xxxxxxxxxxxxxx', N'ApplicationUser', N'Admin User', N'000000', N'xxxxxxxxx', N'xxxxxxxxxx', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [City], [Discriminator], [Name], [PostalCode], [State], [StreetAddress], [CompanyId]) VALUES (N'e218682d-a6af-4aef-97cd-e0c1eeb1b44a', N'admin01@gmail.com', N'ADMIN01@GMAIL.COM', N'admin01@gmail.com', N'ADMIN01@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEB1yu+vEqdwhHX08R6LaqkvbABslqrt4/bak6JKmt8Zj88vSXWRCExkxVCx3tKAXlg==', N'WF6QDS4XIVVFVRQAN2HFC2VEKDJXA2DS', N'88b5b10c-24b7-4486-9770-3520a1696f53', N'8767667768', 0, 0, NULL, 1, 0, N'pg', N'ApplicationUser', N'Admin', N'784565', N'UP', N'up', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [City], [Discriminator], [Name], [PostalCode], [State], [StreetAddress], [CompanyId]) VALUES (N'e5d5ba30-443f-43fd-bba7-8a3b0dc92cea', N'company@gmail.com', N'COMPANY@GMAIL.COM', N'company@gmail.com', N'COMPANY@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEPFlGNksLeneHAoOCIi+H6ngtAkMGuuSZCsnEAIqr5th3+zELbk5xul/tarjuzwojQ==', N'QXCUUHUBKHG52XVTWFEFSTNDSUVOPA5V', N'c30d333b-56e4-49d8-8a28-fd914b81d168', N'9674583245', 0, 0, NULL, 1, 0, N'Gaya', N'ApplicationUser', N'Company User', N'657435', N'PH', N'Dream Home', 1)
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder]) VALUES (1, N'Action', 2)
INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder]) VALUES (2, N'SciFi', 6)
INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder]) VALUES (3, N'History', 4)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([Id], [Name], [StreetAddress], [City], [State], [PostalCode], [PhoneNumber]) VALUES (1, N'Tech Solution', N'123 Tech St', N'Tech City', N'IL', N'12121', N'6669990000')
INSERT [dbo].[Companies] ([Id], [Name], [StreetAddress], [City], [State], [PostalCode], [PhoneNumber]) VALUES (2, N'Vivid Books', N'999 Vid St', N'Vid City', N'IL', N'66666', N'7779990000')
INSERT [dbo].[Companies] ([Id], [Name], [StreetAddress], [City], [State], [PostalCode], [PhoneNumber]) VALUES (3, N'Readers Club', N'999 Main St', N'Lala land', N'NY', N'99999', N'1113335555')
INSERT [dbo].[Companies] ([Id], [Name], [StreetAddress], [City], [State], [PostalCode], [PhoneNumber]) VALUES (5, N'Cognizant Technology Solutions India Pvt. Ltd', N'Pallikaranai Office, THORAIPAKAM PALLAVARAM 200 FEET ROAD Near Valacheri', N'Thoraipakkam', N'Chennai', N'600096', N'+91 44 4349 1000')
SET IDENTITY_INSERT [dbo].[Companies] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price]) VALUES (2022, 2010, 1, 50, 90)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price]) VALUES (2023, 2010, 3, 75, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price]) VALUES (2024, 2011, 6, 1201, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price]) VALUES (2025, 2011, 3, 201, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price]) VALUES (2026, 2012, 3, 10, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price]) VALUES (3022, 3010, 2, 6, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price]) VALUES (3023, 3011, 2, 6, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price]) VALUES (3024, 3012, 2, 6, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price]) VALUES (3025, 3012, 1, 1, 90)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderHeaders] ON 

INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name], [SessionId]) VALUES (2010, N'3c654797-3490-484f-9102-50fb9f03c842', CAST(N'2023-08-27T21:08:26.7377149' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 7500, N'Cancelled', N'Refunded', NULL, NULL, CAST(N'2023-08-27T21:09:17.6113158' AS DateTime2), CAST(N'0001-01-01' AS Date), N'pi_3Njl3RSAiaOoVMqV1lTBn5Wt', N'7896857432', N'City House', N'Pune', N'BH', N'965474', N'Customer User', N'cs_test_b1fMhYa6susyCRUOYwa50Gi9YodYBm3Y5fhy0FERQb8sjSpETiCWerosDz')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name], [SessionId]) VALUES (2011, N'e5d5ba30-443f-43fd-bba7-8a3b0dc92cea', CAST(N'2023-08-27T21:12:56.0682615' AS DateTime2), CAST(N'2023-08-27T21:17:40.4378198' AS DateTime2), 31055, N'Shipped', N'ApprovedForDelayedPayment', N'757846465432', N'UDERTG', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-26' AS Date), NULL, N'9674583245', N'Dream Home', N'Gaya', N'PH', N'6574350', N'Company User', N'cs_test_b15zJlGr96Ybj0tvjPfvLt43vcgmhTQEv1aX9PuXNliBxBEwB7qBGCVaKm')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name], [SessionId]) VALUES (2012, N'e5d5ba30-443f-43fd-bba7-8a3b0dc92cea', CAST(N'2023-08-27T21:56:38.9890245' AS DateTime2), CAST(N'2023-08-27T21:57:29.2052373' AS DateTime2), 500, N'Shipped', N'Approved', N'dfgdfgfd', N'dgfdgfd', CAST(N'2023-08-27T22:00:10.4845640' AS DateTime2), CAST(N'2023-09-26' AS Date), N'pi_3NjlqaSAiaOoVMqV07NCzxIZ', N'9674583245', N'Dream Home', N'Gaya', N'PH', N'657435', N'Company User', N'cs_test_a14IYZCTYzClSQ7SdCVE8GIzCLsn8fZPQGJ2ZXCURBrjaj6FFRHFESSxpP')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name], [SessionId]) VALUES (3010, N'2dc9a9ee-5c10-4762-868f-222767b9a588', CAST(N'2024-01-26T21:27:19.7783274' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 180, N'Pending', N'Pending', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01' AS Date), NULL, N'7896413123', N'tt', N'pp', N'up', N'785466', N'Test', N'cs_test_a1Y6CHVjohGPIJMJbwkqlC5JFPyPeXnishg0sujRESHgSPOGWfrWPiyVkd')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name], [SessionId]) VALUES (3011, N'2dc9a9ee-5c10-4762-868f-222767b9a588', CAST(N'2024-01-26T21:31:57.7161895' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 180, N'Pending', N'Pending', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01' AS Date), NULL, N'7896413123', N'tt', N'pp', N'up', N'785466', N'Test', N'cs_test_a1eTsc4KaO76XKz7EQ75PXc5l5rLWF6pDiR523TUcsKrcZcyBcTQMkDBZM')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name], [SessionId]) VALUES (3012, N'2dc9a9ee-5c10-4762-868f-222767b9a588', CAST(N'2024-01-26T21:38:11.9322013' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 270, N'Pending', N'Pending', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01' AS Date), NULL, N'7896413123', N'tt', N'pp', N'up', N'785466', N'Test', N'cs_test_b1oetMhbmFRbRg3iFCQJ95mJ3GqT0qjRC5CO1ZyyNie7L1FnzzJj5gCELs')
SET IDENTITY_INSERT [dbo].[OrderHeaders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Title], [Description], [ISBN], [Author], [ListPrice], [Price], [Price50], [Price100], [CategoryId], [ImageUrl]) VALUES (1, N'Fortune of Time', N'Praesent vitae sodales libero. Praesent molestie orci augue, vitae euismod velit sollicitudin ac. Praesent vestibulum facilisis nibh ut ultricies.

Nunc malesuada viverra ipsum sit amet tincidunt. ', N'SWD9999001', N'Billy Spark', 99, 90, 85, 80, 1, N'\images\product\e796d8ea-470a-4dad-a67f-f2079163010d.jpg')
INSERT [dbo].[Products] ([Id], [Title], [Description], [ISBN], [Author], [ListPrice], [Price], [Price50], [Price100], [CategoryId], [ImageUrl]) VALUES (2, N'Dark Skies', N'Praesent vitae sodales libero. Praesent molestie orci augue, vitae euismod velit sollicitudin ac. Praesent vestibulum facilisis nibh ut ultricies.

Nunc malesuada viverra ipsum sit amet tincidunt. ', N'CAW777777701', N'Nancy Hoover', 40, 30, 25, 20, 2, N'\images\product\bac0e0a7-d66d-468a-bf0c-e4fc21ecfcd9.jpg')
INSERT [dbo].[Products] ([Id], [Title], [Description], [ISBN], [Author], [ListPrice], [Price], [Price50], [Price100], [CategoryId], [ImageUrl]) VALUES (3, N'Vanish in the Sunset', N'Praesent vitae sodales libero. Praesent molestie orci augue, vitae euismod velit sollicitudin ac. Praesent vestibulum facilisis nibh ut ultricies.

Nunc malesuada viverra ipsum sit amet tincidunt. ', N'RITO5555501', N'Julian Button', 55, 50, 40, 35, 3, N'\images\product\9d5abd10-63e8-4d1c-8bdd-16caf599a16b.jpeg')
INSERT [dbo].[Products] ([Id], [Title], [Description], [ISBN], [Author], [ListPrice], [Price], [Price50], [Price100], [CategoryId], [ImageUrl]) VALUES (4, N'Cotton Candy', N'Praesent vitae sodales libero. Praesent molestie orci augue, vitae euismod velit sollicitudin ac. Praesent vestibulum facilisis nibh ut ultricies.

Nunc malesuada viverra ipsum sit amet tincidunt. ', N'WS3333333301', N'Abby Muscles', 70, 65, 60, 55, 3, N'\images\product\2f975fe3-fce2-453e-8ef3-98d92d164046.jpg')
INSERT [dbo].[Products] ([Id], [Title], [Description], [ISBN], [Author], [ListPrice], [Price], [Price50], [Price100], [CategoryId], [ImageUrl]) VALUES (5, N'Rock in the Ocean', N'Praesent vitae sodales libero. Praesent molestie orci augue, vitae euismod velit sollicitudin ac. Praesent vestibulum facilisis nibh ut ultricies.

Nunc malesuada viverra ipsum sit amet tincidunt. ', N'SOTJ1111111101', N'Ron Parker', 30, 27, 25, 20, 2, N'\images\product\04216f3c-2655-4f7b-8f1c-e359afc51bfa.jpg')
INSERT [dbo].[Products] ([Id], [Title], [Description], [ISBN], [Author], [ListPrice], [Price], [Price50], [Price100], [CategoryId], [ImageUrl]) VALUES (6, N'Leaves and Wonders', N'Praesent vitae sodales libero. Praesent molestie orci augue, vitae euismod velit sollicitudin ac. Praesent vestibulum facilisis nibh ut ultricies.

Nunc malesuada viverra ipsum sit amet tincidunt. ', N'FOT000000001', N'Laura Phantom', 25, 23, 22, 20, 1, N'\images\product\bcafd19c-5337-4a96-bc51-a9a347686ce3.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ShoppingCarts] ON 

INSERT [dbo].[ShoppingCarts] ([Id], [ProductId], [Count], [ApplicationUserId]) VALUES (4010, 2, 6, N'e5d5ba30-443f-43fd-bba7-8a3b0dc92cea')
INSERT [dbo].[ShoppingCarts] ([Id], [ProductId], [Count], [ApplicationUserId]) VALUES (4011, 4, 1, N'e5d5ba30-443f-43fd-bba7-8a3b0dc92cea')
INSERT [dbo].[ShoppingCarts] ([Id], [ProductId], [Count], [ApplicationUserId]) VALUES (4012, 4, 5, N'3c654797-3490-484f-9102-50fb9f03c842')
INSERT [dbo].[ShoppingCarts] ([Id], [ProductId], [Count], [ApplicationUserId]) VALUES (4015, 3, 4, N'3c654797-3490-484f-9102-50fb9f03c842')
INSERT [dbo].[ShoppingCarts] ([Id], [ProductId], [Count], [ApplicationUserId]) VALUES (4016, 2, 6, N'2dc9a9ee-5c10-4762-868f-222767b9a588')
INSERT [dbo].[ShoppingCarts] ([Id], [ProductId], [Count], [ApplicationUserId]) VALUES (4017, 1, 1, N'2dc9a9ee-5c10-4762-868f-222767b9a588')
SET IDENTITY_INSERT [dbo].[ShoppingCarts] OFF
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [Discriminator]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [CategoryId]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (N'') FOR [ImageUrl]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_Companies_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_Companies_CompanyId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_OrderHeaders_OrderHeaderId] FOREIGN KEY([OrderHeaderId])
REFERENCES [dbo].[OrderHeaders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_OrderHeaders_OrderHeaderId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products_ProductId]
GO
ALTER TABLE [dbo].[OrderHeaders]  WITH CHECK ADD  CONSTRAINT [FK_OrderHeaders_AspNetUsers_ApplicationUserId] FOREIGN KEY([ApplicationUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderHeaders] CHECK CONSTRAINT [FK_OrderHeaders_AspNetUsers_ApplicationUserId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[ShoppingCarts]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCarts_AspNetUsers_ApplicationUserId] FOREIGN KEY([ApplicationUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShoppingCarts] CHECK CONSTRAINT [FK_ShoppingCarts_AspNetUsers_ApplicationUserId]
GO
ALTER TABLE [dbo].[ShoppingCarts]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCarts_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShoppingCarts] CHECK CONSTRAINT [FK_ShoppingCarts_Products_ProductId]
GO
