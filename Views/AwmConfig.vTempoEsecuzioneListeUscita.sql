SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   VIEW [AwmConfig].[vTempoEsecuzioneListeUscita]
AS	
WITH Days AS
(

	SELECT 1 DayBefore, DATEFROMPARTS(YEAR(GETDATE()),MONTH(GETDATE()),DAY(GETDATE())) AS DATA
	UNION 
	ALL
	SELECT	Days.DayBefore + 1 , CONVERT(DATE,DATEADD(DAY, -1,Days.DATA))
	FROM	Days
	WHERE	Days.DayBefore < 30
), Tempi AS
(
	SELECT	AVG(DATEDIFF(SECOND,L.Data_Esecuzione, L.Data_Evasione))/60	Durata_AVG, 		
			MAX(DATEDIFF(SECOND,L.Data_Esecuzione, L.Data_Evasione))/60	Durata_MAX,	
			MIN(DATEDIFF(SECOND,L.Data_Esecuzione, L.Data_Evasione))/60	Durata_MIN,
			D.DATA
	FROM	Days D
	JOIN	dbo.Liste	L
	ON		D.DATA = CONVERT(DATE,L.Data_Evasione)
	AND		D.DATA = CONVERT(DATE,L.Data_Esecuzione)
	AND		DATEDIFF(SECOND,L.Data_Esecuzione, L.Data_Evasione) > 59
	WHERE	L.Id_Tipo_Lista = 'TDO'
	GROUP
	BY		D.DATA	
)
SELECT	D.DATA,
		T.Durata_AVG,
		T.Durata_MAX,
		T.Durata_MIN		
FROM	Days				D
LEFT	
JOIN	Tempi				T
ON		T.DATA = D.DATA
GO
