CREATE TABLE [dbo].[Liste_Partizioni]
(
[Id_Lista_Partizione] [int] NOT NULL IDENTITY(1, 1),
[Id_Partizione] [int] NOT NULL,
[Id_Lista_Dettaglio] [int] NOT NULL,
[Id_Lista_Associazione] [int] NULL,
[Quantita] [decimal] (18, 4) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Liste_Partizioni] ADD CONSTRAINT [PK_Liste_Partizioni] PRIMARY KEY CLUSTERED ([Id_Lista_Partizione]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Liste_Partizioni] ADD CONSTRAINT [FK_Liste_Partizioni_Liste_Associazioni] FOREIGN KEY ([Id_Lista_Associazione]) REFERENCES [dbo].[Liste_Associazioni] ([Id_Lista_Associazione])
GO
ALTER TABLE [dbo].[Liste_Partizioni] ADD CONSTRAINT [FK_Liste_Partizioni_Liste_Dettaglio] FOREIGN KEY ([Id_Lista_Dettaglio]) REFERENCES [dbo].[Liste_Dettaglio] ([Id_Lista_Dettaglio])
GO
