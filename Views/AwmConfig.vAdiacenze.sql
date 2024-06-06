SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [AwmConfig].[vAdiacenze]
AS
SELECT	A.Id_Adiacenza
		,A.Id_Partizione_Sorgente
		,PS.DESCRIZIONE SORGENTE
		,A.Id_Partizione_Destinazione
		,PD.DESCRIZIONE DESTINAZIONE
		,A.Descrizione
		,A.Abilitazione
		,A.Peso
		,A.Tipo
		,A.Configurazione
		,A.Direzione,
		a.Min_Lu_No,
		a.Max_Lu_No,
		a.Escludi_Lu_No
FROM	dbo.Adiacenze A
		INNER JOIN dbo.Partizioni PS ON PS.ID_PARTIZIONE = A.Id_Partizione_Sorgente
		INNER JOIN dbo.Partizioni PD ON PD.ID_PARTIZIONE = A.Id_Partizione_Destinazione

GO
