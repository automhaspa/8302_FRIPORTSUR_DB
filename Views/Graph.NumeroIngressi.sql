SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW [Graph].[NumeroIngressi]
AS
SELECT	CONVERT(SMALLDATETIME, DATA) AS XAxis, 'Numero missioni d''ingresso' AS Labels, N_Missioni AS YAxis 
FROM	AwmConfig.vNumeroIngressi
GO
