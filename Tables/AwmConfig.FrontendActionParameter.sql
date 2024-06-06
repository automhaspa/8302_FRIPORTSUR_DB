CREATE TABLE [AwmConfig].[FrontendActionParameter]
(
[Id_Frontend_Action] [int] NOT NULL,
[Source] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[NameInSource] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[NameInRequest] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[Type] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[DefaultValue] [varchar] (50) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [AwmConfig].[FrontendActionParameter] ADD CONSTRAINT [PK_FrontendActionParameter] PRIMARY KEY CLUSTERED ([Id_Frontend_Action], [Source], [NameInSource]) ON [PRIMARY]
GO
ALTER TABLE [AwmConfig].[FrontendActionParameter] ADD CONSTRAINT [FK_FrontendActionParameter_FrontendAction] FOREIGN KEY ([Id_Frontend_Action]) REFERENCES [AwmConfig].[FrontendAction] ([Id_Frontend_Action])
GO
