CREATE TABLE [AwmConfig].[Roles]
(
[Role] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Description] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [AwmConfig].[Roles] ADD CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED ([Role]) ON [PRIMARY]
GO
