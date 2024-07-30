SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW [AwmConfig].[vRegole]
AS
SELECT	R.Id_Regola,
		R.Nome,
		R.Descrizione,
      -- Id_Insieme_Regole,
		CASE WHEN  R.Ordinamento = 0 THEN 'Filtro' ELSE 'Ordinamento' END AS Tipo 
FROM	dbo.Regole R

GO
