CREATE TABLE [dbo].[Adiacenze_Esclusione_Tipo_Missione]
(
[Id_Adiacenza] [int] NOT NULL,
[Id_Tipo_Missione] [varchar] (3) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adiacenze_Esclusione_Tipo_Missione] ADD CONSTRAINT [PK_Adiacenze_Esclusione_Tipo_Missione] PRIMARY KEY CLUSTERED ([Id_Adiacenza], [Id_Tipo_Missione]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adiacenze_Esclusione_Tipo_Missione] ADD CONSTRAINT [FK_Adiacenze_Esclusione_Tipo_Missione] FOREIGN KEY ([Id_Tipo_Missione]) REFERENCES [dbo].[Tipo_Missioni] ([Id_Tipo_Missione])
GO
ALTER TABLE [dbo].[Adiacenze_Esclusione_Tipo_Missione] ADD CONSTRAINT [FK_Adiacenze_Esclusione_Tipo_Missione_Adiacenze] FOREIGN KEY ([Id_Adiacenza]) REFERENCES [dbo].[Adiacenze] ([Id_Adiacenza])
GO
