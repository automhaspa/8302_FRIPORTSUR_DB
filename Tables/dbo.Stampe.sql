CREATE TABLE [dbo].[Stampe]
(
[Id_Stampa] [int] NOT NULL IDENTITY(1, 1),
[Id_Stampante] [int] NULL,
[Id_Utente] [nvarchar] (25) COLLATE Latin1_General_CI_AS NOT NULL,
[Descrizione] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Template] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[Variabili] [xml] NOT NULL,
[Id_Tipo_Stato_Stampa] [int] NOT NULL,
[Data_Inserimento] [datetime] NOT NULL CONSTRAINT [DF_Stampe_DataInserimento] DEFAULT (getdate()),
[Data_Stampa] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Stampe] ADD CONSTRAINT [PK_Stampe] PRIMARY KEY CLUSTERED ([Id_Stampa]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Stampe] ADD CONSTRAINT [FK_Stampe_Printers] FOREIGN KEY ([Id_Stampante]) REFERENCES [AwmConfig].[Printers] ([PrinterId])
GO
ALTER TABLE [dbo].[Stampe] ADD CONSTRAINT [FK_Stampe_Stampe] FOREIGN KEY ([Id_Stampa]) REFERENCES [dbo].[Stampe] ([Id_Stampa])
GO
