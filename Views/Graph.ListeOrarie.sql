SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE   VIEW [Graph].[ListeOrarie]
AS	
WITH Hours AS
(	
	SELECT 1 HourBefore, SMALLDATETIMEFROMPARTS(YEAR(GETDATE()),MONTH(GETDATE()),DAY(GETDATE()),DATEPART(HOUR,GETDATE()),0) AS DATA
	UNION 
	ALL
	SELECT	HourBefore + 1 , DATEADD(HOUR, -1, Hours.DATA)
	FROM	Hours
	WHERE	Hours.HourBefore < 24
)
SELECT	CONVERT(SMALLDATETIME, H.DATA) 	AS XAxis,
		'Liste Evase'					AS Labels,
		N_Liste							AS YAxis
FROM	Hours											H
LEFT
JOIN	AwmConfig.Liste_Uscita_Orarie_Completate()		LC
ON		LC.DATA = H.DATA
UNION ALL
SELECT	CONVERT(SMALLDATETIME, H.DATA) 	AS XAxis,
		'Liste Richieste'				AS Labels,
		LR.N_Liste						AS YAxis
FROM	Hours											H
LEFT
JOIN	AwmConfig.Liste_Uscita_Orarie_Richieste()		LR
ON		LR.DATA = H.DATA
GO
