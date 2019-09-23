USE [ProdIT_Firmstep]
GO

/****** Object:  StoredProcedure [dbo].[StreetPriceCalculation]    Script Date: 23/09/2019 09:07:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniela Dutu
-- Create date: 10/10/2017
-- Description:	calculates cost for Street Renaming form
-- =============================================
CREATE PROCEDURE [dbo].[StreetPriceCalculation]
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
	--if there are only blocks and flats (no houses)
	IF @numberBlocks >= 1 AND ( @numberOfPlots IS NULL OR @numberOfPlots = '' )
		BEGIN
			SET @payCodeFlat = 'SNN05'
		
		
			SET @flatCost = (200 * @numberBlocks)+ (10*@numberFlat)
			IF @flatCost > 950
			BEGIN
			SET @flatCost = 950
			END
			SELECT @flatCost AS TotalCost, 'SNN05' AS payCode

		END  
	ELSE
	BEGIN
	--if there is a request without blocks and flats
		IF @numberBlocks IS NULL OR @numberBlocks = ''
			BEGIN	
			SET @costOut = @basePrice + (@perPlotCost*(@Number -(ISNULL(@PlotNumber620,0) + ISNULL(@PlotNumber21100, 0))))
			IF @costOut > 950
			BEGIN
			SET @costOut = 950
			END
			SELECT @costOut AS TotalCost, @payCode AS payCode, @VAT AS VAT	
			END

		
		ELSE
	--if there are blocks, flats and houses
		BEGIN
				SET @mixedPropertiesCost = @basePrice + (@perPlotCost*(@Number -(ISNULL(@PlotNumber620,0) + ISNULL(@PlotNumber21100, 0))))+ (200 * (@numberBlocks)+ (10*@numberFlat))
				IF @mixedPropertiesCost > 950
				BEGIN
				SET @mixedPropertiesCost = 950
				END
				SELECT @mixedPropertiesCost AS TotalCost, @payCode AS payCode, 'SNN05'AS payCodeFlat, @VAT AS VAT
		END  
	END
	
			
			
		
	      
END
GO

