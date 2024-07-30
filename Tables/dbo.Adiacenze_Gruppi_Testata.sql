CREATE TABLE [dbo].[Adiacenze_Gruppi_Testata]
(
[Id_Gruppo_Adiacenza] [int] NOT NULL IDENTITY(1, 1),
[Regola] [varchar] (100) COLLATE Latin1_General_CI_AS NULL,
[Id_Tipo_Gruppo_Adiacenza] [int] NULL,
[Stato_Gruppo] [int] NULL,
[Descrizione] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adiacenze_Gruppi_Testata] ADD CONSTRAINT [PK_Adiacenze_Gruppi_Testata] PRIMARY KEY CLUSTERED ([Id_Gruppo_Adiacenza]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adiacenze_Gruppi_Testata] WITH NOCHECK ADD CONSTRAINT [FK_Tipo_Gruppo_Tipo_Gruppo] FOREIGN KEY ([Id_Tipo_Gruppo_Adiacenza]) REFERENCES [dbo].[Tipo_Gruppo_Adiacenza] ([Id_Tipo_Gruppo_Adiacenza])
GO
