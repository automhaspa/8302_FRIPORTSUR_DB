CREATE TABLE [dbo].[Tipo_Eventi]
(
[Id_Tipo_Evento] [int] NOT NULL,
[Id_Tipo_Destinazione_Eventi] [int] NOT NULL CONSTRAINT [DF_Tipo_Eventi_Id_Tipo_Destinazione_Eventi] DEFAULT ((1)),
[Descrizione] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[Id_Tipo_Gestore_Eventi] [varchar] (3) COLLATE Latin1_General_CI_AS NOT NULL,
[Gestore] [nvarchar] (100) COLLATE Latin1_General_CI_AS NULL,
[Consenti_Presa_In_Carico] [bit] NOT NULL CONSTRAINT [DF_Tipo_Eventi_Consenti_Presa_in_carico] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tipo_Eventi] ADD CONSTRAINT [PK_Tipo_Eventi] PRIMARY KEY CLUSTERED ([Id_Tipo_Evento], [Id_Tipo_Destinazione_Eventi]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tipo_Eventi] ADD CONSTRAINT [FK_Tipo_Eventi_Tipo_Destinazione_Eventi] FOREIGN KEY ([Id_Tipo_Destinazione_Eventi]) REFERENCES [dbo].[Tipo_Destinazione_Eventi] ([Id])
GO
