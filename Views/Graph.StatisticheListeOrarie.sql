SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW [Graph].[StatisticheListeOrarie]
AS
SELECT	CONVERT(SMALLDATETIME, DATA) AS XAxis, 'Liste Evase' AS Labels, N_Liste_Evase AS YAxis 
FROM	AwmConfig.vStatisticheListeOrarie
GO
