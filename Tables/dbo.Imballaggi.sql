CREATE TABLE [dbo].[Imballaggi]
(
[Id_Imballaggio] [int] NOT NULL IDENTITY(1, 1),
[Codice_Imballaggio] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Id_Unita_Misura] [varchar] (3) COLLATE Latin1_General_CI_AS NOT NULL,
[Impilabile] [bit] NULL,
[Descrizione] [nvarchar] (255) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Imballaggi] ADD CONSTRAINT [PK_Imballaggi] PRIMARY KEY CLUSTERED ([Id_Imballaggio]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Imballaggi] ADD CONSTRAINT [FK_Imballaggi_Tipo_Unita_Misura] FOREIGN KEY ([Id_Unita_Misura]) REFERENCES [dbo].[Tipo_Unita_Misura] ([Id_Unita_Misura])
GO
