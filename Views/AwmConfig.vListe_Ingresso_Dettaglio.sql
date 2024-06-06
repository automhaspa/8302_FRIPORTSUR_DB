SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE VIEW		[AwmConfig].[vListe_Ingresso_Dettaglio]
AS
SELECT	LD.Id_Lista,
		LD.Id_Lista_Dettaglio,
		SUBSTRING(A.Codice,1,LEN(A.codice)-2)						AS Codice,
		SUBSTRING(A.Codice,LEN(A.codice)-1,LEN(A.codice))			AS Formato,
		A.Descrizione					AS Descrizione,
		A.Barcode						AS Ean,
		CONVERT(INT, Qta_Richiesta)		AS Pezzi_Per_Collo,
		LD.Codice_Udc					AS Udc_Destinazione,
		CASE WHEN LD.Qta_Evasa >= LD.Qta_Richiesta THEN N'✔️'
			ELSE N'❌'
			END
			AS  Evaso

FROM	Liste_Dettaglio		LD
JOIN	Articoli			A
ON		A.Id_Articolo = LD.Id_Articolo
GO
