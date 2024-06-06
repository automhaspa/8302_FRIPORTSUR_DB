SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [dbo].[sp_Pulizia]
AS
BEGIN
	DELETE	dbo.Adiacenze_Tempi				WHERE DATEDIFF(Day, Timestamp, GETDATE())		> 3
	DELETE Logs.CoreServiceLogs				WHERE DATEDIFF(Day, Timestamp, GETDATE())		> 5 
		AND CategoryName NOT IN( 'Automha.L2.Provider.BackendFunctions.BlazorCoreBackendFunctions'
			, 'Automha.L2.Core.Controllers.ExecuteController')

	DELETE Logs.CoreServiceLogs				WHERE DATEDIFF(MONTH, Timestamp, GETDATE())		> 2 
		AND CategoryName IN( 'Automha.L2.Provider.BackendFunctions.BlazorCoreBackendFunctions'
			, 'Automha.L2.Core.Controllers.ExecuteController')
		
	DELETE	Logs.Alarms						WHERE DATEDIFF(Day, RaisedTimeStamp, GETDATE()) > 30
	DELETE	Logs.Alarms_Percorso		
	WHERE	Id_Log_Alarms NOT IN
	(
			SELECT	Id_Log_Alarms
			FROM	Logs.Alarms
	)

	DELETE	Logs.ProviderServiceLogs		WHERE DATEDIFF(Day, Timestamp, GETDATE())		> 1
	DELETE	Logs.IdentityServiceLogs		WHERE DATEDIFF(Day, Timestamp, GETDATE())		> 1

	DELETE	AwmConfig.Grants				WHERE DATEDIFF(HOUR,Expiration, GETUTCDATE())		> 1
													OR Revocation IS NOT NULL

	DELETE	Logs.CommunicationManagerLogs	WHERE DATEDIFF(Day, Timestamp, GETDATE())		> 7
	DELETE	Logs.CoreServiceLogs			WHERE DATEDIFF(hour, Timestamp, GETDATE())		> 2
													AND CategoryName ='Automha.Warehouse.Entities.Items.RushMoverLoop'

	DELETE Logs.CommunicationManagerLogs	WHERE MessageType LIKE 'ACK%'

	DELETE Logs.CoreServiceLogs				WHERE DATEDIFF(hour, Timestamp, GETDATE()) > 12
													AND CategoryName ='Automha.Warehouse.Entities.Communication.CommunicationCallbackHandler'
													AND LogLevel NOT IN ('Warning', 'Error', 'Critical')

	DELETE Logs.CommunicationManagerLogs	WHERE DATEDIFF(HOUR, Timestamp, GETDATE()) > 1
													AND MessageType like 'ACK%'
													AND LogLevel NOT IN ('Warning', 'Error', 'Critical')

	DELETE Logs.CommunicationManagerLogs	WHERE DATEDIFF(HOUR, Timestamp, GETDATE()) > 1
													AND MessageId IN(11033,62020)
													AND LogLevel NOT IN ('Warning', 'Error', 'Critical')


	DELETE Logs.CoreServiceLogs				WHERE CategoryName like 'Microsoft%' AND DATEDIFF(HOUR, Timestamp, GETDATE()) > 1
	DELETE Logs.CoreServiceLogs				WHERE CategoryName = 'Automha.Warehouse.Entities.StorageLocationFinder' AND DATEDIFF(Day, Timestamp, GETDATE()) > 1
	DELETE Logs.CoreServiceLogs				WHERE CategoryName = 'Automha.Warehouse.Entities.Communication.CommunicationCallbackHandler' AND DATEDIFF(Day, Timestamp, GETDATE()) > 1

	DELETE Logs.CoreServiceLogs				WHERE DATEDIFF(HOUR, Timestamp, GETDATE()) > 3 AND Message like 'Procedure ''UnifiedAutomation.UaClient%'
	DELETE Logs.CommunicationManagerLogs	WHERE DATEDIFF(HOUR, Timestamp, GETDATE()) > 3 AND Message like 'Starting procedure %'

	DELETE dbo.Movimenti						WHERE DATEDIFF(Day, Data_Movimento, GETDATE()) > 90			AND Id_Udc NOT IN (SELECT Id_Udc FROM dbo.Udc_Testata)
	DELETE dbo.Missioni_Storico					WHERE DATEDIFF(Day, Data_Storicizzazione, GETDATE()) > 90	AND Id_Udc NOT IN (SELECT Id_Udc FROM dbo.Udc_Testata)
	DELETE dbo.Udc_Storico						WHERE DATEDIFF(Day, Data_Cancellazione, GETDATE()) > 90
	
	SELECT	t.Name											TableName,
			s.Name											SchemaName,
			p.Rows											RowCounts,
			SUM(a.total_pages) * 8							TotalSpaceKB,
			SUM(a.used_pages) * 8							UsedSpaceKB,
			(SUM(a.total_pages) - SUM(a.used_pages)) * 8	UnusedSpaceKB
	FROM	sys.tables				t
	JOIN	sys.indexes				i ON t.object_id = i.object_id
	JOIN	sys.partitions			p ON i.object_id = p.object_id AND i.index_id = p.index_id
	JOIN	sys.allocation_units	a ON p.partition_id = a.container_id
	LEFT OUTER
	JOIN	sys.schemas				s ON t.schema_id = s.schema_id
	WHERE	t.Name NOT LIKE 'dt%'
	  AND	t.is_ms_shipped = 0
	  AND	i.object_id > 255
	GROUP
		BY	t.Name, s.Name, p.Rows
	ORDER
		BY	p.Rows DESC
END
GO
