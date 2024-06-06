SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [AwmConfig].[vUdcStorico] 
AS
SELECT	US.Id_Storico,
		US.Id_Udc,
		US.Codice_Udc,
		US.Data_Inserimento,
		US.Data_Cancellazione,
		US.Utente_Cancellazione,
		US.Id_Tipo_Udc,
		TU.Descrizione			AS Tipo_Udc,
		US.Id_Partizione,
		P.DESCRIZIONE			AS Partizione,
		US.cX,
		US.cY,
		US.cZ,
		US.Pieno
FROM	Udc_Storico		US
LEFT
JOIN	Partizioni		P
ON		P.ID_PARTIZIONE = US.ID_PARTIZIONE
LEFT
JOIN	Tipo_Udc		TU
ON		TU.Id_Tipo_Udc = US.Id_Tipo_Udc
GO
