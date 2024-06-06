SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [dbo].[vRushData] 
AS
WITH Prenotazioni AS
(
SELECT	ROW_NUMBER() OVER (ORDER BY [TIMESTAMP] DESC) RIGA,
		TimeStamp,
		Message  
FROM	Logs.CoreServiceLogs 
WHERE	CategoryName = 'Automha.Warehouse.Entities.Items.RushMoverLoop'
	AND LogLevel = 'Warning'
)

SELECT  C.ID_COMPONENTE,
        T.RushMover,
        T.Data,
        UT.Codice_Udc            Carico,
        PR.Id_Missione,        
        PD.DESCRIZIONE        Destinazione
FROM    dbo.Componenti                    C
JOIN    dbo.SottoComponenti                SC
ON      SC.ID_COMPONENTE = C.ID_COMPONENTE
JOIN    dbo.Partizioni                    P
ON      P.ID_SOTTOCOMPONENTE = SC.ID_SOTTOCOMPONENTE
LEFT
JOIN    dbo.Udc_Posizione                UP
ON      UP.Id_Partizione = P.ID_PARTIZIONE
LEFT
JOIN    dbo.Udc_Testata                    UT
ON      UT.Id_Udc = UP.Id_Udc
LEFT
JOIN    dbo.RushMoverData()            T
ON      T.RushMover = C.DESCRIZIONE
LEFT
JOIN    dbo.Percorso                    PR
ON      PR.Id_Tipo_Stato_Percorso IN(2,9)
AND     PR.Id_Partizione_Sorgente = P.ID_PARTIZIONE
LEFT
JOIN    dbo.Partizioni                PD
ON      PD.ID_PARTIZIONE = PR.Id_Partizione_Destinazione
WHERE   C.Tipo = 'RushMover'
UNION
SELECT  TOP 1
        C.ID_COMPONENTE,
        C.DESCRIZIONE,
        P.Message + ' (' + convert(varchar(20), DATEDIFF(SECOND, P.TimeStamp, GETDATE())) + ' sec ago)',
        NULL,
        NULL,
        NULL
FROM    Prenotazioni P  
JOIN    dbo.Componenti    C
ON      C.Tipo = 'RushMoverLoop'
WHERE   P.RIGA = 1

GO
