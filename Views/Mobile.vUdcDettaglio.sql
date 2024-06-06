SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO







CREATE VIEW [Mobile].[vUdcDettaglio]
AS
  SELECT UD.Id_UdcDettaglio,
         UD.Id_Udc,
         UD.Id_Articolo,
         a.Codice AS Codice_Articolo,
         a.Barcode AS Barcode,
         A.Descrizione
            AS Desc_Articolo,
         UD.Id_Lotto_Produzione,
         LP.Codice_Lotto
            AS Codice_Lotto_Produzione,
         LP.Data_Produzione
            AS Data_Produzione,
         LP.Nr_Bancali
            AS Nr_Bancali_Produzione,
         UD.Id_Imballaggio,
         I.Codice_Imballaggio,
         ud.DaPackagingKit,
          UD.Id_Azienda_Cliente,
         AC.Codice AS Codice_cliente,
		 AC.RagSoc
            AS RagSoc_Cliente,
         UD.id_azienda_fornitore,
         AF.Codice AS Codice_Fornitore,
		 AF.RagSoc
            AS RagSoc_Fornitore,
         UD.Id_Contenitore,
         CN.Codice
            AS Codice_Contenitore,
         ISNULL(UD.Id_Unita_Misura, A.Id_Unita_Misura)
            AS Id_Unita_Misura,
         TUM.Descrizione
            AS Unita_Misura,
         ISNULL(UD.Data_Scadenza, LP.Data_Scadenza)
            AS Data_Scadenza,
         UD.Quantita_Pezzi AS Quantita_Pezzi
  FROM   udc_dettaglio UD
         JOIN articoli A
           ON A.id_articolo = UD.id_articolo
         LEFT JOIN lotti LP
                ON LP.id_lotto = UD.id_lotto_produzione
         LEFT JOIN lotti LS
                ON LS.id_lotto = UD.id_lotto_stoccaggio
         LEFT JOIN imballaggi I
                ON I.id_imballaggio = UD.id_imballaggio
         LEFT JOIN aziende AF
                ON AF.id_azienda = UD.id_azienda_fornitore
         LEFT JOIN aziende AC
                ON AC.id_azienda = UD.id_azienda_cliente
         LEFT JOIN contenitori CN
                ON CN.id_contenitore = UD.id_contenitore
         LEFT JOIN tipo_unita_misura TUM
                ON TUM.id_unita_misura = ISNULL(UD.id_unita_misura,
                                         A.id_unita_misura)

GO
