SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [TESTS].[CommLog] AS
SELECT [LogLevel]
      ,[TimeStamp]
	  ,[CodPlc]
	  ,TM.Descrizione MSG
	  ,[MessageType]
	  ,[TESTS].[humanReadableXmlDataCluster](MEssageId,DataCluster) hrDataCluster
	  ,DataCluster
  FROM [Logs].[CommunicationManagerLogs] COMMLOG
  LEFT JOIN Tipo_Messaggi TM ON COMMLOG.MessageId=TM.Id_Tipo_Messaggio
  
GO
