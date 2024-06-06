SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[vKPI_Magazzino_CompDetagli] AS

SELECT format(CONVERT(date,K.Data_Exec), 'dd/MM/yy' ) as Data_Esecuzione , K.DESCRIZIONE as CODICE, K.COMP_TIPO_DESC as Descrizione_Componente, SUM(K.Millisecondi) as Tempo_Totale_Gionaliero_in_Millisecondi, 
	    COUNT(K.ID_COMPONENTE) AS Numero_di_Volte_Usate, AVG(K.Millisecondi) AS Media_in_Millisecondi
FROM  vKPI_Magazzino k
GROUP BY	CONVERT(date,K.Data_Exec), K.COMP_TIPO_DESC , K.DESCRIZIONE 


GO
