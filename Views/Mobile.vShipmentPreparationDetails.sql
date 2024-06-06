SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [Mobile].[vShipmentPreparationDetails] AS
SELECT 
      l.Id_Lista ListId,
      L.Codice ListCode,
	  ld.Id_Lista_Dettaglio ListDetailId,
      LD.[Codice] ListDetailCode,
	  AR.Codice SKU,
	  AR.Codice Code,
	  IR.Codice_Imballaggio Packaging,
	  Lotti.Codice_Lotto AS Batch,
	  dbo.Aziende.Codice AS Customer,
	  ld.Data_Scadenza AS [ExpireDate],
	  Qta_Richiesta Quantity,
	  AR.Descrizione [Description]
  FROM [Liste_Dettaglio] LD
  LEFT JOIN dbo.Liste L ON LD.Id_Lista=L.Id_Lista 
  LEFT JOIN dbo.Articoli AR ON LD.Id_Articolo=AR.Id_Articolo
  LEFT JOIN dbo.Imballaggi IR ON LD.Id_Imbalaggio=IR.Id_Imballaggio
  LEFT JOIN dbo.Lotti  ON Lotti.Id_Lotto = ld.Id_Lotto
  LEFT JOIN dbo.Aziende ON Aziende.Id_Azienda = LD.Id_Azienda_Cliente
   WHERE l.Id_Tipo_Lista = 'SPR'
GO
