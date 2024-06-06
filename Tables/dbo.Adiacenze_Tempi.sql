CREATE TABLE [dbo].[Adiacenze_Tempi]
(
[Id_Tempo] [int] NOT NULL IDENTITY(1, 1),
[Timestamp] [datetime] NOT NULL,
[Id_Adiacenza] [int] NOT NULL,
[Millisecondi] [int] NOT NULL,
[Id_Missione] [int] NULL,
[Id_Sequenza_Percorso] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adiacenze_Tempi] ADD CONSTRAINT [PK_Adiacenze_Tempi] PRIMARY KEY CLUSTERED ([Id_Tempo]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adiacenze_Tempi] ADD CONSTRAINT [FK_Adiacenze_Tempi_Adiacenze] FOREIGN KEY ([Id_Adiacenza]) REFERENCES [dbo].[Adiacenze] ([Id_Adiacenza])
GO
