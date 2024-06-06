SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [AwmConfig].[vArticoli]
AS
	SELECT	A.Id_Articolo,
			A.Codice,
			A.Descrizione,
			COUNT(UD.Id_Udc)			Presenza_Udc,
			SUM(UD.Quantita_Pezzi)		QtaTot
	FROM	dbo.Articoli		A
	LEFT
	JOIN	dbo.Udc_Dettaglio	UD
	ON		UD.Id_Articolo = A.Id_Articolo
	GROUP
		BY	A.Id_Articolo,
			A.Codice,
			A.Descrizione

GO
