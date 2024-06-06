SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW [Graph].[DisponibilitaElettromeccanica]
AS

WITH Fault AS
(
	SELECT	CAST((1440 - SUM(Impatto_Totale_Fermi_Minuti)) * 100/1440 AS INT)	Value
	FROM	AwmConfig.vFaultGiornalieriItem
	WHERE	Data = CAST(DATEADD(DAY, -1, GETDATE()) AS DATE)
	GROUP
		BY Data
	UNION
	ALL
	SELECT 100
)
SELECT	'Availability'		Label,
		MIN(VALUE)			Value
FROM	Fault
UNION ALL
SELECT	'Unavailability'	Label,
		100 - MIN(VALUE)	Value
FROM	Fault




GO
