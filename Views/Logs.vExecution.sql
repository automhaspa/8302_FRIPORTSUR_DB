SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE   VIEW [Logs].[vExecution]
AS
SELECT L.LogModule,
       L.LogLevel,
       L.CategoryName,
       L.EventId,
       L.TimeStamp,
       L.Message,
       L.Channel,
       L.DataCluster,
       L.CodPlc,
       L.MessageId,
       L.MessageType
FROM
(
    SELECT 'CommunicationManager' AS LogModule,
           LogLevel,
           CategoryName,
           EventId,
           TimeStamp,
           Message,
           Channel,
           DataCluster,
           CodPlc,
           MessageId,
           MessageType
    FROM Logs.CommunicationManagerLogs
    WHERE MessageType IS NOT NULL
          AND MessageType NOT LIKE '%ACK%'
    UNION ALL
    SELECT 'CoreService' AS LogModule,
           LogLevel,
           CategoryName,
           EventId,
           TimeStamp,
           Message,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL
    FROM Logs.CoreServiceLogs
) AS L
WHERE ISNULL(MessageId, 0) <> 11033
      AND Message NOT LIKE '%RawDataFromAsi%'
      AND
      (
          LogLevel <> 'Information'
          OR CategoryName NOT IN ( 'Automha.Warehouse.Entities.Communication.CommunicationCallbackHandler',
                                   'Automha.Warehouse.Entities.Items.RushMoverLoop'
                                 )
      );
GO
