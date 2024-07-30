SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW [AwmConfig].[vRegoleSequenzaDettaglio]
AS
SELECT	RST.Id_Sequenza_Regole,
		RSD.Id_Sequenza_Regole_Dettaglio,
		TSM.Descrizione AS Tipo_Missione,
		RSD.Sequenza,
	--	RST.Descrizione AS Descrizione_Sequenza,
		R.Nome,
		R.Descrizione,
		CASE WHEN  R.Ordinamento = 0 THEN 'Filtro' ELSE 'Ordinamento' END AS Tipo
		--RI.Descrizione      AS Descrizione_Insieme
FROM	dbo.Regole_Sequenza_Dettaglio	RSD
JOIN	dbo.Regole_Sequenza_Testata		RST
ON		RSD.Id_Sequenza_Regole = RST.Id_Sequenza_Regole
JOIN	dbo.Regole                                  R
ON		R.Id_Regola = RSD.Id_Regola
JOIN	dbo.Regole_Insieme                          RI
ON      RI.Id_Insieme_Regole = RST.Id_Insieme_Regole
JOIN	dbo.Tipo_Missioni							TSM
ON		TSM.Id_Tipo_Missione = RST.Id_Tipo_Missione

GO
