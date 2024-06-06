SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE   FUNCTION [AwmConfig].[Missioni_Uscita_Orarie_Completate]()
RETURNS @Missioni TABLE
(
	N_Missioni		INT NULL,
	Data			SMALLDATETIME NOT NULL
)
AS
BEGIN
	WITH Missioni_Filtrate AS
	(		
		SELECT	MS.Id_Missione,
				DATEADD(HH,DATEPART(HH,MS.Data_Storicizzazione),CAST(CAST(MS.Data_Storicizzazione AS DATE) AS DATETIME)) AS Data
		FROM	dbo.Missioni_Storico	MS
		WHERE	MS.Id_Tipo_Missione IN ('OUT', 'OUL', 'OUP', 'POU')
			AND MS.Stato_Missione = 'TOK'
	)
	INSERT INTO @Missioni
	(
	    N_Missioni,
	    Data
	)
	SELECT	COUNT(DISTINCT Id_Missione),
			Data
	FROM	Missioni_Filtrate	MF
	GROUP
		BY	Data

	RETURN;
END

GO
