USE [ProdIT_Firmstep]
GO

/****** Object:  StoredProcedure [dbo].[ListStreetAppType]    Script Date: 23/09/2019 09:06:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniel Gregory
-- Create date: 10/10/2017
-- Description:	List types of application for street nameing
-- =============================================
CREATE PROCEDURE [dbo].[ListStreetAppType]  
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT DISTINCT ApplicationType as name, ApplicationType as display
	FROM dbo.StreetNaming
	ORDER BY ApplicationType;
END


GO

