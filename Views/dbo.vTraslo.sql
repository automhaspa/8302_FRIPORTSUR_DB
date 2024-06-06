SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW  [dbo].[vTraslo] AS
SELECT	C.DESCRIZIONE AS Asi,
		CASE	
			WHEN P.ID_PARTIZIONE = PR.Id_Partizione_Sorgente	 
			THEN	'Destinazione: '

			
			WHEN P.ID_PARTIZIONE = PR.Id_Partizione_Destinazione	 
			THEN	'Sorgente: '

			ELSE ''
		END AS Label,
		CASE	
			WHEN P.ID_PARTIZIONE = PR.Id_Partizione_Sorgente	 
			THEN	SUBSTRING(PD.Descrizione,1,4)

			
			WHEN P.ID_PARTIZIONE = PR.Id_Partizione_Destinazione	 
			THEN	SUBSTRING(PS.Descrizione,1,4)

			ELSE ''
		END AS LabelValue,

		UP.Id_Udc AS LuId
			
FROM	Partizioni		P
JOIN	SottoComponenti	SC
On		SC.ID_SOTTOCOMPONENTE = P.ID_SOTTOCOMPONENTE
JOIN	Componenti		C
ON		C.ID_COMPONENTE = SC.ID_COMPONENTE
LEFT	
JOIN	Udc_Posizione	UP
ON		UP.Id_Partizione = P.ID_PARTIZIONE
LEFT
JOIN	Percorso		PR
ON		PR.Id_Tipo_Stato_Percorso = 2
AND		P.ID_PARTIZIONE IN (PR.Id_Partizione_Sorgente, PR.Id_Partizione_Destinazione)
LEFT
JOIN	Partizioni		PS
ON		PS.ID_PARTIZIONE = PR.Id_Partizione_Sorgente
LEFT
JOIN	Partizioni		PD
ON		PD.ID_PARTIZIONE = PR.Id_Partizione_Destinazione

WHERE	C.DESCRIZIONE
		IN
		(
			'1AM1',
			'1BM1',
			'1CM1',
			'1DM1'
		)
--UNION 
--ALL		SELECT '1CM1', 'xd: ','ur a nigger', 1
GO
