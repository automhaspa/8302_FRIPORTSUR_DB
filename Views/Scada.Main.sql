SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Scada].[Main]		
AS

WITH Contentuti AS
(
	SELECT	UD.Id_Udc,
			CASE WHEN COUNT(DISTINCT UD.Id_Articolo) > 1			THEN -1 ELSE MIN(UD.Id_Articolo)			END AS Articolo,			
			CASE WHEN COUNT(DISTINCT UD.Id_Lotto_Stoccaggio) > 1	THEN -1 ELSE MIN(UD.Id_Lotto_Stoccaggio)	END AS Lotto--,					
			--CASE WHEN COUNT(DISTINCT UD.Id_Azienda_Cliente) > 1		THEN -1 ELSE MIN(UD.Id_Azienda_Cliente)		END AS Owner
	FROM	dbo.Udc_Dettaglio UD	WITH(NOLOCK)
	GROUP 
	BY		UD.Id_Udc	
)

SELECT	CONCAT(CT.DESCRIZIONE,'.',SCT.CODICE_ABBREVIATO,'.',PT.CODICE_ABBREVIATO)			AS	SORG,
        ISNULL(UT.Id_Udc,0)																	AS	Id_Udc,
        UT.Codice_Udc,
		NULL																				AS	QuotaDepositoX,
		UD.Articolo,
		CAST
		(
			CASE
					WHEN CT.ID_TIPO_COMPONENTE = 'S'	THEN  UP.Z - UT.Profondita / 2
					WHEN CT.ID_TIPO_COMPONENTE = 'G'	THEN  PT.PROFONDITA - UP.Z 
					ELSE NULL
			END AS INT
		)																					AS	QuotaDeposito,
		CASE
			WHEN UD.Id_Udc IS NULL THEN '#ffffff'
			--ELSE '#' + CONVERT(VARCHAR(6),HASHBYTES('SHA1',  CONCAT(UD.Articolo,'_', UD.Lotto)),2) 
			ELSE '#' + CONVERT(VARCHAR(6),HASHBYTES('SHA1',  CAST(UD.Articolo AS VARCHAR(MAX))),2) 
		END																					AS	 udcColour,
        RS.Id_Missione																		AS	 Id_Percorso,
        RS.Id_Sequenza_Percorso																AS	 Sequenza_Percorso,
        RS.Id_Tipo_Messaggio,
        RS.Id_Tipo_Stato_Percorso,
        RS.DEST,
        UT.PESO,
        CASE WHEN ISNULL(UT.Larghezza ,0) = 0 OR UT.Larghezza > 9000  THEN 1200 ELSE UT.Larghezza  END	LARGHEZZA,
		CASE WHEN ISNULL(UT.Profondita,0) = 0 OR UT.Profondita > 9000 THEN  800 ELSE UT.Profondita END	PROFONDITA,
        69																								ALTEZZA,
        CAST(0 AS BIT)							Blocco_Udc,
        PT.Motivo_Blocco,
        TU.Descrizione							Tipo_Udc,		
		0																							AS	Rotation,
		NULLIF(CT.ID_COMPONENTE,0)				ID_COMPONENTE,
		NULLIF(PT.ID_PARTIZIONE,0)				ID_PARTIZIONE,
        NULLIF
		(
			CASE
				WHEN PT.ID_TIPO_PARTIZIONE IN ('TR','RM') THEN 'TR'
				ELSE PT.ID_TIPO_PARTIZIONE
			END,
			''
		)										ID_TIPO_PARTIZIONE,
		NULLIF(CT.ID_TIPO_COMPONENTE,'')		ID_TIPO_COMPONENTE,
        RS.ID_PART_SORG,
        RS.ID_PART_DEST,
        RS.TC_DEST,
        RS.TP_DEST,
        0										PosX,
		SCT.PIANO								PIANO,
        SCT.COLONNA,
        NULLIF(PT.LARGHEZZA,0)					posWidth, 
        NULLIF(PT.Profondita,0)					posLength,
        NULLIF(PT.Altezza,0)					posHeight,

        CASE	WHEN ISNULL(PT.LOCKED_INFEED,0) = 1 AND ISNULL(PT.LOCKED_OUTFEED,0) = 1 
				THEN CAST(1 AS BIT)
				ELSE CAST(0 AS BIT)
		END										AS	LOCKED,

		CASE	WHEN ISNULL(PT.LOCKED_INFEED,0) = 1 AND ISNULL(PT.LOCKED_OUTFEED,0) = 0 
			THEN CAST(1 AS BIT)
			ELSE CAST(0 AS BIT)
		END										AS	LOCKED_INFEED,

		CASE WHEN ISNULL(PT.LOCKED_INFEED,0) = 0 AND ISNULL(PT.LOCKED_OUTFEED,0) = 1 
				THEN CONVERT(BIT,1)
				ELSE CONVERT(BIT,0)
        END										AS	LOCKED_OUTFEED,

        CASE
			WHEN CT.Tipo = 'RotatingConveyor'				THEN			'App/SVG/Components/ralla.svg'
			WHEN CT.ID_TIPO_COMPONENTE = 'R'				THEN			'App/SVG/Components/catenaria90.svg'
			WHEN CT.ID_TIPO_COMPONENTE = 'L'				THEN			',App/SVG/Components/catenaria.svg'
			WHEN CT.ID_TIPO_COMPONENTE = 'C'				THEN			'App/SVG/Components/navetta.svg'
			ELSE ''
		END									svg,
		NULL								svgUdc,
		NULL								svgSku,
		CAST(0 AS BIT)						emptyUdc,
        50									svgOFFSET,		
		MAX(PT.LARGHEZZA) OVER (PARTITION BY PT.ID_SOTTOCOMPONENTE) LARGHEZZATUNNEL,		--1350 MISURATO DA LAYOUT MECCANICO
		NULL								OffsetSottoComponente, --marco vecchi dice che questo è un offset di dove posizionare la scatola rispetto al tunnel
		PT.CODICE_ABBREVIATO				PARTITION,
		RS.ErrorDescription,
		''						ITEM_TESTO,
		''						ORIENTAMENTO_TESTO,
		CONCAT(CT.DESCRIZIONE,'.',SCT.CODICE_ABBREVIATO,'.',PT.CODICE_ABBREVIATO)	SvgPathId
