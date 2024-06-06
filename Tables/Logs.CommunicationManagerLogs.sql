CREATE TABLE [Logs].[CommunicationManagerLogs]
(
[LogLevel] [nvarchar] (20) COLLATE Latin1_General_CI_AS NULL,
[CategoryName] [nvarchar] (150) COLLATE Latin1_General_CI_AS NULL,
[EventId] [nvarchar] (50) COLLATE Latin1_General_CI_AS NULL,
[TimeStamp] [datetime] NULL,
[Message] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[Channel] [nvarchar] (50) COLLATE Latin1_General_CI_AS NULL,
[DataCluster] [xml] NULL,
[CodPlc] [nvarchar] (14) COLLATE Latin1_General_CI_AS NULL,
[MessageId] [nvarchar] (10) COLLATE Latin1_General_CI_AS NULL,
[MessageType] [nvarchar] (20) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
