SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [Mobile].[vEventi]
AS
SELECT	e.Id_Evento,
		e.Id_Tipo_Evento,
		e.Id_Tipo_Destinazione_Eventi AS e_Id_Tipo_Destinazione_Eventi,
		te.Id_Tipo_Destinazione_Eventi AS te_Id_Tipo_Destinazione_Eventi,
		e.Id_Tipo_Stato_Evento,
		e.Id_Partizione,
		e.id_udc,
		e.Id_Missione,
		e.Id_Sequenza_Percorso,
		e.Id_Utente, 
		e.Id_Utente_Presa_In_Carico , 
		u.DisplayName,
		e.Sorgente,  
		e.DataCreazione, 
		e.Priorita, 
		e.Persistente, 
		e.JsonParams,
		te.Descrizione, 
		te.Gestore, 
		te.Consenti_Presa_In_Carico
FROM	dbo.Eventi AS e
JOIN	dbo.Tipo_Eventi AS te 
ON		te.Id_Tipo_Evento = e.Id_Tipo_Evento
LEFT 
JOIN	AwmConfig.Users AS u 
ON		u.SubjectId = e.Id_Utente_Presa_In_Carico

GO
