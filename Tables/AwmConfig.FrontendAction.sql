CREATE TABLE [AwmConfig].[FrontendAction]
(
[Id_Frontend_Action] [int] NOT NULL IDENTITY(1, 1),
[MethodName] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[AssemblyType] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[Description] [nvarchar] (200) COLLATE Latin1_General_CI_AS NULL,
[NavigationKeyOnSuccess] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[NavigationKeyOnFailure] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[SupportsBulkExecution] [bit] NULL,
[Css] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[AuthRoles] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [AwmConfig].[FrontendAction] ADD CONSTRAINT [PK_FrontendAction] PRIMARY KEY CLUSTERED ([Id_Frontend_Action]) ON [PRIMARY]
GO
