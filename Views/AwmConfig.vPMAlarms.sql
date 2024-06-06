SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [AwmConfig].[vPMAlarms]
AS
SELECT	A.Id,
		A.Description			Descrizione,
		A.RaisedTimeStamp		Data,
		T.ASI,
		CASE 
			WHEN A.TagType = 'faultMsg' THEN 'FAULT'
			WHEN A.TagType = 'warningMsg' THEN 'WARNING'
			ELSE NULL
		END	Tipo,
		CASE
			WHEN A.TagType = 'faultMsg' THEN N'🔴'
			WHEN A.TagType = 'warningMsg' THEN N'⚠️'
			ELSE NULL
		END _
FROM	Logs.Alarms			A
JOIN	TAG					T
ON		T.ID = A.Id_Tag
WHERE	A.ResettedTimeStamp IS NULL
	And	A.TagType IN ('faultMsg', 'warningMsg')
GO
