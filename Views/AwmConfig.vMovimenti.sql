SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE   VIEW [AwmConfig].[vMovimenti]
AS
SELECT	M.Id_Movimento,
        M.Data_Movimento,
        M.Id_Udc,
        m.Codice_Udc,

        m.Codice_Articolo,
        m.Codice_Lotto_Stoccaggio,
       
        m.Qta_Precedente,
        m.Qta_Delta,
        m.Utente,
        TCM.Descrizione										AS	Causale,
        Pm.DESCRIZIONE										AS	Partizione,
		ISNULL(US.Data_Inserimento,UT.Data_Inserimento)		AS	Data_Inserimento_Udc,
		US.Data_Cancellazione								AS	Data_Cancellazione_Udc
       
FROM	dbo.Movimenti					M
LEFT
JOIN	dbo.Partizioni					PM
ON		PM.ID_PARTIZIONE = M.Id_Partizione
LEFT	
JOIN	dbo.Tipo_Causali_Movimenti		TCM
ON		TCM.Id_Tipo_Causale = M.Id_Causale_Movimenti
LEFT
JOIN	dbo.Udc_Testata					UT
ON		UT.Id_Udc = M.Id_Udc			
LEFT
JOIN	dbo.Udc_Storico					US
ON		US.Id_Udc = M.Id_Udc
GO
