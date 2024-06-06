CREATE TABLE [dbo].[Quote_Macchina]
(
[Id_Componente] [int] NOT NULL,
[Id_Partizione] [int] NOT NULL,
[Id_Quota] [int] NOT NULL,
[Id_Tipo_Quota] [tinyint] NOT NULL,
[Valore] [float] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Quote_Macchina] ADD CONSTRAINT [PK_Quote_Macchina] PRIMARY KEY CLUSTERED ([Id_Componente], [Id_Partizione], [Id_Quota], [Id_Tipo_Quota]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Quote_Macchina] ADD CONSTRAINT [FK_Quote_Macchina_Componenti] FOREIGN KEY ([Id_Componente]) REFERENCES [dbo].[Componenti] ([ID_COMPONENTE])
GO
ALTER TABLE [dbo].[Quote_Macchina] ADD CONSTRAINT [FK_Quote_Macchina_Partizioni] FOREIGN KEY ([Id_Partizione]) REFERENCES [dbo].[Partizioni] ([ID_PARTIZIONE])
GO
ALTER TABLE [dbo].[Quote_Macchina] ADD CONSTRAINT [FK_Quote_Macchina_Tipo_Quote_Macchina] FOREIGN KEY ([Id_Tipo_Quota]) REFERENCES [dbo].[Tipo_Quote_Macchina] ([Id_Tipo_Quota])
GO
