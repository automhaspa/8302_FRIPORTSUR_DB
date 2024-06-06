SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE      VIEW [AwmConfig].[vQuote_Mappatura]
AS


SELECT	qm.Id_Partizione,    
		min(ps.DESCRIZIONE) as Partizione,
		qm.Id_Riferimento,
		min(pr.DESCRIZIONE) as Riferimento,
		MAX(CASE WHEN qm.Tipo_Quota = 0 THEN qm.Valore ELSE NULL END) AS X,
		MAX(CASE WHEN qm.Tipo_Quota = 1 THEN qm.Valore ELSE NULL END) AS Y,
		MAX(CASE WHEN qm.Tipo_Quota = 2 THEN qm.Valore ELSE NULL END) AS Z,
		MAX(qm.Ultimo_Aggiornamento) AS Ultimo_Aggiornamento
FROM	dbo.Quote_mappatura qm
JOIN	dbo.Partizioni ps
ON		qm.Id_Partizione = ps.ID_PARTIZIONE
JOIN	dbo.Partizioni pr
on		qm.Id_Partizione = pr.ID_PARTIZIONE
GROUP BY
    qm.Id_Partizione,
    qm.Id_Riferimento


GO
