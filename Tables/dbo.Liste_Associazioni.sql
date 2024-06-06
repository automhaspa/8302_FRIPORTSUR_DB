CREATE TABLE [dbo].[Liste_Associazioni]
(
[Id_Lista_Associazione] [int] NOT NULL IDENTITY(1, 1),
[Id_Lista_Dettaglio] [int] NOT NULL,
[Id_Udc] [int] NOT NULL,
[Id_UdcDettaglio] [int] NULL,
[Qta_Richiesta] [numeric] (18, 4) NULL,
[Qta_Evasa] [numeric] (18, 4) NULL,
[Qta_Rifiutata] [numeric] (18, 4) NULL,
[Elaborato] [bit] NULL,
[Id_Partizione] [int] NULL,
[Operatore] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[Label_Aggiuntive] [xml] NULL,
[Sequenza] [int] NULL,
[Data_Creazione] [datetime] NULL,
[Data_Aggiornamento] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Liste_Associazioni] ADD CONSTRAINT [PK_Liste_Associazioni] PRIMARY KEY CLUSTERED ([Id_Lista_Associazione]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Liste_Associazioni] ADD CONSTRAINT [FK_Liste_Associazioni_Liste_Associazioni] FOREIGN KEY ([Id_Lista_Dettaglio]) REFERENCES [dbo].[Liste_Dettaglio] ([Id_Lista_Dettaglio])
GO
ALTER TABLE [dbo].[Liste_Associazioni] ADD CONSTRAINT [FK_Liste_Associazioni_Udc_Dettaglio] FOREIGN KEY ([Id_UdcDettaglio]) REFERENCES [dbo].[Udc_Dettaglio] ([Id_UdcDettaglio])
GO
ALTER TABLE [dbo].[Liste_Associazioni] ADD CONSTRAINT [FK_Liste_Associazioni_Udc_Testata] FOREIGN KEY ([Id_Udc]) REFERENCES [dbo].[Udc_Testata] ([Id_Udc])
GO
