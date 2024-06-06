SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   VIEW [AwmConfig].[vStatisticheListeOrarie]
AS	

WITH Hours AS
(

	SELECT 1 HourBefore, SMALLDATETIMEFROMPARTS(YEAR(GETDATE()),MONTH(GETDATE()),DAY(GETDATE()),DATEPART(HOUR,GETDATE()),0) AS DATA

	UNION 
	ALL
	SELECT	Hours.HourBefore + 1 , DATEADD(HOUR, -1, Hours.DATA)
	FROM	Hours
	WHERE	Hours.HourBefore < 24
	
), Liste_Evase AS
(
	SELECT	COUNT(DISTINCT L.Id_Lista) N_Liste_Evase, 
			H.DATA
	FROM	Hours H
	JOIN	dbo.Liste L
	ON		H.DATA <= L.Data_Evasione
	AND		DATEADD(HOUR,1, H.DATA)  > L.Data_Evasione
	WHERE	L.Id_Tipo_Lista = 'TDO'
		AND L.Id_Tipo_Stato_Lista > 5
	GROUP
	BY		H.DATA	
)
SELECT	H.DATA,
        LE.N_Liste_Evase

FROM	Hours				H
LEFT	
JOIN	Liste_Evase			LE
ON		LE.DATA = H.DATA
GO
