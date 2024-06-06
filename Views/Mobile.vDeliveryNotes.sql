SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Mobile].[vDeliveryNotes] AS
SELECT
l.Id_Lista AS ListId,
L.Codice AS ListCode, 
L.Codice AS CustomerCode, -- la sorgente di questo valore è da definire
L.Data_Creazione AS [Date],
L.label_aggiuntive.value('data(//Supplier)[1]', 'VARCHAR(MAX)') AS Supplier, -- la sorgente di questo valore è da definire
L.label_aggiuntive.value('data(//Notes)[1]', 'VARCHAR(MAX)') AS Notes -- la sorgente di questo valore è da definire
FROM dbo.Liste AS L
WHERE l.Id_Tipo_Lista = 'TDI' AND L.Id_Tipo_Stato_Lista<>7 -- lista non chiusa
GO
