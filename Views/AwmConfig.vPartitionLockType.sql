SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [AwmConfig].[vPartitionLockType]
AS

SELECT	0			[Value],
		'Both'		[Description]
UNION
SELECT	1			[Value],
		'Infeed'	[Description]
UNION
SELECT	2			[Value],
		'Outfeed'	[Description]



GO
