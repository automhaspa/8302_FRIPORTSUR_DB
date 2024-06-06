SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [Mobile].[vShipmentDetails] AS
SELECT DISTINCT
 L.Id_Lista ListId,
 L.Codice ListCode,
 ld.Id_Lista_Dettaglio ListDetailId,
 ld.Codice ListDetailCode,
 LD.Codice_Udc SSCC,
   CASE WHEN 
	la.Id_Udc IS NULL THEN 0 ELSE 1
   END AS Processed	, vUT.CodPlc AS Partition
 
FROM [dbo].[Liste] L 
JOIN [dbo].[Liste_Dettaglio] LD ON LD.Id_Lista = L.Id_Lista
LEFT JOIN dbo.Liste_Associazioni LA ON LA.Id_Lista_Dettaglio = LD.Id_Lista_Dettaglio
LEFT JOIN mobile.vUdcTestata vUT ON vUT.Codice_Udc = LD.Codice_Udc
WHERE L.Id_Tipo_Stato_Lista<>7 AND l.Id_Tipo_Lista = 'TDO' -- lista non chiusa
GO
