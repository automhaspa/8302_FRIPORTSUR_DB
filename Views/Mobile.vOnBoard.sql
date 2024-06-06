SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [Mobile].[vOnBoard] AS
SELECT u.SubjectId,u.DisplayName, p.ID_PARTIZIONE, p.DESCRIZIONE,
(
	SELECT COUNT(1) FROM dbo.Udc_Posizione AS up 
	LEFT JOIN dbo.Udc_Testata AS ut ON ut.Id_Udc = up.Id_Udc
	LEFT JOIN dbo.Missioni AS m ON m.Id_Udc = up.Id_Udc
	WHERE up.Id_Partizione = u.Partition AND (m.Utente IS NULL OR m.Utente = u.SubjectId)
	AND ut.Id_Tipo_Udc <> 'O'
) AS UDC,
(
	SELECT COUNT(DISTINCT ud.Id_Contenitore) 
	FROM mobile.vUdcDettaglio AS ud 
	LEFT JOIN dbo.Udc_Testata AS ut ON ut.Id_Udc = ud.Id_Udc
	WHERE ut.Codice_Udc = 'OP_' + u.SubjectId
	AND ut.Id_Tipo_Udc = 'O' 
	AND ISNULL(ud.Id_Contenitore,'') <> ''
) AS CONTENITORI,
 (
	SELECT COUNT(1) 
	FROM mobile.vUdcDettaglio AS ud 
	LEFT JOIN dbo.Udc_Testata AS ut ON ut.Id_Udc = ud.Id_Udc
	WHERE ut.Codice_Udc = 'OP_' + u.SubjectId
	AND ut.Id_Tipo_Udc = 'O' 
	AND ISNULL(ud.Id_Contenitore,'') = ''
 ) AS ARTICOLI
FROM AwmConfig.Users AS u
LEFT JOIN dbo.Partizioni AS p ON p.ID_PARTIZIONE = u.Partition
WHERE u.Partition <> 0    
GO
