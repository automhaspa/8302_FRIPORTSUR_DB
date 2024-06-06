CREATE TABLE [Logs].[Alarms]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[TagId] [varchar] (500) COLLATE Latin1_General_CI_AS NULL,
[TagType] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[Description] [varchar] (500) COLLATE Latin1_General_CI_AS NULL,
[RaisedTimeStamp] [datetime] NULL,
[ResettedTimeStamp] [datetime] NULL,
[Id_Tag] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Logs].[Alarms] ADD CONSTRAINT [PK_Alarms_1] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
