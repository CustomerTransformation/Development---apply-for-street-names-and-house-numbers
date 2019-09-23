USE [ProdIT_Firmstep]
GO

/****** Object:  StoredProcedure [dbo].[StreetPriceFees]    Script Date: 23/09/2019 09:07:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniela Dutu
-- Create date: 08/06/2018
-- Description:	gets the prices from the table StreetNaming
-- =============================================
CREATE PROCEDURE [dbo].[StreetPriceFees]
	-- Add the parameters for the stored procedure here
	@Type AS varchar (500),
	@Number AS int,
	@numberFlat AS int,
	@numberBlocks AS int,
	@numberOfPlots AS int,
	@PlotNumber620 AS int,
	@PlotNumber21100 AS int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @basePrice AS int
	DECLARE @perPlotCost AS int
	DECLARE @payCode AS varchar (10)
	DECLARE @payCodeFlat AS varchar (10)
	DECLARE @costOut int
	DECLARE @flatCost int
	DECLARE @mixedPropertiesCost int
	DECLARE @VAT AS int
	
	SELECT @basePrice = [baseCost],@perPlotCost = [perPlotCost],@payCode = [payCode], @VAT = VAT
	FROM dbo.StreetNaming
	WHERE ApplicationType = @Type
	AND
	minPlot <= @Number
	AND
	maxPlot >= @Number
	
	Select @payCode AS payCode, @VAT AS VAT
END
GO

