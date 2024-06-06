SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE   VIEW	 [Graph].[StatisticheGiornaliere]
AS
SELECT	CONVERT(SMALLDATETIME, DATA) AS XAxis, 'Outbound' AS Labels, N_Outbound AS YAxis 
FROM	AwmConfig.vStatistiche
UNION
ALL
SELECT	CONVERT(SMALLDATETIME, DATA) AS XAxis, 'Inbound' AS Labels, N_Inbound AS YAxis 
FROM	AwmConfig.vStatistiche
UNION
ALL
SELECT	CONVERT(SMALLDATETIME, DATA) AS XAxis, 'Totale' AS Labels, N_Totale AS YAxis 
FROM	AwmConfig.vStatistiche
UNION
ALL
SELECT	CONVERT(SMALLDATETIME, DATA) AS XAxis, 'Rejection' AS Labels, N_Rejection AS YAxis 
FROM	AwmConfig.vStatistiche
GO
