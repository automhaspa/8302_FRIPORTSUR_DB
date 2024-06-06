CREATE TABLE [dbo].[Tipo_Quote_Macchina]
(
[Id_Tipo_Quota] [tinyint] NOT NULL,
[Descrizione] [char] (1) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tipo_Quote_Macchina] ADD CONSTRAINT [PK_Tipo_Quote_Macchina] PRIMARY KEY CLUSTERED ([Id_Tipo_Quota]) ON [PRIMARY]
GO
