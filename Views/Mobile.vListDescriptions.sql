SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Mobile].[vListDescriptions] AS
-- Listdescription è una vista perché le informazioni principali di una lista possono essere diverse da cliente a cliente e tra differenti tipi liste
SELECT Codice AS ListCode,
CASE Id_Tipo_Lista
	WHEN 'TDI' THEN CONCAT('(',Codice,') ', label_aggiuntive.value('data(//DeliveryNote)[1]', 'VARCHAR(MAX)'))
	WHEN 'SPR' THEN CONCAT('(',Codice,') ', label_aggiuntive.value('data(//Order)[1]', 'VARCHAR(MAX)'))
	WHEN 'TDO' THEN CONCAT('(',Codice,') ', label_aggiuntive.value('data(//Order)[1]', 'VARCHAR(MAX)'))
	ELSE '-'
END AS Description
FROM dbo.Liste
GO
