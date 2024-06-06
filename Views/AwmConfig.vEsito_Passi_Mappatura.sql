SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE      VIEW [AwmConfig].[vEsito_Passi_Mappatura]
AS


SELECT	epm.Id,
		epm.Id_Piano_Mappatura,
		epm.Id_Missione,
		epm.Id_Partizione_Sorgente,
		ps.DESCRIZIONE as Macchina,
		epm.Id_Partizione_Destinazione,
		pd.DESCRIZIONE as Partizione_Destinazione,
		epm.Id_Sequenza,
		epm.Id_Tipo_Stato_Percorso,
		epm.Id_errore_Percorso,
		epm.Data_Esecuzione
FROM	dbo.Esito_Passi_Mappatura epm
JOIN	dbo.Partizioni ps
on		ps.ID_PARTIZIONE = epm.Id_Partizione_Sorgente
JOIN	dbo.Partizioni pd
on		pd.ID_PARTIZIONE = epm.Id_Partizione_Destinazione
WHERE	epm.Id_Tipo_Stato_Percorso <> 3

GO
