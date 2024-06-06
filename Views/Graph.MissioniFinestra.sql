SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW [Graph].[MissioniFinestra]
AS
SELECT	CONVERT(SMALLDATETIME, To_Time) AS XAxis, 'Outbound' AS Labels, Outbound_Count AS YAxis 
FROM	AwmConfig.vMissioniFinestra
UNION
ALL
SELECT	CONVERT(SMALLDATETIME, To_Time) AS XAxis, 'Inbound' AS Labels, Inbound_Count AS YAxis 
FROM	AwmConfig.vMissioniFinestra
UNION
ALL
SELECT	CONVERT(SMALLDATETIME, To_Time) AS XAxis, 'Totale' AS Labels, Mission_Count AS YAxis 
FROM	AwmConfig.vMissioniFinestra
GO
