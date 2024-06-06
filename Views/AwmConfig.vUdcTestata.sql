SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE	 VIEW [AwmConfig].[vUdcTestata]
AS

SELECT	UT.Id_Udc			AS Id_Udc,	
		UT.Codice_Udc,
        TU.Descrizione		AS Tipo_Udc,
		UP.Id_Partizione,
		P.DESCRIZIONE		AS Partizione,
		SC.PIANO			AS Piano,
		SC.COLONNA			AS Colonna,
		UT.Altezza,
		UT.Larghezza,
		UT.Profondita,
		UT.Peso

FROM	dbo.Udc_Testata		UT
JOIN	dbo.Tipo_Udc		TU
ON		TU.Id_Tipo_Udc = UT.Id_Tipo_Udc
LEFT	
JOIN	dbo.Udc_Posizione	UP
ON		UP.Id_Udc = UT.Id_Udc
LEFT
JOIN	dbo.Partizioni			P
ON		P.ID_PARTIZIONE = UP.Id_Partizione
LEFT
JOIN	dbo.SottoComponenti		SC
ON		SC.ID_SOTTOCOMPONENTE = P.ID_SOTTOCOMPONENTE
GO
