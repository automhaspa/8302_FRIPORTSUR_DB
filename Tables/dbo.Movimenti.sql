CREATE TABLE [dbo].[Movimenti]
(
[Id_Movimento] [int] NOT NULL IDENTITY(1, 1),
[Data_Movimento] [datetime] NOT NULL,
[Id_Udc] [int] NOT NULL,
[Codice_Udc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Id_Articolo] [int] NOT NULL,
[Codice_Articolo] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Id_Lotto_Produzione] [int] NULL,
[Codice_Lotto_Produzione] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[Id_Lotto_Stoccaggio] [int] NULL,
[Codice_Lotto_Stoccaggio] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[Id_Imballaggio] [int] NULL,
[Matricola] [varchar] (20) COLLATE Latin1_General_CI_AS NULL,
[Id_Unita_Misura] [varchar] (3) COLLATE Latin1_General_CI_AS NULL,
[Qta_Precedente] [numeric] (18, 4) NOT NULL,
[Qta_Delta] [numeric] (18, 4) NOT NULL,
[Utente] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Id_Causale_Movimenti] [int] NOT NULL,
[Id_Partizione] [int] NULL,
[Id_Azienda_Cliente] [int] NULL,
[Id_Azienda_Fornitore] [int] NULL,
[Id_Contenitore] [int] NULL,
[Codice_Contenitore] [varchar] (50) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Movimenti] ADD CONSTRAINT [PK_Movimenti] PRIMARY KEY CLUSTERED ([Id_Movimento]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Movimenti] ADD CONSTRAINT [FK_Movimenti_TipoCausaliMovimenti] FOREIGN KEY ([Id_Causale_Movimenti]) REFERENCES [dbo].[Tipo_Causali_Movimenti] ([Id_Tipo_Causale])
GO
