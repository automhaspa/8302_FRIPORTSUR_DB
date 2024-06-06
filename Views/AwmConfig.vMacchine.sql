SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [AwmConfig].[vMacchine]
AS
WITH	Tipo_Maccchine AS
(
	SELECT	CASE 
				WHEN Tipo = 'Pathmover'			THEN	'PATHMOVER'
				WHEN Id_Tipo_Componente = 'T'	THEN	'STACKERCRANES'	
				WHEN Id_Tipo_Componente = 'P'	THEN	'PEAKMOVERS'
				WHEN Id_Tipo_Componente = 'L'	THEN	'LIFTERS'
				WHEN Id_Tipo_Componente IN ('N','M')
					AND Tipo ='RushMover'		THEN	'RUSHMOVERS'
				WHEN Id_Tipo_Componente IN ('N','M') 
					AND Tipo IS NULL			THEN	'Mover' --
				WHEN Id_Tipo_Componente IN ('N','M') 
					AND Tipo ='Supercap'		THEN	'AUTOSAT'
				WHEN Id_Tipo_Componente IN ('N','M') 
					AND Tipo ='Supercap'		THEN	'SUPERCAPS'
				WHEN Id_Tipo_Componente ='R'	THEN    'ROLLER CONV.'
				ELSE NULL
			END	
			AS	Name
	FROM	dbo.Componenti
), Immagini AS
(
		  SELECT 'STACKERCRANES'	AS Name,'Images/traslo3.png'								AS ImagePath,	NULL						AS Href
	UNION SELECT 'LIFTERS'			AS Name,'Images/traslo3.png' 								AS ImagePath,	'/Scada2/Lifter'			AS Href
	UNION SELECT 'PEAKMOVERS'		AS Name,'Images/03-PEAKMOVER-Cam1_0000.png' 				AS ImagePath,	'/Scada2/Peakmover/1AM1'	AS Href
	UNION SELECT 'RUSHMOVERS'		AS Name,'Images/RUSHMOVER_02_RUSH.png' 						AS ImagePath,	NULL						AS Href
	UNION SELECT 'AUTOSATMOVERS'	AS Name,'Images/AutosatMover+Supercap_00_Main0000.png' 		AS ImagePath,	NULL						AS Href
	UNION SELECT 'SUPERCAPS'		AS Name,'Images/AUTOSAT_SUPERCAP_00_Main0002.png' 			AS ImagePath,	NULL						AS Href
	UNION SELECT 'ROLLER CONV.'		AS Name,'Images/RULLIERA_00_Main0000.png' 					AS ImagePath,	'/Scada2/Outbound'			AS Href
	UNION SELECT 'HEAVYTOWERS'		AS Name,'Images/HeavyTower_ver06_4_02_Main0000.png' 		AS ImagePath,	NULL						AS Href
	UNION SELECT 'MINILOADS'		AS Name,'Images/MiniLoad_01_Main0000.png' 					AS ImagePath,	NULL						AS Href
	UNION SELECT 'CHAIN CONV.'		AS Name,'Images/CATENARIA_00_Main0000.png'        			AS ImagePath,	NULL						AS Href
	UNION SELECT 'AUTOSAT'			AS Name,'Images/Autosat.png'								AS ImagePath,	NULL						AS Href
	UNION SELECT 'PATHMOVER'		AS Name,'Pathmover_Small.png'								AS ImagePath,	'/Scada2/Pathmover/1AM1'	AS Href
--SELECT 'PEAKMOVERS'		AS Name,'Images/02-PEAKMOVER_PLUS_1-Cam1_0000.png' 			AS ImagePath,	NULL						AS Href
--SELECT 'RUSHMOVERS'		AS Name,'Images/RUSHMOVER_0DE-667018-0001_01_Main0001.png'	AS ImagePath,	NULL						AS Href
)
SELECT	TM.Name, COUNT(1) AS Quantity, I.ImagePath, I.Href
FROM	Tipo_Maccchine	TM
JOIN	Immagini		I
ON		I.Name = TM.Name
GROUP 
BY		TM.Name, I.ImagePath, I.Href
GO
