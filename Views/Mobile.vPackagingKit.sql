SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [Mobile].[vPackagingKit] AS
SELECT 
    Codice,
    Barcode,
    0 AS Quantita_Pallet,
    '' AS Kit_Codice,
    '' AS Kit_Barcode,
    0 AS Kit_Quantita,
    NULL AS Codice_Imballaggio,
    NULL AS Id_Tipo_Udc
	FROM Mobile.vPackagingVariant
GO
