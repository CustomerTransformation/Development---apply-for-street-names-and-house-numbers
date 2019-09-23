USE [ProdIT_Firmstep]
GO

/****** Object:  StoredProcedure [dbo].[AddUpdateStreetPrice]    Script Date: 23/09/2019 09:06:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniela Dutu
-- Create date: 10/10/2017
-- Description:	Calculates cost for Street Naming form
-- =============================================
CREATE PROCEDURE [dbo].[AddUpdateStreetPrice] 
	-- Add the parameters for the stored procedure here
			@ID as int
			,@ApplicationType as varchar(500)
           ,@minPlot as int
           ,@maxPlot as int
           ,@baseCost as numeric(5,2)
           ,@perPlotCost as numeric(5,2)
           ,@payCode as varchar(10)
           ,@UserName as varchar(50)
          
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @curr_ApplicationType as varchar(500)
	DECLARE @curr_minPlot as int
	DECLARE @curr_maxPlot as int
	DECLARE @curr_baseCost as numeric(5,2)
	DECLARE @curr_perPlotCost as numeric(5,2)
	DECLARE @curr_payCode as varchar(10)
	
	IF @ID > 0
	BEGIN
		SELECT @curr_ApplicationType=ApplicationType, @curr_minPlot=minPlot, @curr_maxPlot=maxPlot, @curr_baseCost=baseCost, @curr_perPlotCost=perPlotCost, @curr_payCode=payCode
		FROM StreetNaming
		WHERE ID=@ID
		
		IF (@curr_ApplicationType!=@ApplicationType OR @curr_minPlot!=@minPlot OR @curr_maxPlot!=@maxPlot OR @curr_baseCost!=@baseCost OR @curr_perPlotCost!=@perPlotCost OR @curr_payCode!=@payCode)
		BEGIN
			UPDATE StreetNaming
			SET ApplicationType=@ApplicationType,  minPlot=@minPlot, maxPlot=@maxPlot, baseCost = @baseCost, perPlotCost=@perPlotCost, payCode=payCode
			WHERE ID=@ID;
		END
		
    END
    
    IF @ID IS NULL
    BEGIN
		INSERT INTO StreetNaming (ID, ApplicationType, minPlot, maxPlot, baseCost,perPlotCost,payCode, CreatedBy, CreatedDate, LastModifiedBy, LastModifiedDate)
		VALUES (@ID, @ApplicationType, @minPlot, @maxPlot, @baseCost,@perPlotCost,@payCode, @UserName, GetDate(), @UserName, GetDate())
	END
END
GO

