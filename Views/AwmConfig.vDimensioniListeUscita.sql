SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   VIEW [AwmConfig].[vDimensioniListeUscita]
AS	

WITH Days AS
(

	SELECT 1 DayBefore, DATEFROMPARTS(YEAR(GETDATE()),MONTH(GETDATE()),DAY(GETDATE())) AS DATA
	UNION 
	ALL
	SELECT	Days.DayBefore + 1 , CONVERT(DATE,DATEADD(DAY, -1,Days.DATA))
	FROM	Days
	WHERE	Days.DayBefore < 30
), Liste_Dettaglio_Gruppata AS
(
	SELECT	COUNT(DISTINCT LD.Id_Lista_Dettaglio) N_Righe,
			LD.Id_Lista
	FROM	dbo.Liste_Dettaglio LD
	GROUP
	BY		LD.Id_Lista
), Liste_Create AS
(
	SELECT	COUNT(DISTINCT L.Id_Lista)				N_Liste, 
			SUM(LD.N_Righe)	N_Righe, 			
			AVG(LD.N_Righe)	N_Righe_AVG, 		
			MAX(LD.N_Righe)	N_Righe_MAX,	
			MIN(LD.N_Righe)	N_Righe_MIN,
			D.DATA
	FROM	Days D
	JOIN	dbo.Liste L
	ON		D.DATA = CONVERT(DATE,L.Data_Creazione)
	LEFT
	JOIN	Liste_Dettaglio_Gruppata LD
	ON		LD.Id_Lista = L.Id_Lista
	WHERE	L.Id_Tipo_Lista = 'TDO'
	GROUP
	BY		D.DATA	
)
SELECT	D.DATA,
		LC.N_Righe, 	
		LC.N_Righe_AVG,
		LC.N_Righe_MAX,
		LC.N_Righe_MIN
FROM	Days				D
LEFT	
JOIN	Liste_Create			LC
ON		LC.DATA = D.DATA
GO
