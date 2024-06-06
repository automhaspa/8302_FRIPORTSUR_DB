SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [AwmConfig].[vTIPO_UDC]
AS
	SELECT	Id_Tipo_Udc				Value,
			Descrizione				Description
	FROM	dbo.Tipo_Udc
	WHERE	Id_Tipo_Udc <> 'N'

GO
