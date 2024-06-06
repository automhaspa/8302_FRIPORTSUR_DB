SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   VIEW [AwmConfig].[vTempoEsecuzioneIngressi]
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
	SELECT	AVG(DATEDIFF(SECOND,MS.Data_Creazione, MS.Data_Storicizzazione))	Durata_AVG, 		
			MAX(DATEDIFF(SECOND,MS.Data_Creazione, MS.Data_Storicizzazione))	Durata_MAX,	
			MIN(DATEDIFF(SECOND,MS.Data_Creazione, MS.Data_Storicizzazione))	Durata_MIN,
			D.DATA
	FROM	Days D
	JOIN	dbo.Missioni_Storico	MS
	ON		D.DATA = CONVERT(DATE,MS.Data_Storicizzazione)
	AND		D.DATA = CONVERT(DATE,MS.Data_Creazione)
	JOIN	dbo.Partizioni				PD
	ON		Pd.ID_PARTIZIONE = MS.Id_Partizione_Destinazione
	WHERE	MS.Id_Tipo_Missione IN('ING', 'INA')		
		AND MS.Stato_Missione = 'TOK'
		AND PD.DESCRIZIONE LIKE '__W%'
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
