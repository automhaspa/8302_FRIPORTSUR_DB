SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW [Graph].[NumeroUscite]
AS
SELECT	CONVERT(SMALLDATETIME, DATA) AS XAxis, 'Numero missioni d''uscita' AS Labels, N_Missioni AS YAxis 
FROM	AwmConfig.vNumeroUscite
GO
