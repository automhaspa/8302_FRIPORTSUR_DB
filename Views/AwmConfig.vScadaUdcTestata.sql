SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [AwmConfig].[vScadaUdcTestata]
AS
WITH Error_Steps AS
(
	SELECT	EP.Id_Missione,
			EP.Id_Sequenza_Percorso,
			EP.ERRORE,
			ROW_NUMBER() OVER (PARTITION BY EP.Id_Missione, EP.Id_Sequenza_Percorso ORDER BY EP.TimeStamp DESC) N_ERRORE
	FROM	dbo.Errori_Percorso	EP
	JOIN	dbo.Percorso		PERC
	ON		PERC.Id_Missione = EP.Id_Missione
		AND PERC.Id_Sequenza_Percorso = EP.Id_Sequenza_Percorso
		AND PERC.Id_Tipo_Stato_Percorso = 9
)
	SELECT	UT.Id_Udc,
			UT.Codice_Udc,
			UT.Data_Inserimento,
			UT.Altezza,
			UT.Larghezza,
			UT.Profondita,
			ISNULL(UP.X, UP.Z)			Quota_Deposito,
			UT.Peso,
			PDM.DESCRIZIONE										Destinazione,
			DATEDIFF(SECOND,P.Ultima_Esecuzione,GETDATE())		Secondi_Esecuz,
			M.Id_Missione,
			P.Id_Sequenza_Percorso		,
			CONCAT(EP.Errore, ': ', CPS.DESCRIZIONE, ' -> ', CPD.DESCRIZIONE)
					
					AS		Error_Description,

			CPS.DESCRIZIONE						Error_SourceAsi,
			CPD.DESCRIZIONE						Error_DestAsi,
			'Error'								Error_Type,

			CAST(
			CASE WHEN M.Id_Missione IS NULL THEN 0 ELSE 1 END 
			AS BIT)								showActionId11,

			
			CAST(
			CASE WHEN M.Id_Missione IS NULL THEN 0 ELSE 1 END 
			AS BIT)								showActionId25,				
			
			CAST(
					CASE WHEN M.Id_Missione IS NULL THEN 1 ELSE 0 END
			AS BIT)								showActionId1

	FROM	dbo.Udc_Testata	UT
	JOIN	dbo.Udc_Posizione	UP
	ON		UP.Id_Udc = UT.Id_Udc
	LEFT	
	JOIN	dbo.Missioni	M
	ON		M.Id_Udc = UT.Id_Udc
	LEFT
	JOIN	dbo.Partizioni	PDM
	ON		PDM.ID_PARTIZIONE = M.Id_Partizione_Destinazione
	LEFT	
	JOIN	dbo.Percorso	P
	ON		P.Id_Missione = M.Id_Missione
	AND		P.Id_Tipo_Stato_Percorso = 9
	LEFT
	JOIN	Error_Steps					EP
	ON		P.Id_Missione = EP.Id_Missione
		AND	P.Id_Sequenza_Percorso = EP.Id_Sequenza_Percorso
		AND EP.N_ERRORE = 1
	
	LEFT	
	JOIN	dbo.Partizioni	PPS
	ON		PPS.ID_PARTIZIONE = P.Id_Partizione_Sorgente
	LEFT
	JOIN	dbo.Partizioni  PPD
	ON		PPD.ID_PARTIZIONE = P.Id_Partizione_Destinazione
	LEFT
	JOIN	dbo.SottoComponenti SCPS
	ON		SCPS.ID_SOTTOCOMPONENTE = PPD.ID_SOTTOCOMPONENTE
	LEFT
	JOIN	dbo.SottoComponenti SCPD
	ON		SCPD.ID_SOTTOCOMPONENTE = PPD.ID_SOTTOCOMPONENTE
	LEFT
	JOIN	dbo.Componenti		CPS
	ON		CPS.ID_COMPONENTE = SCPS.ID_COMPONENTE
	LEFT
	JOIN	dbo.Componenti		CPD
	ON		CPD.ID_COMPONENTE = SCPD.ID_COMPONENTE
GO
