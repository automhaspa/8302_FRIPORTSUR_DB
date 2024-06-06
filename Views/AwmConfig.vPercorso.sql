SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [AwmConfig].[vPercorso]
AS
WITH ErroriAttiviPerc AS
(
	SELECT	EP.Id_Missione,
			EP.Id_Sequenza_Percorso,
			EP.ErrorCode,
			EP.Errore,
			ROW_NUMBER() OVER (PARTITION BY EP.Id_Missione, EP.Id_Sequenza_Percorso ORDER BY EP.TimeStamp DESC) N_ERRORE
	FROM	dbo.Errori_Percorso	EP
	JOIN	dbo.Percorso		PERC
	ON		PERC.Id_Missione = EP.Id_Missione
		AND PERC.Id_Sequenza_Percorso = EP.Id_Sequenza_Percorso
		AND PERC.Id_Tipo_Stato_Percorso = 9
		AND EP.Data_Chiusura IS NULL
)
SELECT	P.Id_Missione,
		P.Id_Sequenza_Percorso,
		UT.Codice_Udc,
		P.Descrizione,
		PS.DESCRIZIONE							Sorgente,
		PD.DESCRIZIONE							Destinazione,
		TSP.Descrizione				AS Stato,
		P.Id_Tipo_Stato_Percorso,
		EP.Errore					AS Errore,			
		CASE WHEN P.Id_Tipo_Stato_Percorso IN (2,9) THEN  DATEDIFF(SECOND,P.Ultima_Esecuzione,GETDATE()) ELSE NULL END AS Secondi_Esecuz
		--CONCAT(P.sX,'  ',P.sY,'  ',P.sZ) AS Coordinata_Sorgente,
		--CONCAT(P.dX,'  ',P.dY,'  ',P.dZ) AS Coordinata_Destinazione
FROM	dbo.Percorso				P
JOIN	dbo.Missioni				M		ON M.Id_Missione = P.Id_Missione
JOIN	dbo.Tipo_Stato_Percorso		TSP		ON TSP.Id_Stato_Percorso = P.Id_Tipo_Stato_Percorso
LEFT
JOIN	dbo.Udc_Testata				UT		ON M.Id_Udc = UT.Id_Udc
LEFT 
JOIN	ErroriAttiviPerc			EP
ON		P.Id_Missione = EP.Id_Missione
	AND	P.Id_Sequenza_Percorso = EP.Id_Sequenza_Percorso
	AND	EP.N_ERRORE = 1
AND		P.Id_Missione = EP.Id_Missione
AND		P.Id_Sequenza_Percorso = EP.Id_Sequenza_Percorso
LEFT 
JOIN	dbo.Partizioni				PS		ON P.Id_Partizione_Sorgente = PS.ID_PARTIZIONE
LEFT 
JOIN	dbo.Partizioni				PD		ON P.Id_Partizione_Destinazione = PD.ID_PARTIZIONE
LEFT 
JOIN	dbo.SottoComponenti			SCS		ON SCS.ID_SOTTOCOMPONENTE = PS.ID_SOTTOCOMPONENTE
LEFT 
JOIN	dbo.SottoComponenti			SCD		ON SCD.ID_SOTTOCOMPONENTE = PD.ID_SOTTOCOMPONENTE
GO
