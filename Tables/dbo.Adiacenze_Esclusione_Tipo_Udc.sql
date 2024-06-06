CREATE TABLE [dbo].[Adiacenze_Esclusione_Tipo_Udc]
(
[Id_Adiacenza] [int] NOT NULL,
[Id_Tipo_Udc] [varchar] (1) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adiacenze_Esclusione_Tipo_Udc] ADD CONSTRAINT [PK_Adiacenze_Esclusione] PRIMARY KEY CLUSTERED ([Id_Adiacenza], [Id_Tipo_Udc]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adiacenze_Esclusione_Tipo_Udc] ADD CONSTRAINT [FK_Adiacenze_Esclusione_Adiacenze] FOREIGN KEY ([Id_Adiacenza]) REFERENCES [dbo].[Adiacenze] ([Id_Adiacenza])
GO
ALTER TABLE [dbo].[Adiacenze_Esclusione_Tipo_Udc] ADD CONSTRAINT [FK_Adiacenze_Esclusione_Tipo_Udc] FOREIGN KEY ([Id_Tipo_Udc]) REFERENCES [dbo].[Tipo_Udc] ([Id_Tipo_Udc])
GO
