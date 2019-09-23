USE [ProdIT_Firmstep]
GO

/****** Object:  Table [dbo].[StreetNaming]    Script Date: 23/09/2019 09:05:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[StreetNaming](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationType] [varchar](500) NOT NULL,
	[minPlot] [int] NOT NULL,
	[maxPlot] [int] NOT NULL,
	[baseCost] [numeric](5, 2) NOT NULL,
	[perPlotCost] [numeric](5, 2) NOT NULL,
	[payCode] [varchar](10) NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastModifiedBy] [varchar](50) NULL,
	[LastModifiedDate] [datetime] NULL,
	[VAT] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

