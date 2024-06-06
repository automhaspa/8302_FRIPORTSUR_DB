SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW [Graph].[DimensioniListeUscita]
AS
SELECT	CONVERT(SMALLDATETIME, DATA) AS XAxis, 'Dimensione media ordine' AS Labels, N_Righe_AVG AS YAxis 
FROM	AwmConfig.vDimensioniListeUscita
UNION ALL
SELECT	CONVERT(SMALLDATETIME, DATA) AS XAxis, 'Dimensione massima ordine' AS Labels, N_Righe_MAX AS YAxis 
FROM	AwmConfig.vDimensioniListeUscita
UNION ALL
SELECT	CONVERT(SMALLDATETIME, DATA) AS XAxis, 'Dimensione minima ordine' AS Labels, N_Righe_Min AS YAxis 
FROM	AwmConfig.vDimensioniListeUscita
GO
