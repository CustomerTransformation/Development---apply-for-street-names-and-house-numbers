USE [ProdPayments]
GO

/****** Object:  Table [dbo].[Card_Payment]    Script Date: 23/09/2019 09:04:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Card_Payment](
	[PayID] [int] IDENTITY(1,1) NOT NULL,
	[PayCode] [nvarchar](100) NOT NULL,
	[Amount] [money] NULL,
	[payQuantity] [decimal](10, 5) NULL,
	[payDescription] [nvarchar](max) NULL,
	[payReference] [nvarchar](100) NOT NULL,
	[payAdditionalRef] [nvarchar](20) NULL,
	[payFundCode] [nvarchar](5) NOT NULL,
	[payNarrative] [nvarchar](max) NULL,
	[paySurcharge] [nvarchar](5) NULL,
	[payVatCode] [nvarchar](5) NULL,
	[payVatRate] [nvarchar](5) NULL,
	[includesVAT] [nvarchar](5) NULL,
	[DepartmentEmail] [varchar](100) NULL,
	[AdditionalMsg] [varchar](max) NULL,
 CONSTRAINT [PK_Card_Payment] PRIMARY KEY CLUSTERED 
(
	[PayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

