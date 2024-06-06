CREATE TABLE [dbo].[Associazione_Stampanti]
(
[PrinterId] [int] NOT NULL,
[SubjectId] [nvarchar] (25) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Associazione_Stampanti] ADD CONSTRAINT [PK_Associazioni_Stampanti] PRIMARY KEY CLUSTERED ([SubjectId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Associazione_Stampanti] ADD CONSTRAINT [FK_Associazioni_Stampanti_Printers] FOREIGN KEY ([PrinterId]) REFERENCES [AwmConfig].[Printers] ([PrinterId])
GO
ALTER TABLE [dbo].[Associazione_Stampanti] ADD CONSTRAINT [FK_Associazioni_Stampanti_Users] FOREIGN KEY ([SubjectId]) REFERENCES [AwmConfig].[Users] ([SubjectId])
GO
