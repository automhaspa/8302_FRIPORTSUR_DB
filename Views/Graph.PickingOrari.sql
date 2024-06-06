SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE   VIEW [Graph].[PickingOrari]
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
		'Picking Conclusi'				AS Labels,
		PKC.N_Missioni					AS YAxis
FROM	Hours										H
LEFT	
JOIN	AwmConfig.Picking_Orari_Completate()		PKC
ON		PKC.DATA = H.DATA
UNION ALL
SELECT	CONVERT(SMALLDATETIME, H.DATA) 	AS XAxis,
		'Picking Iniziati'				AS Labels,
		PKI.N_Missioni					AS YAxis
FROM	Hours										H
LEFT
JOIN	AwmConfig.Picking_Orari_Iniziate()			PKI
ON		PKI.DATA = H.DATA
GO
