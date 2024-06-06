SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE   VIEW [AwmConfig].[vStorico_Allarmi] 
AS	
SELECT	--LA.TagId,
		T.ASI,								
		REPLACE(LA.TagType,'Msg','')		AS Tipo,
		LA.Description						AS Descrizione,
		LA.RaisedTimeStamp					AS Data,
		LA.ResettedTimeStamp				AS Reset
FROM	Logs.Alarms			LA
JOIN	dbo.TAG				T
ON		T.TAGID = LA.TagId
AND		T.DESCRIPTION = LA.Description
AND		T.TagType IN ('faultMsg', 'warningMsg')		
GO
