SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   VIEW [Logs].[DataFromAsi]
AS

select 
               TimeStamp,
               CONVERT(VARCHAR(MAX),DataCluster) DataCluster,
               CodPlc,
               MessageId,
               MessageType 
		FROM Logs.CommunicationManagerLogs
Where MessageId = 11031
--ORDER  BY Timestamp Desc

GO
