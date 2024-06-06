SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW [AwmConfig].[vPrioritaMissioni]
AS
SELECT  Priorita AS Value, 
		Descrizione AS Description 
FROM	dbo.Tipo_Priorita 
WHERE	Priorita IN (1,3,5)

GO
