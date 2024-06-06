SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE   VIEW [AwmConfig].[AsiInfoComponent]
AS

WITH Tipo_Macchine AS
(
	SELECT	ID_COMPONENTE,
			CASE 
				WHEN Id_Tipo_Componente = 'T'	THEN	'STACKERCRANES'	
				WHEN Id_Tipo_Componente = 'P'	THEN	'PEAKMOVERS'
				WHEN Id_Tipo_Componente = 'L'	THEN	'LIFTERS'
				WHEN Id_Tipo_Componente IN ('N','M')
					AND Tipo ='RushMover'		THEN	'RUSHMOVERS'
				WHEN Id_Tipo_Componente IN ('N','M') 
					AND Tipo IS NULL			THEN	'Mover' --
				WHEN Id_Tipo_Componente IN ('N','M') 
					AND Tipo ='Supercap'		THEN	'AUTOSAT'
				WHEN Id_Tipo_Componente IN ('N','M','C') 
					AND Tipo ='Supercap'		THEN	'SUPERCAPS'
				WHEN Id_Tipo_Componente ='R'	THEN    'ROLLER CONV.'
				ELSE NULL
			END	
			AS	Name
	FROM	dbo.Componenti
)
SELECT	P.ID_PARTIZIONE,
		P.DESCRIZIONE					Asi,
		TM.Name							Tipologia,
		P.ALTEZZA,
		P.LARGHEZZA,
		P.PROFONDITA,
		P.PIANO,
		P.COLONNA,
		P.Lu_Count,
		P.LOCKED_INFEED,
		P.LOCKED_OUTFEED,
		vM.ImagePath,
		CAST(CASE
				WHEN ISNULL(P.LOCKED_INFEED,0) = 0
							OR  ISNULL(P.LOCKED_OUTFEED,0) = 0 THEN	1
				ELSE 0
			END		AS BIT)										enableActionId30,
		CAST(	CASE
					WHEN ISNULL(P.LOCKED_INFEED,0) = 1
							OR	 ISNULL(P.LOCKED_OUTFEED,0) = 1 THEN 1
					ELSE 0
				END		AS BIT)									enableActionId31

FROM	AwmConfig.vPartizioni		P
JOIN	Tipo_Macchine				TM
ON		TM.ID_COMPONENTE = P.ID_COMPONENTE
LEFT
JOIN	AwmConfig.vMacchine			vM
ON		vM.Name = TM.Name
GO
