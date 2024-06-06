SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE   VIEW	[AwmConfig].[vUdcTestata_Outbound]
AS

SELECT	UT.Id_Udc			AS Id_Udc,	
		UT.Codice_Udc		AS Codice_Udc,
		TU.Descrizione 
		AS Tipo_Udc,
		P.DESCRIZIONE AS Partizione,
		UT.Altezza,
		UT.Larghezza,
		UT.Profondita,
		UT.Peso

FROM	Udc_Testata		UT
JOIN	Tipo_Udc		TU
ON		TU.Id_Tipo_Udc = UT.Id_Tipo_Udc
LEFT	
JOIN	Udc_Posizione	UP
ON		UP.Id_Udc = UT.Id_Udc
LEFT
JOIN	Partizioni			P
ON		P.ID_PARTIZIONE = UP.Id_Partizione
LEFT
JOIN	SottoComponenti		SC
ON		SC.ID_SOTTOCOMPONENTE = P.ID_SOTTOCOMPONENTE
LEFT	
JOIN	Componenti			C
ON		C.ID_COMPONENTE = SC.ID_COMPONENTE
LEFT
JOIN	Tipo_Componenti		TC
ON		TC.ID_TIPO_COMPONENTE = C.ID_TIPO_COMPONENTE
LEFT
JOIN	Missioni			M
ON		M.Id_Udc = UT.Id_Udc
WHERE M.Id_Udc IS NULL AND P.ID_TIPO_PARTIZIONE IN ('MA','AT')
GO
