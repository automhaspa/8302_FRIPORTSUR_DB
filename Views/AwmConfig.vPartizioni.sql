SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [AwmConfig].[vPartizioni] 
AS
	WITH Partizioni_Udc AS
	(
		SELECT	Id_Partizione, COUNT(Id_Udc) AS Lu_Count
		FROM	dbo.Udc_Posizione
		GROUP
			BY	Id_Partizione
	)
	SELECT	P.ID_PARTIZIONE,
			A.ID_AREA,
			SA.ID_SOTTOAREA,
			C.ID_COMPONENTE,
			SC.ID_SOTTOCOMPONENTE,
			A.CODICE_ABBREVIATO + SA.CODICE_ABBREVIATO + C.CODICE_ABBREVIATO + '.' 
			+ SC.CODICE_ABBREVIATO + '.' + P.CODICE_ABBREVIATO			CODPLC,
			P.ID_TIPO_PARTIZIONE,
			P.DESCRIZIONE,
			SC.COLONNA,
			SC.PIANO,
			P.LOCKED_INFEED,
			P.LOCKED_OUTFEED,
			CAST(
					CASE
						WHEN P.LOCKED_INFEED = 1 OR P.LOCKED_OUTFEED = 1		THEN 1
						ELSE 0
					END
				AS BIT)	LOCKED,
			P.Motivo_Blocco,
			CAST(
					CASE
						WHEN ISNULL(PU.Lu_Count,0) = 0	THEN 1
						ELSE 0
					END
				AS BIT)	VUOTA,
			ISNULL(PU.Lu_Count,0) 									Lu_Count,
			A.Codice_Abbreviato + SA.Codice_Abbreviato + C.Codice_Abbreviato																	ASI,
			SC.Codice_Abbreviato									SUBITEM,
			P.Codice_Abbreviato										[PARTITION],
			P.ALTEZZA,
			P.LARGHEZZA,
			P.PROFONDITA,
			P.PESO,
			C.ID_TIPO_COMPONENTE,
			TP.DESCRIZIONE											TIPO_PARTIZIONE,
			
			CAST(	CASE
						WHEN ISNULL(P.LOCKED_INFEED,0) = 0
								OR  ISNULL(P.LOCKED_OUTFEED,0) = 0 THEN	1
						ELSE 0
					END		AS BIT)									enableActionId30,
			CAST(	CASE
						WHEN ISNULL(P.LOCKED_INFEED,0) = 1
								OR	 ISNULL(P.LOCKED_OUTFEED,0) = 1 THEN 1
						ELSE 0
					END		AS BIT)									enableActionId31,
			CAST(	CASE
						WHEN ISNULL(P.LOCKED_INFEED,0) = 0	THEN 1
						ELSE 0
					END		AS BIT)									enableActionId32,

			CAST(	CASE
						WHEN PU.Lu_Count = P.CAPIENZA THEN 0
						ELSE 1
					END		AS BIT)									enableActionId12,
			
			CAST(	CASE
						WHEN PU.Lu_Count = 0 OR C.ID_TIPO_COMPONENTE <> 'S' THEN 0
						ELSE 1
					END		AS BIT)									enableActionId46,

			CAST(	CASE
						WHEN ISNULL(P.LOCKED_INFEED,0) = 0
								OR  ISNULL(P.LOCKED_OUTFEED,0) = 0 THEN	1
						ELSE 0
					END		AS BIT)									showActionId30,
			CAST(	CASE
						WHEN ISNULL(P.LOCKED_INFEED,0) = 1
								OR	 ISNULL(P.LOCKED_OUTFEED,0) = 1 THEN 1
						ELSE 0
					END		AS BIT)									showActionId31,
			CAST(	CASE
						WHEN ISNULL(P.LOCKED_INFEED,0) = 0	THEN 1
						ELSE 0
					END		AS BIT)									showActionId32,
			
			CAST(	CASE
						WHEN PU.Lu_Count = P.CAPIENZA THEN 0
						ELSE 1
					END		AS BIT)									showActionId12,
			
			CAST(	CASE
						WHEN PU.Lu_Count = 0 OR C.ID_TIPO_COMPONENTE <> 'S' THEN 0
						ELSE 1
					END		AS BIT)									showActionId46

	FROM	dbo.Partizioni					P
	JOIN	dbo.Tipo_Partizioni				TP
	ON		TP.ID_TIPO_PARTIZIONE = P.ID_TIPO_PARTIZIONE
	JOIN	dbo.SottoComponenti				SC
	ON		SC.ID_SOTTOCOMPONENTE = P.ID_SOTTOCOMPONENTE
	JOIN	dbo.Componenti					C
	ON		C.ID_COMPONENTE = SC.ID_COMPONENTE
	JOIN	dbo.SottoAree					SA
	ON		SA.ID_SOTTOAREA = C.ID_SOTTOAREA
	JOIN	dbo.Aree						A
	ON		A.ID_AREA = SA.ID_AREA
	LEFT
	JOIN	Partizioni_Udc					PU
	ON		PU.Id_Partizione = P.ID_PARTIZIONE
	WHERE	P.ID_TIPO_PARTIZIONE NOT IN ('OO','OP')
GO
