SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW [Graph].[TempoEsecuzioneUscite]
AS
SELECT	CONVERT(SMALLDATETIME, DATA) AS XAxis, 'Durata media secondi' AS Labels, Durata_AVG AS YAxis 
FROM	AwmConfig.vTempoEsecuzioneUscite
UNION ALL
SELECT	CONVERT(SMALLDATETIME, DATA) AS XAxis, 'Durata massima secondi' AS Labels, Durata_MAX AS YAxis 
FROM	AwmConfig.vTempoEsecuzioneUscite
UNION ALL
SELECT	CONVERT(SMALLDATETIME, DATA) AS XAxis, 'Durata minima secondi' AS Labels, Durata_MIN AS YAxis 
FROM	AwmConfig.vTempoEsecuzioneUscite
GO
