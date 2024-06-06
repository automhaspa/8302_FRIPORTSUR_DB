SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW	[Mobile].[vUdcTestata]

AS

SELECT	CONVERT(INT,UT.Id_Udc) AS Id_Udc,	
		UT.Codice_Udc,
		TU.Id_Tipo_Udc, TU.Descrizione AS Tipo_Udc,
		UP.Id_Partizione, UP.X, UP.Y, UP.Z,
		P.DESCRIZIONE AS Partizione,
		M.Codice_Abbreviato + '.'
				+ A.CODICE_ABBREVIATO + SA.CODICE_ABBREVIATO + C.CODICE_ABBREVIATO + '.' 
				+ SC.CODICE_ABBREVIATO 
				+ '.' + P.CODICE_ABBREVIATO					AS CODPLC,
		m.Id_Magazzino,
		m.Descrizione AS Desc_Magazzino,
		TC.DESCRIZIONE AS Tipo_Componente,
		TC.ID_TIPO_COMPONENTE,
		UT.Altezza,
		UT.Larghezza,
		UT.Profondita,
		UT.Peso, 
		ut.Id_Tipo_Stato_Conformita,
		TSC.Descrizione AS Stato_Conformita,
		(SELECT COUNT(DISTINCT Id_Contenitore) FROM dbo.Contenitori AS c WHERE c.Id_Udc = ut.Id_Udc) AS Numero_Contenitori,
		CAST(  (SELECT COUNT(DISTINCT Id_Contenitore) FROM dbo.Contenitori AS c WHERE c.Id_Udc = ut.Id_Udc AND c.Codice = ut.Codice_Udc) AS BIT) AS IsDoublePallet,
		(SELECT COUNT(*) FROM dbo.Udc_Dettaglio AS UD WHERE UD.Id_Udc = ut.Id_Udc AND UD.Id_Contenitore IS NULL) AS Numero_DettagliSenzaContenitore,
		MISSIONI.Utente AS Utente_Missione
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
JOIN	dbo.Tipo_Stato_Conformita TSC
ON		TSC.Id_Tipo_Stato_Conformita = UT.Id_Tipo_Stato_Conformita
LEFT
JOIN  dbo.SottoAree AS sa
ON sa.ID_SOTTOAREA = C.ID_SOTTOAREA
LEFT JOIN dbo.Aree AS a ON a.ID_AREA = sa.ID_AREA
LEFT JOIN dbo.Magazzini AS m ON m.Id_Magazzino = a.Id_Magazzino
LEFT JOIN dbo.Missioni ON Missioni.Id_Udc = UT.Id_Udc
WHERE ut.Id_Tipo_Udc <> 'O'

GO
