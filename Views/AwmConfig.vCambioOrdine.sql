SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE   VIEW [AwmConfig].[vCambioOrdine]
AS		
		SELECT	2	AS Value, 'Accoda'			AS Description
UNION	SELECT	-2	AS Value, 'Primo'			AS Description
UNION	SELECT	-1	AS Value, 'Alza'			AS Description
UNION	SELECT	1	AS Value, 'Abbassa'			AS Description
UNION	SELECT	0	AS Value, 'Rimuovi'			AS Description


GO
