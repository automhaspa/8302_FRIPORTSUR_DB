SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [AwmConfig].[vErroriAttivi]		
AS
WITH Faults AS
(
	SELECT	T.ASI, COUNT(DISTINCT T.ID) AS N_Fault
	FROM	Logs.Alarms		LA
	JOIN	dbo.TAG			T
	ON		T.TAGID = LA.TagId
	AND		T.DESCRIPTION = LA.Description
	WHERE	LA.ResettedTimeStamp IS NULL AND T.ASI IS NOT NULL
		AND T.TagType IN ('faultMsg', 'warningMsg')		
	GROUP
	BY		T.ASI
)
SELECT	0								MissionId,
		0								StepId,
		CONCAT('Fault: ', Faults.ASI)	Description,
		Faults.ASI						SourceAsi,
		''								DestAsi,
		'Fault'							TYPE
FROM	Faults
WHERE	LEN(Asi) < 4
UNION
SELECT	P.Id_Missione				MissionId,
		P.Id_Sequenza_Percorso		StepId,
		CASE
			WHEN FD.N_Fault > 0 OR FS.N_Fault > 0	THEN CONCAT('Fault: ', CS.DESCRIZIONE, ' -> ', CD.Descrizione)
			ELSE CONCAT('Timeout: ', CS.DESCRIZIONE, ' -> ', CD.Descrizione ,'  ', DATEDIFF(SECOND,P.Ultima_Esecuzione, GETDATE()) , ' s') 
		END							Description,
		CS.DESCRIZIONE				SourceAsi,
		CD.DESCRIZIONE				DestAsi,
		CASE
			WHEN FD.N_Fault > 0 OR FS.N_Fault > 0 THEN  'Fault'
			ELSE 'Timeout'
		END		AS Type
FROM	dbo.Percorso				P
JOIN	dbo.Missioni				M
ON		M.Id_Missione = P.Id_Missione
	AND P.Id_Tipo_Stato_Percorso = 2
JOIN	dbo.Partizioni				PS
ON		P.Id_Partizione_Sorgente = PS.ID_PARTIZIONE
JOIN	dbo.SottoComponenti			SCS
ON		SCS.ID_SOTTOCOMPONENTE = PS.ID_SOTTOCOMPONENTE
JOIN	dbo.Componenti				CS
ON		CS.ID_COMPONENTE = SCS.ID_COMPONENTE
JOIN	dbo.Partizioni				PD
ON		P.Id_Partizione_Destinazione = PD.ID_PARTIZIONE
JOIN	dbo.SottoComponenti			SCD
ON		SCD.ID_SOTTOCOMPONENTE = pd.ID_SOTTOCOMPONENTE
JOIN	dbo.Componenti				CD
ON		CD.ID_COMPONENTE = SCD.ID_COMPONENTE
LEFT
JOIN	Faults						FS
ON		FS.ASI = CS.DESCRIZIONE
LEFT
JOIN	Faults						FD
ON		FD.ASI = CD.DESCRIZIONE
WHERE	(
			P.Id_Tipo_Stato_Percorso = 2
			AND
			(
				FD.N_Fault > 0
					OR
				FS.N_Fault > 0		
			)
		)	
			OR
		(
			P.Id_Tipo_Stato_Percorso = 2
			AND
			DATEDIFF(SECOND,P.Ultima_Esecuzione, GETDATE()) > 300
		)
UNION
SELECT	EP.Id_Missione				MissionId,
		EP.Id_Sequenza_Percorso		StepId,
		EP.Errore					Description,
		CS.DESCRIZIONE				SourceAsi,
		CD.DESCRIZIONE				DestAsi,
		'Error'						Type
FROM	dbo.Percorso		PERC
JOIN	dbo.Errori_Percorso	EP
ON		PERC.Id_Missione = EP.Id_Missione
	AND PERC.Id_Sequenza_Percorso = EP.Id_Sequenza_Percorso
	AND PERC.Id_Tipo_Stato_Percorso = 9
	AND EP.Id_Tipo_ErrorCode > 0
	AND EP.Data_Chiusura IS NULL
JOIN	dbo.Partizioni				PS
ON		PS.ID_PARTIZIONE = ISNULL(EP.ID_PARTIZIONE_SORGENTE,PERC.Id_Partizione_Sorgente)
JOIN	dbo.SottoComponenti			SCS
ON		SCS.ID_SOTTOCOMPONENTE = PS.ID_SOTTOCOMPONENTE
JOIN	dbo.Componenti				CS
ON		CS.ID_COMPONENTE = SCS.ID_COMPONENTE
JOIN	dbo.Partizioni				PD
ON		PD.ID_PARTIZIONE = ISNULL(EP.Id_Partizione_Destinazione,PERC.Id_Partizione_Destinazione)
JOIN	dbo.SottoComponenti			SCD
ON		SCD.ID_SOTTOCOMPONENTE = PD.ID_SOTTOCOMPONENTE
JOIN	dbo.Componenti				CD
ON		CD.ID_COMPONENTE = SCD.ID_COMPONENTE
WHERE	EP.Data_Chiusura IS NULL

		
GO
