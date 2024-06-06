CREATE TABLE [AwmConfig].[Printers]
(
[PrinterId] [int] NOT NULL,
[PrinterCode] [nchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[Description] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Ip] [nvarchar] (15) COLLATE Latin1_General_CI_AS NOT NULL,
[Handler] [nvarchar] (25) COLLATE Latin1_General_CI_AS NOT NULL,
[Status] [int] NOT NULL,
[IsEnabled] [bit] NOT NULL CONSTRAINT [DF_Stampanti_Attiva] DEFAULT ((1))
) ON [PRIMARY]
GO
ALTER TABLE [AwmConfig].[Printers] ADD CONSTRAINT [PK_Stampanti] PRIMARY KEY CLUSTERED ([PrinterId]) ON [PRIMARY]
GO
ALTER TABLE [AwmConfig].[Printers] ADD CONSTRAINT [FK_Printers_Tipo_Stato_Stampante] FOREIGN KEY ([Status]) REFERENCES [dbo].[Tipo_Stato_Stampante] ([Id_Stato_Stampante])
GO
