CREATE TABLE [dbo].[Udc_Testata]
(
[Id_Udc] [int] NOT NULL IDENTITY(1, 1),
[Data_Inserimento] [datetime] NOT NULL CONSTRAINT [DF_Saldi_Testata_Data_Inserimento] DEFAULT (getdate()),
[Codice_Udc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Id_Tipo_Udc] [varchar] (1) COLLATE Latin1_General_CI_AS NOT NULL,
[Altezza] [int] NOT NULL CONSTRAINT [DF_Udc_Testata_Altezza] DEFAULT ((0)),
[Larghezza] [int] NOT NULL CONSTRAINT [DF_Udc_Testata_Larghezza] DEFAULT ((0)),
[Profondita] [int] NOT NULL CONSTRAINT [DF_Udc_Testata_Profondita] DEFAULT ((0)),
[Peso] [int] NOT NULL CONSTRAINT [DF_Udc_Testata_Peso] DEFAULT ((0)),
[Tara] [int] NULL,
[Surplus_Altezza] [int] NULL,
[Surplus_Larghezza_S1] [int] NULL,
[Surplus_Larghezza_S2] [int] NULL,
[Surplus_Profondita_S1] [int] NULL,
[Surplus_Profondita_S2] [int] NULL,
[Data_Stoccaggio] [datetime] NULL,
[Id_Tipo_Stato_Conformita] [int] NULL CONSTRAINT [DF_Udc_Testata_Id_Tipo_Stato_Conformita] DEFAULT ((0)),
[Attributi_Aggiuntivi] [xml] NULL,
[Id_Contenitore_Schema] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Udc_Testata] ADD CONSTRAINT [PK_Saldi_Testata] PRIMARY KEY CLUSTERED ([Id_Udc]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Udc_Testata] ON [dbo].[Udc_Testata] ([Codice_Udc]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Udc_Testata] ADD CONSTRAINT [FK_udc_contenitori_preset] FOREIGN KEY ([Id_Contenitore_Schema]) REFERENCES [dbo].[Contenitori_Schema] ([Id_Contenitore_Schema])
GO
ALTER TABLE [dbo].[Udc_Testata] ADD CONSTRAINT [FK_Udc_Testata_Tipo_Stato_Conformita] FOREIGN KEY ([Id_Tipo_Stato_Conformita]) REFERENCES [dbo].[Tipo_Stato_Conformita] ([Id_Tipo_Stato_Conformita])
GO
ALTER TABLE [dbo].[Udc_Testata] ADD CONSTRAINT [FK_Udc_Testata_Tipo_Udc] FOREIGN KEY ([Id_Tipo_Udc]) REFERENCES [dbo].[Tipo_Udc] ([Id_Tipo_Udc])
GO
