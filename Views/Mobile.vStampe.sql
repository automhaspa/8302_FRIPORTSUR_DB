SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [Mobile].[vStampe]
AS
SELECT  
s.[Id_Stampa], s.[Id_Stampante], s.[Id_Utente], s.[Descrizione], s.[Template], 
'SSCC:' + s.Variabili.value('/Labels[1]/SSCC[1]','nvarchar(100)') AS Dati_Stampa , s.[Id_Tipo_Stato_Stampa], s.[Data_Inserimento], s.[Data_Stampa],ts.Descrizione AS Descrizione_Stato
FROM dbo.Stampe AS s
LEFT JOIN dbo.Tipo_Stato_Stampa AS ts ON ts.ID_Tipo_Stato_Stampa = s.Id_Tipo_Stato_Stampa
WHERE s.data_inserimento > DATEADD(DAY,-2 , GETDATE())
GO
