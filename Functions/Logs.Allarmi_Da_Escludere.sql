SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE   FUNCTION [Logs].[Allarmi_Da_Escludere]()
RETURNS @Allarmi_Da_Escludere TABLE	(Alarm_Id INT NOT NULL)
AS
BEGIN
	INSERT INTO @Allarmi_Da_Escludere
	SELECT	AL.ID
	FROM	LOGS.Alarms							AL
	JOIN	LOGS.Allarmi_Apertura_Porta()		AAA
	ON		AL.ID <> AAA.Alarm_Id
		AND AL.RaisedTimeStamp BETWEEN AAA.Raised_Time_Stamp AND AAA.Resetted_Time_Stamp
	GROUP
		BY	AL.Id
	OPTION(RECOMPILE)

	RETURN
END




GO
