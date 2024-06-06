SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   FUNCTION [Logs].[Allarmi_Apertura_Porta] ()
RETURNS 
	@Allarmi_Apertura_Porte TABLE	(
										Alarm_Id			INT NOT NULL,
										Raised_Time_Stamp	DATETIME NOT NULL,
										Resetted_Time_Stamp	DATETIME NULL
									)
AS
BEGIN
	INSERT INTO @Allarmi_Apertura_Porte (
											Alarm_Id,
											Raised_Time_Stamp,
											Resetted_Time_Stamp
										)
	SELECT	Id,
			RaisedTimeStamp,
			ResettedTimeStamp
	FROM	Logs.Alarms			WITH(NOLOCK)
	WHERE	Description LIKE '%porta%'

	RETURN
END


GO
