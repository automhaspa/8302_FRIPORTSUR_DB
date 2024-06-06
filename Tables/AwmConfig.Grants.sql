CREATE TABLE [AwmConfig].[Grants]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[Key] [nvarchar] (200) COLLATE Latin1_General_CI_AS NOT NULL,
[ClientId] [nvarchar] (200) COLLATE Latin1_General_CI_AS NOT NULL,
[CreationTime] [datetime2] NOT NULL,
[AccessTokenReleaseTime] [datetime2] NULL,
[Data] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[Expiration] [datetime2] NULL,
[Revocation] [datetime2] NULL,
[SubjectId] [nvarchar] (200) COLLATE Latin1_General_CI_AS NOT NULL,
[Type] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[SessionId] [nvarchar] (255) COLLATE Latin1_General_CI_AS NULL,
[Description] [nvarchar] (255) COLLATE Latin1_General_CI_AS NULL,
[ConsumedTime] [datetime2] NULL
) ON [PRIMARY]
GO
ALTER TABLE [AwmConfig].[Grants] ADD CONSTRAINT [PK__Grants__3213E83F7858C23A] PRIMARY KEY CLUSTERED ([id]) ON [PRIMARY]
GO
