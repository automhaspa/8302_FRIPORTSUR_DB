SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [AwmConfig].[vStatisticheDashboard]
WITH SCHEMABINDING
AS	
WITH	N_Storico_Missioni
AS		
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
			ISNULL(SUM(PVT.[INL]),0) +
			ISNULL(SUM(PVT.[OUP]),0) +
			ISNULL(SUM(PVT.[OUL]),0) +
			ISNULL(SUM(PVT.[OUT]),0) +
			ISNULL(SUM(PVT.[MAN]),0) +
			ISNULL(SUM(PVT.[RCS]),0)  N_Totale
			FROM
	(
		SELECT	SM1.DATA,
                SM1.Id_Tipo_Missione,
                SM1.N		FROM 
		(
			SELECT		CONVERT(DATE,Data_Storicizzazione)	AS  DATA,
						Id_Tipo_Missione					AS	Id_Tipo_Missione,
						COUNT(1)							AS	N
			FROM		dbo.Missioni_Storico
			WHERE		Stato_Missione = 'TOK'
			GROUP		
			BY			CONVERT(DATE,Data_Storicizzazione),	
						Id_Tipo_Missione
		)	SM1
	)			AS	T
	PIVOT
	(	
		SUM(N)
		FOR Id_Tipo_Missione IN ([ING], [INL], [RCS], [OUP], [OUL], [OUT], [MAN], [INA])
	)			AS	PVT
	GROUP BY		PVT.DATA
),	
	Ore_Lavoro
AS
(
	SELECT	CONVERT(DATE,Timestamp)	AS Data,
			DATEDIFF
			(
				MINUTE,
				MIN(Timestamp),
				MAX(Timestamp)
			)						AS Min_Lavoro
	FROM	Logs.CommunicationManagerLogs
	WHERE	MessageType  IN ( 'MSG RCV', 'MSG SND')
	GROUP	
	BY		CONVERT(DATE,Timestamp)
),
	Occupazione_Magazzino
AS
(
	SELECT  Magaz.Capienza_Magazzino,  Udc.N_Udc_Stoccati --ISNULL(SUM(CASE WHEN Id_Udc IS NULL THEN 0 ELSE 1 END), 0)
	FROM
	(
		SELECT SUM(CAPIENZA) Capienza_Magazzino FROM dbo.Partizioni WHERE ID_TIPO_PARTIZIONE = 'MA'
	)  AS Magaz
	JOIN	
	(
		SELECT	COUNT(1) AS		N_Udc_Stoccati
		FROM	dbo.Udc_Posizione	UP
		JOIN	dbo.Partizioni		P
		ON		Up.Id_Partizione = P.ID_PARTIZIONE
		WHERE	P.ID_TIPO_PARTIZIONE = 'MA'
	) AS Udc
	ON 1 = 1 
),
	Liste_PK AS
(
	SELECT	COUNT(DISTINCT Id_Lista)									N_Liste,
			SUM(CASE WHEN Id_Tipo_Stato_Lista > 5 THEN 1 ELSE 0 END)	N_Liste_Pk_Evase,
			SUM(CASE WHEN Id_Tipo_Stato_Lista <= 5 THEN 1 ELSE 0 END)	N_Liste_Pk_Aperte
	FROM	dbo.Liste
	WHERE	Id_Tipo_Lista = 'TDO'
		AND CAST(GETDATE() AS DATE) = CAST(ISNULL(Data_Evasione,GETDATE()) AS DATE)
)
SELECT	CONVERT(DATE, GETDATE()) AS DATA,
        ISNULL(NSM.N_Inbound,0)		N_Inbound,
        ISNULL(NSM.N_Outbound,0)		N_Outbound,
        ISNULL(NSM.N_Rejection,0)		N_Rejection,
        ISNULL(NSM.N_Totale,0)			N_Totale,
	
		0 AS N_Totale_Fermi, 
		0 AS N_Liste_Pk_Evase,
		0 AS N_Liste_Pk_Aperte,
		ISNULL(OL.Min_Lavoro,0) / 60 AS Ore_Lavoro,
		ISNULL(OL.Min_Lavoro,0) % 60 AS Min_Lavoro,
		OC.Capienza_Magazzino,
        OC.N_Udc_Stoccati

FROM	AwmConfig.vCapienza_Magazzino		OC 
LEFT
JOIN	N_Storico_Missioni			NSM
ON		NSM.DATA = CONVERT(DATE, GETDATE())
LEFT
JOIN	Ore_Lavoro					OL
ON		OL.Data = CONVERT(DATE, GETDATE())
GO
