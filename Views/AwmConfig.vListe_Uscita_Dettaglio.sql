SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO









CREATE VIEW		[AwmConfig].[vListe_Uscita_Dettaglio]
AS
SELECT	LD.Id_Lista,
		LD.Id_Lista_Dettaglio,
		A.Codice						AS Codice_Articolo,
		--A.Descrizione					AS Articolo,
		LO.Codice_Lotto					AS Lotto,
		--ld.sEQUENZA						as Sequence,
		CONVERT(INT, Qta_Richiesta)		AS Requested_Qty,		
		CONVERT(INT, Qta_Evasa)			AS Completed_Qty,		
		CASE WHEN LD.Qta_Evasa >= LD.Qta_Richiesta THEN N'✔️'
			ELSE N'❌'
			END
			AS  Evaso

FROM	Liste_Dettaglio		LD
LEFT
JOIN	Articoli			A
ON		A.Id_Articolo = LD.Id_Articolo
LEFT
JOIN	Lotti				LO
ON		LO.Id_Lotto = LD.Id_Lotto
GO
