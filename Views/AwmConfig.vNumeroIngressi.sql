SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   VIEW [AwmConfig].[vNumeroIngressi]
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
	SELECT	COUNT(DISTINCT MS.Id_Missione) AS N_Missioni,
			D.DATA
	FROM	Days D
	JOIN	dbo.Missioni_Storico	MS
	ON		D.DATA = CONVERT(DATE,MS.Data_Storicizzazione)
	AND		D.DATA = CONVERT(DATE,MS.Data_Creazione)
	JOIN	dbo.Partizioni			PD
	ON		Pd.ID_PARTIZIONE = MS.Id_Partizione_Destinazione
	WHERE	MS.Id_Tipo_Missione IN('ING', 'INA')		
		AND MS.Stato_Missione = 'TOK'
		AND PD.DESCRIZIONE LIKE '__W%'

	GROUP
	BY		D.DATA	
)
SELECT	D.DATA,
		T.N_Missioni		
FROM	Days				D
LEFT	
JOIN	Tempi				T
ON		T.DATA = D.DATA
GO
