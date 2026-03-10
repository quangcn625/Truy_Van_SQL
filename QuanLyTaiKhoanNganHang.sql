CREATE DATABASE QLTKNH;
USE QLTKNH;
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/2/2024 9:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [varchar](20) NOT NULL,
	[balance] [int] NULL,
	[start_date] [date] NULL,
	[ID_customer] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 4/2/2024 9:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[ID] [varchar](20) NOT NULL,
	[expire_date] [date] NULL,
	[ID_card_type] [varchar](20) NOT NULL,
	[ID_account] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardType]    Script Date: 4/2/2024 9:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardType](
	[ID] [varchar](20) NOT NULL,
	[type_name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/2/2024 9:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [varchar](20) NOT NULL,
	[name_customer] [nvarchar](100) NULL,
	[date_of_birth] [date] NULL,
	[address] [nvarchar](100) NULL,
	[identify_number] [varchar](20) NULL,
	[phone_number] [varchar](20) NULL,
	[ID_headquarter] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 4/2/2024 9:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [varchar](20) NOT NULL,
	[name_employee] [nvarchar](100) NULL,
	[date_of_birth] [date] NULL,
	[address] [nvarchar](100) NULL,
	[phone_number] [varchar](20) NULL,
	[ID_headquarter] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Headquarter]    Script Date: 4/2/2024 9:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Headquarter](
	[ID] [varchar](20) NOT NULL,
	[name_headquarter] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[phone_number] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionInfo]    Script Date: 4/2/2024 9:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionInfo](
	[ID] [varchar](20) NOT NULL,
	[transaction_date] [date] NOT NULL,
	[transaction_value] [int] NOT NULL,
	[ID_source_account] [varchar](20) NOT NULL,
	[ID_target_account] [varchar](20) NULL,
	[ID_employee] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([ID_customer])
REFERENCES [dbo].[Customer] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD FOREIGN KEY([ID_account])
REFERENCES [dbo].[Account] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD FOREIGN KEY([ID_card_type])
REFERENCES [dbo].[CardType] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([ID_headquarter])
REFERENCES [dbo].[Headquarter] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([ID_headquarter])
REFERENCES [dbo].[Headquarter] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TransactionInfo]  WITH CHECK ADD FOREIGN KEY([ID_employee])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[TransactionInfo]  WITH CHECK ADD FOREIGN KEY([ID_source_account])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[TransactionInfo]  WITH CHECK ADD FOREIGN KEY([ID_target_account])
REFERENCES [dbo].[Account] ([ID])
GO
