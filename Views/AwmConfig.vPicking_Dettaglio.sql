SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [AwmConfig].[vPicking_Dettaglio]
AS

SELECT	--UD.Id_UdcDettaglio,
		LA.Id_Lista_Associazione,
		UD.Id_Udc AS LuId,
		UT.Codice_Udc,
		--UD.Id_Articolo,
		SUBSTRING(A.Codice,1,LEN(A.codice)-2)											AS Articolo,
		CONVERT(INT,UD.Quantita_Pezzi / UD.Pezzi_Per_Collo)								AS Colli,

		CONCAT
		(
			CONVERT(INT, ISNULL(LA.Qta_Evasa,0)/ UD.Pezzi_Per_Collo)
			, '/'
			,
			CONVERT(INT, LA.Qta_Richiesta/ UD.Pezzi_Per_Collo)
		)
		
		AS Colli_Prelevati,
		CASE 
			WHEN LA.Id_Lista_Associazione IS NULL
			THEN NULL
			ELSE N'⬇️'		
		END																		AS _,
		L.Label_Aggiuntive.value('data(//Description)[1]','VARCHAR(MAX)')		AS Rif,
		A.Descrizione															AS Desc_Articolo,		
		L.Codice																AS Ordine,
		A.Barcode																AS Ean
		--CONVERT(INT,UD.Quantita_Pezzi)											AS Pezzi,
		--CONVERT(INT,LA.Qta_Richiesta)											AS Pezzi_Richiesti

		--ISNULL(UD.Qta_Massima,A.Qta_Massima_Udc)		AS Qta_Massima,
		--UD.Label_Aggiuntive.value('data(//Var2)[1]','VARCHAR(MAX)')		AS Made_In

FROM	Udc_Dettaglio				UD
JOIN	Udc_Testata					UT
ON		UT.Id_Udc = UD.Id_Udc
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
JOIN	Tipo_Unita_Misura			TUM
ON		TUM.Id_Unita_Misura = ISNULL(UD.Id_Unita_Misura, A.Id_Unita_Misura)
LEFT
JOIN	Liste_Associazioni			LA
ON		LA.Id_UdcDettaglio = UD.Id_UdcDettaglio
LEFT
JOIN	Liste_Dettaglio				LD
ON		LD.Id_Lista_Dettaglio = LA.Id_Lista_Dettaglio
LEFT
JOIN	Liste						L
ON		L.Id_Lista = LD.Id_Lista
GO
