SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Mobile].[vPartizioni] 
AS
	WITH Partizioni_Udc AS
	(
		SELECT	Id_Partizione, COUNT(Id_Udc) AS Lu_Count
		FROM	Udc_Posizione
		GROUP
		BY		Id_Partizione
	)
	SELECT	M.Id_Magazzino,
			A.ID_AREA,
			SA.ID_SOTTOAREA,
			C.ID_COMPONENTE,
			SC.ID_SOTTOCOMPONENTE,
			P.ID_PARTIZIONE,
			C.COMM_CHANNEL,
			M.Codice_Abbreviato + '.'
				+ A.CODICE_ABBREVIATO + SA.CODICE_ABBREVIATO + C.CODICE_ABBREVIATO + '.' 
				+ SC.CODICE_ABBREVIATO 
				+ '.' + P.CODICE_ABBREVIATO					AS CODPLC,
			P.ID_TIPO_PARTIZIONE,
			P.DESCRIZIONE,
			SC.COLONNA,
			SC.PIANO,
			P.LOCKED_INFEED,
			P.LOCKED_OUTFEED,
			CASE WHEN P.LOCKED_INFEED = 1 OR P.LOCKED_OUTFEED = 1		THEN CAST(1 AS BIT) 
																		ELSE CAST(0 AS BIT)
			END		AS LOCKED,
			P.Motivo_Blocco,
			CASE WHEN ISNULL(PU.Lu_Count,0) = 0							THEN CAST(1 AS BIT) 
																		ELSE CAST(0 AS BIT)
			END		AS VUOTA,
			ISNULL(PU.Lu_Count,0) 									Lu_Count,
			p.CAPIENZA,
			A.Codice_Abbreviato + SA.Codice_Abbreviato + C.Codice_Abbreviato																	ASI,
			SC.Codice_Abbreviato																												SUBITEM,
			P.Codice_Abbreviato																													[PARTITION],
			P.Altezza,
			P.Larghezza,
			P.Profondita,
			P.PESO,
			C.ID_TIPO_COMPONENTE,
			C.Tipo AS TIPO_COMPONENTE, 
			TC.DESCRIZIONE AS DESC_COMPONENTE,
			TP.DESCRIZIONE																														TIPO_PARTIZIONE,
			m.Descrizione AS DESC_MAGAZZINO


	FROM	Partizioni							P
	JOIN	Tipo_Partizioni						TP
	ON		TP.ID_TIPO_PARTIZIONE = P.ID_TIPO_PARTIZIONE
	JOIN	SottoComponenti						SC
	ON		SC.ID_SOTTOCOMPONENTE = P.ID_SOTTOCOMPONENTE
	JOIN	Componenti							C
	ON		C.ID_COMPONENTE = SC.ID_COMPONENTE
	JOIN	SottoAree							SA
	ON		SA.ID_SOTTOAREA = C.ID_SOTTOAREA
	JOIN	Aree								A
	ON		A.ID_AREA = SA.ID_AREA
	JOIN	Magazzini							M
	ON		A.Id_Magazzino = M.Id_Magazzino
	LEFT
	JOIN	Partizioni_Udc						PU
	ON		PU.Id_Partizione = P.ID_PARTIZIONE
	JOIN	dbo.Tipo_Componenti TC
	ON TC.ID_TIPO_COMPONENTE = C.ID_TIPO_COMPONENTE
	WHERE	P.ID_TIPO_PARTIZIONE <> 'OO'
	AND		P.ID_TIPO_PARTIZIONE <> 'OP'
	AND		m.Id_Magazzino <> 199

GO
