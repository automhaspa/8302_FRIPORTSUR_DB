SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Mobile].[vShipmentCheck] AS

SELECT sd.ListCode, sd.SSCC, 'Lack' AS Reason, ut.*
FROM mobile.vShipmentDetails AS sd
LEFT JOIN mobile.vUdcTestata AS ut ON sd.SSCC = ut.Codice_Udc
WHERE Processed = 0 AND sd.SSCC IS NOT NULL  -- Associazione a lista presente ma non elaborata

UNION

SELECT DISTINCT sd.ListCode, ut.Codice_Udc,'Exceed' AS Reason, ut.*
FROM Mobile.vShipments AS S
LEFT JOIN Mobile.vShipmentDetails AS SD ON SD.ListId = S.ListId
LEFT JOIN dbo.Liste_Associazioni LA ON la.Id_Lista_Dettaglio = sd.ListDetailId
LEFT JOIN mobile.vUdcTestata AS ut ON ut.Id_Udc = la.Id_Udc
WHERE Processed = 1 AND sd.SSCC IS NULL  -- Associazione a lista presente ma non elaborata -- Associazione a lista presente e elaborata, ma non originariamente richiesta

GO
