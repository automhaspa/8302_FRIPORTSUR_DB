SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [AwmConfig].[vStatisticheOrarie]
AS	

WITH Hours AS
(
	SELECT	1	HourBefore,
			SMALLDATETIMEFROMPARTS(YEAR(GETDATE()),MONTH(GETDATE()),DAY(GETDATE()),DATEPART(HOUR,GETDATE()),0)	DATA
	UNION ALL
	SELECT	HourBefore + 1,
			DATEADD(HOUR, -1, Hours.DATA)
	FROM	Hours
	WHERE	Hours.HourBefore < 24
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
				SELECT	DATEADD(MINUTE, -1 * DATEPART(MINUTE, CONVERT(SMALLDATETIME, Data_Storicizzazione)), CONVERT(SMALLDATETIME, Data_Storicizzazione))		DATA,
						Id_Tipo_Missione																														Id_Tipo_Missione,
						COUNT(DISTINCT Id_Missione)																												N
				FROM	dbo.Missioni_Storico
				WHERE	Stato_Missione = 'TOK'
				GROUP
					BY	DATEADD(MINUTE, -1 * DATEPART(MINUTE, CONVERT(SMALLDATETIME, Data_Storicizzazione)), CONVERT(SMALLDATETIME, Data_Storicizzazione)),
						Id_Tipo_Missione
			) T
	PIVOT	(
				SUM(N)
				FOR Id_Tipo_Missione IN ([ING], [INL], [RCS], [OUP], [OUL], [OUT], [INA], [MAN])
			) PVT
	GROUP
		BY	PVT.DATA
),
Ore_Lavoro AS
(
	SELECT	CAST(Timestamp AS DATE)								Data,
			DATEDIFF(MINUTE,MIN(Timestamp),MAX(Timestamp))		Min_Lavoro
	FROM	Logs.CommunicationManagerLogs
	WHERE	MessageType  IN ( 'MSG RCV', 'MSG SND')
	GROUP
		BY	CAST(Timestamp AS DATE)
)
SELECT	H.DATA,
        NSM.N_Inbound,
        NSM.N_Outbound,
        NSM.N_Rejection,
        NSM.N_Totale
FROM	Hours					H
LEFT
JOIN	N_Storico_Missioni		NSM
ON		NSM.DATA = H.DATA

GO
