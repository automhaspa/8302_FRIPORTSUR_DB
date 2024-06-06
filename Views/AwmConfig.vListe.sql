SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

CREATE	VIEW	[AwmConfig].[vListe]
AS
SELECT	L.Id_Lista,
		L.Codice,
		L.Id_Tipo_Lista,
		TL.Descrizione				AS Tipo_Lista,

		L.Id_Tipo_Stato_Lista,
		TSL.Id_Tipo_Stato_Lista		AS Tipo_Stato_Lista,
		L.Id_Lista_Padre,
		L.Priorita,
		L.Data_Creazione,			
		L.Data_Importazione,
		L.Data_Esecuzione,
		L.Data_Evasione,
		L.Data_Previsione,

		L.Id_Azienda_Cliente,
		CLI.RagSoc					AS Cliente,

		L.Id_Azienda_Fornitore,
		FORN.RagSoc					AS Fornitore,

		L.Utente_Creazione,
		L.Utente_Esecuzione,
		L.Ordine_Estrazione,
		L.Id_Tipo_Logica_Estrazione,
		TLE.Descrizione				AS Logica_Estrazione,
		--L.Id_Partizione_Destinazione,
		L.Destinazione
		--L.Label_Aggiuntive
FROM	Liste						L
JOIN	Tipo_Liste					TL
ON		L.Id_Tipo_Lista	= TL.Id_Tipo_Lista
JOIN	Tipo_Stato_Lista			TSL
ON		L.Id_Tipo_Stato_Lista = TSL.Id_Tipo_Stato_Lista
LEFT
JOIN	Aziende						CLI
ON		CLI.Id_Azienda = L.Id_Azienda_Cliente
LEFT
JOIN	Aziende						FORN
ON		FORN.Id_Azienda = L.Id_Azienda_Fornitore
LEFT
JOIN	Tipo_Logiche_Estrazione		TLE
ON		L.Id_Tipo_Logica_Estrazione = TLE.Id_Tipo_Logica_Estrazione
GO
