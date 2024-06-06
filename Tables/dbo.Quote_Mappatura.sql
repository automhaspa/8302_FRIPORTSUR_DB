CREATE TABLE [dbo].[Quote_Mappatura]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Id_Riferimento] [int] NOT NULL,
[Id_Partizione] [int] NOT NULL,
[Valore] [float] NOT NULL,
[Tipo_Quota] [int] NOT NULL,
[Ultimo_Aggiornamento] [datetime] NOT NULL,
[Descrizione] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Quote_Mappatura] ADD CONSTRAINT [PK_Quote_Mappatura] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
