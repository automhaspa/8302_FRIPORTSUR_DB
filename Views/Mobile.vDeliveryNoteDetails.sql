SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [Mobile].[vDeliveryNoteDetails]
AS

SELECT 
      l.Id_Lista AS ListId,
      L.Codice ListCode,
	  ld.Id_Lista_Dettaglio ListDetailid,
      LD.[Codice] ListDetailCode,
	  AR.Codice SKU,
	  IR.Codice_Imballaggio Packaging,
	  AR.Codice Code,
	  Qta_Richiesta Quantity,
	  AR.Descrizione [Description]
  FROM [Liste_Dettaglio] LD
  LEFT JOIN dbo.Liste L ON LD.Id_Lista=L.Id_Lista 
  -- Usati per la descrizione del richiesto (si richiede per articolo e variante)
  LEFT JOIN dbo.Articoli AR ON LD.Id_Articolo=AR.Id_Articolo
  LEFT JOIN dbo.Imballaggi IR ON LD.Id_Imbalaggio=IR.Id_Imballaggio
   WHERE L.Id_Tipo_Stato_Lista<>7 and l.Id_Tipo_Lista = 'TDI'
GO
