SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [AwmConfig].[vStatistiche]
AS

WITH Days AS
(
	SELECT 1 DayBefore, DATEFROMPARTS(YEAR(GETDATE()),MONTH(GETDATE()),DAY(GETDATE())) AS DATA
	UNION 
	ALL
	SELECT	Days.DayBefore + 1 , CONVERT(DATE,DATEADD(DAY, -1,Days.DATA))
	FROM	Days
	WHERE	Days.DayBefore < 30
),
N_Storico_Missioni AS
(
	SELECT	DATA,
			ISNULL(SUM(PVT.[ING]),0) +			
			ISNULL(SUM(PVT.[INA]),0) +
			ISNULL(SUM(PVT.[MAN]),0) +
			ISNULL(SUM(PVT.[INL]),0) N_Inbound,
			ISNULL(SUM(PVT.[OUP]),0) +
			ISNULL(SUM(PVT.[OUL]),0) +
			ISNULL(SUM(PVT.[OUT]),0) N_Outbound,
			ISNULL(SUM(PVT.[RCS]),0) N_Rejection,			

			ISNULL(SUM(PVT.[ING]),0) +			
			ISNULL(SUM(PVT.[INA]),0) +
			ISNULL(SUM(PVT.[MAN]),0) +
			ISNULL(SUM(PVT.[INL]),0) +
			ISNULL(SUM(PVT.[OUP]),0) +
			ISNULL(SUM(PVT.[OUL]),0) +
			ISNULL(SUM(PVT.[OUT]),0) N_Totale
	FROM	(
				SELECT	CAST(Data_Storicizzazione AS DATE)	DATA,
						Id_Tipo_Missione					Id_Tipo_Missione,
						COUNT(DISTINCT Id_Missione)			N
				FROM	dbo.Missioni_Storico
				WHERE	Stato_Missione = 'TOK'
				GROUP
					BY	CAST(Data_Storicizzazione AS DATE),
						Id_Tipo_Missione
			)	T
			PIVOT
			(
				SUM(N)
				FOR Id_Tipo_Missione IN ([ING], [INL], [RCS], [OUP], [OUL], [OUT], [INA], [MAN])
			) PVT
	GROUP
		BY	PVT.DATA
)
SELECT	DM.DATA,
        ISNULL(N_Inbound,0)		N_Inbound,
        ISNULL(N_Outbound,0)	N_Outbound,
        ISNULL(N_Rejection,0)	N_Rejection,
        ISNULL(N_Totale,0)		N_Totale
FROM	Days			DM 
LEFT
JOIN	N_Storico_Missioni	NSM
ON		DM.DATA	= NSM.DATA
GO
