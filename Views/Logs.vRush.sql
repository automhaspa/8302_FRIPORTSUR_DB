SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO








CREATE VIEW  [Logs].[vRush]
AS

select LogLevel,TimeStamp,Message  from Logs.CoreServiceLogs WHERE CategoryName = 'Automha.Warehouse.Entities.Items.RushMoverLoop'
GO
