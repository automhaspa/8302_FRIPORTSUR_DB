CREATE TABLE [dbo].[Peso_Componenti]
(
[Asi] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[Peso_Indisponibilita_Elettromeccanica] [numeric] (13, 5) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Peso_Componenti] ADD CONSTRAINT [PK_Peso_Componenti] PRIMARY KEY CLUSTERED ([Asi]) ON [PRIMARY]
GO
