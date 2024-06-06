CREATE TABLE [AwmConfig].[Navigation]
(
[NavigationKey] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[entityTypeNameSource] [nvarchar] (250) COLLATE Latin1_General_CI_AS NOT NULL,
[hashSource] [varchar] (250) COLLATE Latin1_General_CI_AS NOT NULL,
[fieldNameSource] [varchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[entityTypeNameDest] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[hashDest] [varchar] (250) COLLATE Latin1_General_CI_AS NOT NULL,
[fieldNameDest] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[AuthRoles] [bigint] NULL,
[childOrder] [varchar] (250) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [AwmConfig].[Navigation] ADD CONSTRAINT [PK_Navigation] PRIMARY KEY CLUSTERED ([NavigationKey], [entityTypeNameSource], [hashSource], [fieldNameSource]) ON [PRIMARY]
GO
