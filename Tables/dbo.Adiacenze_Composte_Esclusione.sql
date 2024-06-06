CREATE TABLE [dbo].[Adiacenze_Composte_Esclusione]
(
[Id_Adiacenza_Composta] [int] NOT NULL,
[Id_Tipo_Missione] [varchar] (3) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adiacenze_Composte_Esclusione] ADD CONSTRAINT [PK_Adiacenze_Composte_Esclusione_1] PRIMARY KEY CLUSTERED ([Id_Adiacenza_Composta], [Id_Tipo_Missione]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adiacenze_Composte_Esclusione] ADD CONSTRAINT [FK_Adiacenze_Composte_Esclusione_Adiacenze_Composte] FOREIGN KEY ([Id_Adiacenza_Composta]) REFERENCES [dbo].[Adiacenze_Composte] ([Id_Adiacenza_Composta])
GO
ALTER TABLE [dbo].[Adiacenze_Composte_Esclusione] ADD CONSTRAINT [FK_Adiacenze_Composte_Esclusione_Tipo_Missioni] FOREIGN KEY ([Id_Tipo_Missione]) REFERENCES [dbo].[Tipo_Missioni] ([Id_Tipo_Missione])
GO
