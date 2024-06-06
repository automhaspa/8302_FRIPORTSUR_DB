SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Mobile].[vShipmentPreparations] AS
SELECT 
l.Id_Lista AS ListId,
L.Codice AS ListCode, -- ordine e shipment coincidono (non ho il concetto di shipment) informazione da definire NVCHAR(50) in versione originale
L.label_aggiuntive.value('data(//Order)[1]', 'VARCHAR(MAX)') AS CustomerCode,
L.label_aggiuntive.value('data(//Customer)[1]', 'VARCHAR(MAX)') AS Customer, -- Informazioni da definire NVCHAR(50) in versione originale
L.label_aggiuntive.value('data(//DeliveryAddress)[1]', 'VARCHAR(MAX)') AS DeliveryAddress, -- Informazioni da definire NVCHAR(150) in versione originale
L.label_aggiuntive.value('data(//Carrier)[1]', 'VARCHAR(MAX)') AS Carrier, -- Informazioni da definire NVCHAR(30) in versione originale
L.label_aggiuntive.value('data(//Notes)[1]', 'VARCHAR(MAX)') AS Notes,
l.Id_Partizione_Destinazione AS DestPartition,
l.Destinazione AS DestDescription-- Informazioni da definire NVCHAR(100) in versione originale
FROM dbo.Liste AS L
WHERE l.Id_Tipo_Lista = 'SPR' AND L.Id_Tipo_Stato_Lista<>7 -- lista non chiusa
GO
