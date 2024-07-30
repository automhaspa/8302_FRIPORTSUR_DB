CREATE TABLE [dbo].[Piani_Mappature]
(
[Id_Piano_Mappatura] [int] NOT NULL IDENTITY(1, 1),
[Id_Partizione_Macchina] [int] NULL,
[Id_Item_destinazione] [int] NULL,
[Da_Colonna] [int] NULL,
[A_Colonna] [int] NULL,
[Da_Piano] [int] NULL,
[A_Piano] [int] NULL,
[Da_Profondita] [int] NULL,
[A_Profondita] [int] NULL,
[CreationDatetime] [datetime] NULL,
[LastUpdateDatetime] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Piani_Mappature] ADD CONSTRAINT [PK_Piani_Mappature] PRIMARY KEY CLUSTERED ([Id_Piano_Mappatura]) ON [PRIMARY]
GO
