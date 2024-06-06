SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[RushMoverData] ()
RETURNS @Rush TABLE(RushMover varchar(4) COLLATE Latin1_General_CI_AS, Data varchar(150) COLLATE Latin1_General_CI_AS)
AS
BEGIN
DECLARE @Data VARCHAR(255)
DECLARE load_cursor CURSOR FOR 
select value as V FROM STRING_SPLIT ( (select top 1 Message FROM LOGS.vRush where LogLevel = 'INFORMATION' ORDER BY TimeStamp DESC) , '|' )
 
OPEN load_cursor 
FETCH NEXT FROM load_cursor INTO @Data 

WHILE @@FETCH_STATUS = 0
BEGIN
	with T as (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 1)) as N, value as Val FROM STRING_SPLIT(@Data, ' ') WHERE value <> '')
	insert into @Rush (RushMover, Data) 
	values (
			(select Val from T where N = 1),
			(select Val from T where N = 2) + ' ' + (select Val from T where N = 3) + char(9) + char(9) + 
			(select Val from T where N = 4) + ' ' + (select Val from T where N = 5) + char(9) + char(9) +
			(select Val from T where N = 6) + char(9) + char(9) +
			(select Val from T where N = 7)
	)

FETCH NEXT FROM load_cursor INTO @Data
END
CLOSE load_cursor 
DEALLOCATE load_cursor 

RETURN
END
GO
