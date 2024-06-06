SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW [Graph].[UsciteOrarie]
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
		'Udc Estratte'					AS Labels,
		MC.N_Missioni					AS YAxis
FROM	Hours					H
LEFT	
JOIN	AwmConfig.Missioni_Uscita_Orarie_Completate()	MC
ON		MC.DATA = H.DATA
UNION ALL
SELECT	CONVERT(SMALLDATETIME, H.DATA) 	AS XAxis,
		'Udc Richieste'					AS Labels,
		MI.N_Missioni					AS YAxis
FROM	Hours					H
LEFT
JOIN	AwmConfig.Missioni_Uscita_Orarie_Iniziate()		MI
ON		MI.DATA = H.DATA

GO
