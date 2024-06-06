CREATE TABLE [Logs].[IdentityServiceLogs]
(
[LogLevel] [nvarchar] (20) COLLATE Latin1_General_CI_AS NULL,
[CategoryName] [nvarchar] (150) COLLATE Latin1_General_CI_AS NULL,
[EventId] [nvarchar] (50) COLLATE Latin1_General_CI_AS NULL,
[TimeStamp] [datetime] NULL,
[Message] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