FROM	dbo.Partizioni			PT
JOIN	dbo.SottoComponenti		SCT
ON		SCT.ID_SOTTOCOMPONENTE = PT.ID_SOTTOCOMPONENTE
JOIN	dbo.Componenti			CT 
ON		CT.ID_COMPONENTE = SCT.ID_COMPONENTE
JOIN	dbo.SottoAree			SAT
ON		SAT.ID_SOTTOAREA	= CT.ID_SOTTOAREA
JOIN	dbo.Aree			A
ON		A.ID_AREA = SAT.ID_AREA
JOIN	dbo.Magazzini		MAG
ON		MAG.Id_Magazzino = A.Id_Magazzino
LEFT
JOIN	dbo.Udc_Posizione		UP
ON		UP.Id_Partizione = PT.ID_PARTIZIONE
LEFT
JOIN	dbo.Udc_Testata			UT
ON		UT.Id_Udc = UP.Id_Udc
LEFT
JOIN	dbo.Tipo_Udc		TU
ON		TU.Id_Tipo_Udc = UT.Id_Tipo_Udc
LEFT
JOIN	(
			SELECT	*
			FROM	(
						SELECT	*,
								DENSE_RANK() OVER (PARTITION BY T.ID_PART_SORG ORDER BY T.Id_Missione ASC) SORG_INDEX
						FROM	(
									SELECT	M.Id_Udc,
											P.Id_Missione,
											P.Id_Sequenza_Percorso,
											'12020'								Id_Tipo_Messaggio,
											P.Id_Partizione_Sorgente			ID_PART_SORG,
											CS.ID_TIPO_COMPONENTE				TC_SORG,
											PPS.ID_TIPO_PARTIZIONE				TP_SORG,
											P.Id_Partizione_Destinazione		ID_PART_DEST,
											CD.ID_TIPO_COMPONENTE				TC_DEST,
											PPD.ID_TIPO_PARTIZIONE				TP_DEST,
											CASE
												WHEN ISNULL(EP.Id_Errore_Percorso, 0) = 0 THEN P.Id_Tipo_Stato_Percorso
												ELSE 4
											END									Id_Tipo_Stato_Percorso,
											CASE
												WHEN ISNULL(P.Id_Errore_Percorso, 0) = 0 THEN NULL
												ELSE
												(
													SELECT	TOP 1 LR.ResourceValue
													FROM	dbo.Tipo_ErrorCode			TER
													JOIN	AwmConfig.LocalResource	LR
													ON		TER.Id_Tipo_ErrorCode = EP.Id_Tipo_ErrorCode
													AND		LR.ResourceName = TER.Descrizione
													WHERE	LR.LanguageId  = 'it'
												)
											END									ErrorDescription,											
											CONCAT(CD.DESCRIZIONE,'.',SCD.CODICE_ABBREVIATO, '.', PPD.CODICE_ABBREVIATO)	AS		DEST,

											DENSE_RANK() OVER (PARTITION BY P.Id_Missione ORDER BY P.Id_Sequenza_Percorso ASC) STEPINDEX
										FROM	dbo.Percorso						P
										JOIN	dbo.Missioni						M
										ON		M.Id_Missione = P.Id_Missione
										LEFT
										JOIN	dbo.Partizioni						PPS
										ON		PPS.ID_PARTIZIONE = P.Id_Partizione_Sorgente
										LEFT
										JOIN	dbo.SottoComponenti					SCS
										ON		SCS.ID_SOTTOCOMPONENTE = PPS.ID_SOTTOCOMPONENTE
										LEFT
										JOIN	dbo.Componenti						CS
										ON		SCS.ID_COMPONENTE = CS.ID_COMPONENTE
										LEFT
										JOIN	dbo.Partizioni						PPD
										ON		PPD.ID_PARTIZIONE = P.Id_Partizione_Destinazione
										LEFT
										JOIN	dbo.SottoComponenti					SCD
										ON		SCD.ID_SOTTOCOMPONENTE = PPD.ID_SOTTOCOMPONENTE
										LEFT
										JOIN	dbo.Componenti						CD
										ON		SCD.ID_COMPONENTE = CD.ID_COMPONENTE
										LEFT
										JOIN	(
													SELECT	Id_Missione,
															Id_Sequenza_Percorso,
															Id_Tipo_ErrorCode,
															MAX(Id_Errore_Percorso)			Id_Errore_Percorso
													FROM	dbo.Errori_Percorso
													GROUP
														BY	Id_Missione,
															Id_Sequenza_Percorso,
															Id_Tipo_ErrorCode
												) EP
										ON		EP.Id_Missione = P.Id_Missione
											AND EP.Id_Sequenza_Percorso = P.Id_Sequenza_Percorso
											AND P.Id_Tipo_Stato_Percorso = 9
										WHERE	Id_Tipo_Stato_Percorso IN (1,2,9)
								)	T
						WHERE	T.STEPINDEX = 1
					)	T
			WHERE	T.SORG_INDEX = 1
		) RS
ON		PT.ID_PARTIZIONE = RS.ID_PART_SORG
LEFT
JOIN	Contentuti			UD
ON		UD.Id_Udc = UT.Id_Udc
WHERE	ID_TIPO_PARTIZIONE <> 'OP'
	AND CT.ID_TIPO_COMPONENTE <> 'O' -- looop RM
	AND ISNULL(CT.Tipo,'') <> 'FleetManager'
GO
