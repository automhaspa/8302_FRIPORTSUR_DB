SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE   VIEW [AwmConfig].[vSottoAree]
AS

SELECT	SA.Id_Sottoarea, 
		SA.DESCRIZIONE			AS Floor,
		CA.Description			AS Comportamento	
FROM	dbo.SottoAree SA
LEFT
JOIN	AwmConfig.vComportamentoSottoArea CA
ON		CA.value = ISNULL(SA.COMPORTAMENTO, 0)
WHERE	SA.DESCRIZIONE like '1_'

GO
