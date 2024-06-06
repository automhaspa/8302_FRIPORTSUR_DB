CREATE TABLE [dbo].[Liste_Associazioni_Storico]
(
[Id_Lista_Associazione_Storico] [int] NOT NULL IDENTITY(1, 1),
[Id_Lista_Dettaglio] [int] NOT NULL,
[Id_Udc] [int] NOT NULL,
[Id_UdcDettaglio] [int] NULL,
[Qta_Richiesta] [numeric] (18, 4) NULL,
[Qta_Evasa] [numeric] (18, 4) NULL,
[Qta_Rifiutata] [numeric] (18, 4) NULL,
[Elaborato] [bit] NULL,
[Id_Partizione] [int] NULL,
[Operatore] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Label_Aggiuntive] [xml] NULL,
[Sequenza] [int] NULL,
[Data_Creazione] [datetime] NULL,
[Data_Aggiornamento] [datetime] NULL,
[Data_Storicizzazione] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Liste_Associazioni_Storico] ADD CONSTRAINT [PK_Liste_Associazioni_Storico] PRIMARY KEY CLUSTERED ([Id_Lista_Associazione_Storico]) ON [PRIMARY]
GO
