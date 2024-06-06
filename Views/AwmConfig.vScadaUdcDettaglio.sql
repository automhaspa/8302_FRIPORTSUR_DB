SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [AwmConfig].[vScadaUdcDettaglio]
AS

SELECT	UD.Id_Udc,
		A.Codice										Articolo,
		A.Descrizione									Descrizione_Art,
		UD.Quantita_Pezzi								Qta,
		LP.Codice_Lotto									Codice_Lotto_Produzione,
		ISNULL(UD.Data_Scadenza, LP.Data_Scadenza)		Data_Scadenza
FROM	dbo.Udc_Dettaglio				UD
JOIN	dbo.Articoli					A
ON		A.Id_Articolo = UD.Id_Articolo
LEFT
JOIN	dbo.Lotti						LP
ON		LP.Id_Lotto = UD.Id_Lotto_Produzione
LEFT
JOIN	dbo.Lotti						LS
ON		LS.Id_Lotto = UD.Id_Lotto_Stoccaggio
LEFT
JOIN	dbo.Imballaggi					I
ON		I.Id_Imballaggio = UD.Id_Imballaggio
LEFT
JOIN	dbo.Aziende						AF
ON		AF.Id_Azienda = UD.Id_Azienda_Fornitore
LEFT
JOIN	dbo.Aziende						AC
ON		AC.Id_Azienda = UD.Id_Azienda_Cliente
LEFT
JOIN	dbo.Contenitori					CN
ON		CN.Id_Contenitore = UD.Id_Contenitore
LEFT
JOIN	dbo.Tipo_Unita_Misura			TUM
ON		TUM.Id_Unita_Misura = ISNULL(UD.Id_Unita_Misura, A.Id_Unita_Misura)
GO
