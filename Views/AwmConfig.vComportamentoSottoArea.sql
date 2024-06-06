SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*

"DefragWorker": {
    "Interval": 10000,
    "Enabled": true,
    "Timeout": 9000
},


*/

CREATE   VIEW [AwmConfig].[vComportamentoSottoArea]
AS
		SELECT 0 Value, 'None' AS Description
--UNION	SELECT 1 value, 'Riordino' AS Description
UNION	SELECT 2 Value, 'Defrag' AS Description

GO
