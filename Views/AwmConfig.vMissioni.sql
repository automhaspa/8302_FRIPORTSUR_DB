SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [AwmConfig].[vMissioni]
AS

SELECT		M.Id_Missione,
			M.Id_Udc,
			UT.Codice_Udc,
			M.Id_Partizione_Sorgente,			
			M.Id_Partizione_Destinazione,			
			PS.DESCRIZIONE	AS Sorgente,
			--MS.Descrizione AS Magazzino_Sorg,
			PD.DESCRIZIONE	AS Destinazione,
			--md.Descrizione AS Magazzino_Dest,
			P.DESCRIZIONE	AS Posizione,			
			M.Id_Tipo_Missione,
			TM.Descrizione	AS Tipo_Missione,
			M.Data_Creazione,
			L.Codice		AS Codice_Lista
			--TP.Descrizione	AS Priorita
			--M.Priorita	
FROM		dbo.Missioni M 

JOIN	dbo.Partizioni PS ON M.Id_Partizione_Sorgente = PS.ID_PARTIZIONE
JOIN	dbo.Partizioni PD ON M.Id_Partizione_Destinazione = PD.ID_PARTIZIONE
JOIN	dbo.SottoComponenti SCS ON SCS.ID_SOTTOCOMPONENTE = PS.ID_SOTTOCOMPONENTE
JOIN	dbo.SottoComponenti SCD ON SCD.ID_SOTTOCOMPONENTE = PD.ID_SOTTOCOMPONENTE
JOIN	dbo.Componenti CS ON CS.ID_COMPONENTE = SCS.ID_COMPONENTE
JOIN	dbo.Componenti CD ON CD.ID_COMPONENTE = SCD.ID_COMPONENTE
JOIN	dbo.SottoAree SAS ON SAS.ID_SOTTOAREA = CS.ID_SOTTOAREA
JOIN	dbo.SottoAree SAD ON SAD.ID_SOTTOAREA = CD.ID_SOTTOAREA
JOIN	dbo.Aree ASORG ON ASORG.ID_AREA = SAS.ID_AREA
JOIN	dbo.Aree AS AD ON AD.ID_AREA = SAD.ID_AREA
JOIN	dbo.Magazzini AS MS ON MS.Id_Magazzino = ASORG.Id_Magazzino
JOIN	dbo.Magazzini AS MD ON MD.Id_Magazzino = AD.Id_Magazzino
JOIN	dbo.Tipo_Stato_Missioni TSM ON TSM.Id_Stato_Missione = M.Id_Stato_Missione
JOIN	dbo.Tipo_Missioni TM ON TM.Id_Tipo_Missione = M.Id_Tipo_Missione	 
LEFT 
JOIN	dbo.Tipo_Priorita TP ON TP.Priorita = M.Priorita
LEFT
JOIN	dbo.Udc_Testata UT ON UT.Id_Udc = M.Id_Udc
LEFT 
JOIN	dbo.Udc_Posizione UP ON UP.Id_Udc = UT.Id_Udc
LEFT 
JOIN	dbo.Partizioni P ON UP.Id_Partizione = P.ID_PARTIZIONE
LEFT
JOIN	dbo.Liste_Associazioni	LA 
ON		LA.Id_Udc = UT.Id_Udc
LEFT	
JOIN	dbo.Liste_Dettaglio	LD
ON		LD.Id_Lista_Dettaglio = LA.Id_Lista_Dettaglio
LEFT 
JOIN	dbo.Liste L
ON		L.Id_Lista = LD.Id_Lista
GO
