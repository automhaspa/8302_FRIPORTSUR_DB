SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   VIEW [Graph].[OreLavoro]
AS

WITH DateInMonth AS
(
	SELECT	1	DayBefore, DATEFROMPARTS(YEAR(GETDATE()),MONTH(GETDATE()),1)				DATA
    UNION ALL
    SELECT	DayBefore + 1, DATEFROMPARTS(YEAR(GETDATE()),MONTH(GETDATE()),DayBefore + 1)
	FROM	DateInMonth
    WHERE	DayBefore + 1 <= DAY(EOMONTH(DATEFROMPARTS(YEAR(GETDATE()),MONTH(GETDATE()),1)))
)
SELECT	DM.DATA								XAxis,
		'Ore Lavoro'						Labels,
		CASE
			WHEN MIN(ISNULL(MS.Id_Missione,0)) = 0 THEN 0
			ELSE CEILING(DATEDIFF
							(
								MINUTE,
								MIN(Data_Creazione),
								MAX(CASE WHEN DAY(Data_Storicizzazione) <> DAY(Data_Creazione) THEN Data_Creazione ELSE Data_Storicizzazione END)
							)/60.0)
		END									YAxis
FROM	DateInMonth					DM
LEFT
JOIN	dbo.Missioni_Storico		MS
ON		CAST(MS.Data_Creazione AS DATE) = DM.DATA
WHERE	ISNULL(Stato_Missione,'TOK') = 'TOK'
GROUP
	BY	DM.DATA

GO
