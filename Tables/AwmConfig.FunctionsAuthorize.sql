CREATE TABLE [AwmConfig].[FunctionsAuthorize]
(
[TilesName] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Page] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[AuthRoles] [int] NOT NULL,
[DestinationPage] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[ViewName] [nvarchar] (30) COLLATE Latin1_General_CI_AS NOT NULL,
[Sequence] [int] NOT NULL CONSTRAINT [DF_FunctionsAuthorize_Sequence] DEFAULT ((1)),
[AwesomeFont] [nchar] (6) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [DF_FunctionsAuthorize_AwesomeFont] DEFAULT (N'\uf067'),
[AwesomeFontFamily] [nchar] (4) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [DF_FunctionsAuthorize_AwesomeFontFamily] DEFAULT (N'FA-S'),
[DisplayFilter] [varchar] (100) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [AwmConfig].[FunctionsAuthorize] ADD CONSTRAINT [PK_FunctionsAuthorize] PRIMARY KEY CLUSTERED ([TilesName], [Page]) ON [PRIMARY]
GO
