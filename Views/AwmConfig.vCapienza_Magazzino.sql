SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [AwmConfig].[vCapienza_Magazzino]	
WITH SCHEMABINDING
AS

SELECT	ISNULL(Magaz.Capienza_Magazzino,0)			Capienza_Magazzino,
		Udc.N_Udc_Stoccati
FROM	(
			SELECT	SUM(CAPIENZA)	Capienza_Magazzino
			FROM	dbo.Partizioni
			WHERE	ID_TIPO_PARTIZIONE IN ('MA','AT')
		)				Magaz
JOIN	(
			SELECT	COUNT(1)		N_Udc_Stoccati
			FROM	dbo.Udc_Posizione	UP
			JOIN	dbo.Partizioni		P
			ON		Up.Id_Partizione = P.ID_PARTIZIONE
			WHERE	P.ID_TIPO_PARTIZIONE IN ('MA','AT') 
		)				Udc
ON		1 = 1
GO
