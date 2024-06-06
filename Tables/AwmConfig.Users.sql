CREATE TABLE [AwmConfig].[Users]
(
[SubjectId] [nvarchar] (25) COLLATE Latin1_General_CI_AS NOT NULL,
[AccessKey] [nvarchar] (25) COLLATE Latin1_General_CI_AS NOT NULL,
[UserName] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[DisplayName] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Email] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Password] [nvarchar] (500) COLLATE Latin1_General_CI_AS NOT NULL,
[Partition] [int] NOT NULL,
[Roles] [int] NOT NULL,
[ResetPwdLink] [nvarchar] (50) COLLATE Latin1_General_CI_AS NULL,
[ResetPwdValidity] [datetime] NULL,
[Configurazione] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [AwmConfig].[Users] ADD CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([SubjectId]) ON [PRIMARY]
GO
