SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [AwmConfig].[vUdcDettaglio]
AS

SELECT	UD.Id_UdcDettaglio,
		UD.Id_Udc,

		--UD.Id_Articolo,
		A.Codice										AS Codice_Articolo,
		--A.Barcode										AS Barcode,
		A.Descrizione									AS Desc_Articolo,

		--UD.Id_Lotto_Produzione,
		LP.Codice_Lotto									AS Codice_Lotto_Produzione,
		--LP.Data_Inserimento								AS Data_Inserimento_Lotto_Produzione,
		--LP.Nr_Bancali									AS Nr_Bancali_Produzione,

		--UD.Id_Lotto_Stoccaggio,		
		--LS.Codice_Lotto									AS Codice_Lotto_Stoccaggio,
		--LS.Data_Creazione								AS Data_Creazione_Lotto_Stoccaggio,
		--LS.Nr_Bancali									AS Nr_Bancali_Stoccaggio,

		--UD.Id_Imballaggio,
		I.Codice_Imballaggio,

		--UD.Matricola,

		--UD.Id_Azienda_Cliente,
		--AC.RagSoc										AS RagSoc_Cliente,
		--UD.Id_Azienda_Fornitore,
		--AF.RagSoc										AS RagSoc_Fornitore,

		--UD.Id_Contenitore,
		CN.Codice										AS Codice_Contenitore,

		--ISNULL(UD.Id_Unita_Misura, A.Id_Unita_Misura)	AS	Id_Unita_Misura,
		--TUM.Descrizione									AS Unita_Misura,

		ISNULL(UD.Data_Produzione, LP.Data_Produzione)  AS Data_Produzione,
		ISNULL(UD.Data_Scadenza, LP.Data_Scadenza)		AS Data_Scadenza,

		UD.Quantita_Pezzi	
		--ISNULL(UD.Qta_Massima,A.Qta_Massima_Udc)		AS Qta_Massima,
		--UD.Label_Aggiuntive.value('data(//Var2)[1]','VARCHAR(MAX)')		AS Made_In

FROM	Udc_Dettaglio				UD
JOIN	Articoli					A
ON		A.Id_Articolo = UD.Id_Articolo
LEFT
JOIN	Lotti						LP
ON		LP.Id_Lotto = UD.Id_Lotto_Produzione
LEFT
JOIN	Lotti						LS
ON		LS.Id_Lotto = UD.Id_Lotto_Stoccaggio
LEFT
JOIN	Imballaggi					I
ON		I.Id_Imballaggio = UD.Id_Imballaggio
LEFT
JOIN	Aziende						AF
ON		AF.Id_Azienda = UD.Id_Azienda_Fornitore
LEFT
JOIN	Aziende						AC
ON		AC.Id_Azienda = UD.Id_Azienda_Cliente
LEFT
JOIN	Contenitori					CN
ON		CN.Id_Contenitore = UD.Id_Contenitore
LEFT
JOIN	Tipo_Unita_Misura			TUM
ON		TUM.Id_Unita_Misura = ISNULL(UD.Id_Unita_Misura, A.Id_Unita_Misura)
GO
