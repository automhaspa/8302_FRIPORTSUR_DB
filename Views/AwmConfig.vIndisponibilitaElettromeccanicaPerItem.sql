SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE   VIEW [AwmConfig].[vIndisponibilitaElettromeccanicaPerItem]
AS

SELECT * FROM [AwmConfig].[vFaultGiornalieriItem]
WHERE DATA = CONVERT(DATE, DATEADD(DAY,-1,GETDATE()))
GO
