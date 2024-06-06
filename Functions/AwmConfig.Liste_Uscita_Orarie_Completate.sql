SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE   FUNCTION [AwmConfig].[Liste_Uscita_Orarie_Completate]()
RETURNS @Liste TABLE
(
	N_Liste		INT				NULL,
	Data		SMALLDATETIME	NOT NULL
)
AS
BEGIN
	WITH Liste_Filtrate AS
	(		
		SELECT	L.Id_Lista,
				DATEADD(HH,DATEPART(HH,L.Data_Evasione),CAST(CAST(L.Data_Evasione AS DATE) AS DATETIME)) AS Data
		FROM	dbo.Liste		L
		WHERE	L.Id_Tipo_Lista IN ('PKL', 'TDO', 'SHP')
			AND L.Data_Evasione IS NOT NULL
	)
	INSERT INTO @Liste
	(
	    N_Liste,
	    Data
	)
	SELECT	COUNT(DISTINCT Id_Lista),
			Data
	FROM	Liste_Filtrate
	GROUP
		BY	Data

	RETURN;
END

GO
