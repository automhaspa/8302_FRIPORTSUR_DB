SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW [Graph].[TempoEsecuzioneListeUscita]
AS
SELECT	CONVERT(SMALLDATETIME, DATA) AS XAxis, 'Durata media minuti' AS Labels, Durata_AVG AS YAxis 
FROM	AwmConfig.vTempoEsecuzioneListeUscita
UNION ALL
SELECT	CONVERT(SMALLDATETIME, DATA) AS XAxis, 'Durata massima minuti' AS Labels, Durata_MAX AS YAxis 
FROM	AwmConfig.vTempoEsecuzioneListeUscita
UNION ALL
SELECT	CONVERT(SMALLDATETIME, DATA) AS XAxis, 'Durata minima minuti' AS Labels, Durata_MIN AS YAxis 
FROM	AwmConfig.vTempoEsecuzioneListeUscita
GO
