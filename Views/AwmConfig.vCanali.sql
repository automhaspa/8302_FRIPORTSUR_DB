SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE      VIEW [AwmConfig].[vCanali] AS

SELECT	CC.Id AS Value,
		CC.Description AS Description
FROM AwmConfig.vConfigurazioneCanali CC

GO
