SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   FUNCTION [Logs].[Inizio_Fine_Giorno](@DayToLoad DATETIME)
RETURNS @Giorni TABLE
(
	StartDateTime	DATETIME NOT NULL,
	EndDateTime		DATETIME NOT NULL
)
AS
BEGIN
	DECLARE @StartDateTime	DATETIME
	DECLARE @EndDateTime	DATETIME

	SELECT	@StartDateTime = TimeStamp
	FROM	LOGS.CommunicationManagerLogs
	WHERE	ISNULL(MessageId,'') <> ''
		AND MessageId <> 11033
		AND CAST(TimeStamp AS DATE) = CAST(@DayToLoad AS DATE)
	ORDER
		BY	TimeStamp DESC

	IF @StartDateTime IS NULL
		SET @StartDateTime = CAST(@DayToLoad AS DATE)

	SELECT	@EndDateTime = TimeStamp
	FROM	LOGS.CommunicationManagerLogs
	WHERE	ISNULL(MessageId,'') <> ''
		AND MessageId <> 11033
		AND CAST(TimeStamp  AS DATE) = CAST(@DayToLoad AS DATE)
	ORDER
		BY	TimeStamp

	IF @EndDateTime IS NULL
		SET @EndDateTime = CAST(DATEADD(DAY,1,@DayToLoad) AS DATE)

	INSERT INTO @Giorni
		(StartDateTime,EndDateTime)
	VALUES
		(@StartDateTime,@EndDateTime)

	RETURN
END


GO
