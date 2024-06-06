CREATE TABLE [dbo].[Tipo_Udc]
(
[Id_Tipo_Udc] [varchar] (1) COLLATE Latin1_General_CI_AS NOT NULL,
[Descrizione] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Tara] [int] NULL CONSTRAINT [DF_Tipo_Udc_TARA] DEFAULT ((0)),
[Handling_Mode] [int] NOT NULL CONSTRAINT [DF_Tipo_Udc_Handling_Mode] DEFAULT ((1)),
[Persistenza] [bit] NOT NULL CONSTRAINT [DF_Tipo_Udc_Persistenza] DEFAULT ((0)),
[Altezza] [int] NULL,
[Larghezza] [int] NULL,
[Profondita] [int] NULL,
[Peso_Max] [int] NULL,
[Max_Colonne_Scomparto] [int] NULL,
[Max_Righe_Scomparto] [int] NULL,
[Icona] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[Selectable] [bit] NULL CONSTRAINT [DF_Tipo_Udc_Selectable] DEFAULT ((1)),
[Surplus_Altezza] [int] NULL,
[Surplus_Larghezza_S1] [int] NULL,
[Surplus_Larghezza_S2] [int] NULL,
[Surplus_Profondita_S1] [int] NULL,
[Surplus_Profondita_S2] [int] NULL,
[Surplus_Altezza_Min] [int] NULL,
[Surplus_Profondita_S1_Min] [int] NULL,
[Surplus_Profondita_S2_Min] [int] NULL,
[Surplus_Larghezza_S1_Min] [int] NULL,
[Surplus_Larghezza_S2_Min] [int] NULL,
[Altezza_Min] [int] NULL,
[Larghezza_Min] [int] NULL,
[Profondita_Min] [int] NULL,
[Peso_Min] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tipo_Udc] ADD CONSTRAINT [PK_Tipo_Udc] PRIMARY KEY CLUSTERED ([Id_Tipo_Udc]) ON [PRIMARY]
GO
