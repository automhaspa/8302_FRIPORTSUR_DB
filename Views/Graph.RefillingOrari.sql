SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW [Graph].[RefillingOrari]
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
		'Refilling Conclusi'			AS Labels,
		RC.N_Missioni					AS YAxis
FROM	Hours										H
LEFT
JOIN	AwmConfig.Refilling_Orari_Completati()		RC
ON		RC.DATA = H.DATA
UNION ALL
SELECT	CONVERT(SMALLDATETIME, H.DATA) 	AS XAxis,
		'Refilling Iniziati'			AS Labels,
		RI.N_Missioni					AS YAxis
FROM	Hours										H
LEFT
JOIN	AwmConfig.Refilling_Orari_Iniziati()		RI
ON		RI.DATA = H.DATA
GO
