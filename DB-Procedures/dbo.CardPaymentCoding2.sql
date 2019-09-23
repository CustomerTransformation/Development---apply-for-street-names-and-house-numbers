USE [ProdPayments]
GO

/****** Object:  StoredProcedure [dbo].[CardPaymentCoding2]    Script Date: 23/09/2019 09:05:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniel Gregory
-- Create date: 30/05/2017
-- Description:	Load Values for the Payment integration SubForm
-- =============================================
CREATE PROCEDURE [dbo].[CardPaymentCoding2] 
	@payCode2 nchar(10)
	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT payQuantity as payQuantity2, payDescription as payDescription2, payReference as payReference2, payAdditionalRef as payAdditionalRef2, payFundCode as payFundCode2, payNarrative as payNarrative2, includesVAT as includesVAT2, payVatCode as payVatCode2, payVatRate as payVatRate2, paySurcharge as paySurcharge2, DepartmentEmail, AdditionalMsg
	FROM Card_Payment
	WHERE PayCode = @payCode2
END

GO

