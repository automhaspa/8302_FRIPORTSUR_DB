CREATE TABLE [AwmConfig].[Autosats]
(
[AutosatId] [int] NOT NULL,
[AutosatCode] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Description] [nvarchar] (200) COLLATE Latin1_General_CI_AS NOT NULL,
[Ip] [nvarchar] (15) COLLATE Latin1_General_CI_AS NOT NULL,
[Port] [int] NOT NULL,
[Barcode] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[AutosatType] [int] NOT NULL,
[HasCodeReader] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [AwmConfig].[Autosats] ADD CONSTRAINT [PK_Autosats] PRIMARY KEY CLUSTERED ([AutosatId]) ON [PRIMARY]
GO
ALTER TABLE [AwmConfig].[Autosats] ADD CONSTRAINT [FK_Autosats_Tipo_Autosat] FOREIGN KEY ([AutosatType]) REFERENCES [dbo].[Tipo_Autosat] ([Id_Tipo_Autosat])
GO
