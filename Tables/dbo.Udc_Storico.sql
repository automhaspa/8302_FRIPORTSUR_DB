CREATE TABLE [dbo].[Udc_Storico]
(
[Id_Storico] [int] NOT NULL IDENTITY(1, 1),
[Id_Udc] [int] NOT NULL,
[Data_Inserimento] [datetime] NOT NULL,
[Codice_Udc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Id_Tipo_Udc] [varchar] (1) COLLATE Latin1_General_CI_AS NOT NULL,
[Pieno] [bit] NOT NULL,
[Id_Partizione] [int] NULL,
[cX] [int] NULL,
[cY] [int] NULL,
[cZ] [int] NULL,
[Utente_Cancellazione] [nvarchar] (50) COLLATE Latin1_General_CI_AS NULL,
[Data_Cancellazione] [datetime] NOT NULL,
[Altezza] [int] NOT NULL CONSTRAINT [DF__Udc_Stori__Altez__0539C240] DEFAULT ((0)),
[Larghezza] [int] NOT NULL CONSTRAINT [DF__Udc_Stori__Largh__062DE679] DEFAULT ((0)),
[Profondita] [int] NOT NULL CONSTRAINT [DF__Udc_Stori__Profo__07220AB2] DEFAULT ((0)),
[Peso] [int] NOT NULL CONSTRAINT [DF__Udc_Storic__Peso__08162EEB] DEFAULT ((0)),
[Tara] [int] NULL,
[Surplus_Altezza] [int] NULL,
[Surplus_Larghezza_S1] [int] NULL,
[Surplus_Larghezza_S2] [int] NULL,
[Surplus_Profondita_S1] [int] NULL,
[Surplus_Profondita_S2] [int] NULL,
[Data_Stoccaggio] [datetime] NULL,
[Id_Tipo_Stato_Conformita] [int] NULL,
[Attributi_Aggiuntivi] [xml] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Udc_Storico] ADD CONSTRAINT [PK_Udc_Storico] PRIMARY KEY CLUSTERED ([Id_Storico]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Udc_Storico] ADD CONSTRAINT [FK_Udc_Storico_Tipo_Udc] FOREIGN KEY ([Id_Tipo_Udc]) REFERENCES [dbo].[Tipo_Udc] ([Id_Tipo_Udc])
GO
