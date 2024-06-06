SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE   FUNCTION [AwmConfig].[Picking_Orari_Iniziate]()
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
				DATEADD(HH,DATEPART(HH,MS.Data_Creazione),CAST(CAST(MS.Data_Creazione AS DATE) AS DATETIME)) AS Data
		FROM	dbo.Missioni_Storico	MS
		WHERE	MS.Id_Tipo_Missione IN ('PXD')
		UNION
		--Importante per includere quelle in corso
		SELECT	M.Id_Missione,
				DATEADD(HH,DATEPART(HH,M.Data_Creazione),CAST(CAST(M.Data_Creazione AS DATE) AS DATETIME)) AS Data
		FROM	dbo.Missioni			M
		WHERE	M.Id_Tipo_Missione IN ('PXD')
	)
	INSERT INTO @Missioni
	(
	    N_Missioni,
	    Data
	)
	SELECT	COUNT(DISTINCT Id_Missione),
			Data
	FROM	Missioni_Filtrate
	GROUP
		BY	Data

	RETURN;
END

GO
