SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Mobile].[vSkuLocator]
AS
SELECT  
vud.Id_Articolo, 
vut.Id_Magazzino, 
vud.Id_Imballaggio,
NULL  AS Id_Lotto_Produzione,
vud.Id_Azienda_Cliente,
MIN(vud.Codice_Articolo) AS Codice_Articolo,
MIN(vud.Codice_Imballaggio) AS Codice_Imballaggio,
CONCAT(MIN(vud.Codice_cliente), ' - ' , MIN(vud.RagSoc_Cliente)) AS Cliente,
MIN(vut.Desc_Magazzino) AS Desc_Magazzino,
NULL AS Lotto,
COUNT(1) AS Numero_Pallet, 
SUM(vud.Quantita_Pezzi) AS Qty, 
MIN(vud.Data_Scadenza) Min_Data_Scad 
FROM Mobile.vUdcTestata AS vut
INNER JOIN mobile.vUdcDettaglio AS vud 
ON vud.Id_Udc = vut.Id_Udc
WHERE vut.Id_Magazzino <> 199
GROUP BY vud.Id_Articolo, vud.Id_Imballaggio, vud.Id_Azienda_Cliente, vut.Id_Magazzino
GO
