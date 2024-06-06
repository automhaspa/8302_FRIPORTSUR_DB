SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Mobile].[vShipmentPreparationContent]
AS
SELECT vutl.Codice_Lista AS ListCode, 
MIN(vUD.Codice_Articolo)AS SKU,
MIN(vUD.Barcode)AS Code,
MIN(vud.Desc_Articolo) AS Description,
MIN(vUD.Codice_Imballaggio) AS Packaging ,
MIN(vud.Codice_Lotto_Produzione) AS Batch, 
MIN(vUD.Codice_Cliente) AS Customer, 
SUM(vUD.Quantita_Pezzi) AS Quantity, 
vUTL.Stato_Elaborazione AS Status
FROM Mobile.vUdcTestataInLista vUTL
LEFT JOIN mobile.vUdcDettaglio vUD
ON vUD.Id_Udc = vUTL.Id_Udc
GROUP BY 
vutl.Codice_Lista, 
vUD.Id_Articolo, 
vUD.Id_Imballaggio, 
vud.Id_Lotto_Produzione, 
vud.Id_Azienda_Cliente, 
vUTL.Stato_Elaborazione
GO
