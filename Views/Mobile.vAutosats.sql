SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   VIEW	[Mobile].[vAutosats]
AS
SELECT	AutosatId,
	AutosatCode,
	Description,
	Ip,
	Port,
	AutosatType,
	HasCodeReader
FROM	[AwmConfig].[Autosats]		
GO
