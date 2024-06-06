SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE VIEW [dbo].[vUdc_Baia_Picking]
AS


WITH BBaie AS
(
	SELECT 2302 AS Id_Partizione, 1 AS Id_Pc
),
 Udc_Interessati 
AS 
(
	--Tutte le udc con missione 
	SELECT      B.Id_Partizione, B.Id_Pc, M.Id_Missione, M.Id_Udc
	FROM        BBaie AS B 
	LEFT
	JOIN		dbo.Missioni AS M 
	ON			M.Id_Partizione_Destinazione = B.Id_Partizione 
	UNION
	SELECT      B.Id_Partizione, B.Id_Pc, M.Id_Missione, UP.Id_Udc
	FROM        BBaie AS B  
	LEFT
	JOIN		dbo.Udc_Posizione AS UP 
	ON			UP.Id_Partizione = B.Id_Partizione 
	LEFT 
	JOIN		dbo.Missioni AS M 
	ON			M.Id_Udc = UP.Id_Udc
	WHERE		M.Id_Missione IS NULL
	
)
SELECT      UC.Id_Partizione, 
			UC.Id_Missione, 
			UC.Id_Udc, 
            UT.Codice_Udc,
			UT.Larghezza AS Larghezza, 
			UT.Profondita AS Profondità, 
            UT.Altezza AS Altezza,
			UT.Peso AS Peso,  
			PD.DESCRIZIONE as [Posizione_di_Origine],
			PC.DESCRIZIONE AS [Posizione_Attuale], 
			M.Id_Partizione_Destinazione AS [Id_Destinazione],
			PS.DESCRIZIONE as [Partizione_di_Destinazione], 			
		    M.Id_Tipo_Missione,
			M.Id_Stato_Missione
FROM        Udc_Interessati AS UC 
LEFT 
JOIN		dbo.Udc_Posizione	AS UP  
ON			UC.Id_Udc = UP.Id_Udc 
LEFT
JOIN		dbo.Partizioni		AS	PC
ON			PC.ID_PARTIZIONE = UP.Id_Partizione
LEFT
JOIN		dbo.Udc_Testata		AS UT
ON			UC.Id_Udc = UT.Id_Udc 		
LEFT 
JOIN		dbo.Missioni		AS M 
ON			M.Id_Missione = UC.Id_Missione
LEFT 
JOIN		dbo.Partizioni		AS PS 
ON			M.Id_Partizione_Destinazione = PS.ID_PARTIZIONE
LEFT 
JOIN		dbo.Partizioni		AS PD 
ON			M.Id_Partizione_Sorgente = PD.ID_PARTIZIONE
WHERE       M.Id_Tipo_Missione IN ('OUT' , 'OUL', 'OUP')
GO
