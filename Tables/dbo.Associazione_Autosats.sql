CREATE TABLE [dbo].[Associazione_Autosats]
(
[AutosatId] [int] NOT NULL,
[SubjectId] [nvarchar] (25) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Associazione_Autosats] ADD CONSTRAINT [PK_Associazioni_Autosats] PRIMARY KEY CLUSTERED ([SubjectId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Associazione_Autosats] ADD CONSTRAINT [FK_Associazioni_Autosat_Autosats] FOREIGN KEY ([AutosatId]) REFERENCES [AwmConfig].[Autosats] ([AutosatId])
GO
ALTER TABLE [dbo].[Associazione_Autosats] ADD CONSTRAINT [FK_Associazioni_Autosat_Users] FOREIGN KEY ([SubjectId]) REFERENCES [AwmConfig].[Users] ([SubjectId])
GO
