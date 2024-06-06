SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE      VIEW [AwmConfig].[vConfigurazioneCanali] AS

select jsonData.Id,
       jsonData.PhysicalStateChannelType,
       jsonData.Description,
       jsonData.IpAdress_Plc,
       jsonData.EndPoint,
       jsonData.Port
from dbo.Configurazioni C
CROSS APPLY openjson(C.Valore) 
WITH(
	 [Id] nvarchar(max) '$.id',
	 [PhysicalStateChannelType] nvarchar(max) '$.PhysicalStateChannelType',
	 [Description] nvarchar(max)  '$.description',
	 [IpAdress_Plc] nvarchar(max)  '$.configuration.IpAdress_Plc',
	 [EndPoint] nvarchar(max)  '$.configuration.EndPoint',
	 [Port] nvarchar(max)  '$.configuration.Port'
	) AS jsonData
WHERE C.Chiave = 'CoreService:PhysicalStateChannels'
	AND jsonData.PhysicalStateChannelType = 'S7PhysicalStateChannel'

GO
