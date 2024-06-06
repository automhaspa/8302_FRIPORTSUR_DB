SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [Graph].[Execution_Statistics]
 AS
--SELECT Id_Tipo_Missione as Labels,
--       COUNT(Id_Udc) as YAxis
--      ,CONVERT(DATE, [Data_Creazione]) as XAxis
--  FROM [Missioni_Storico]
-- -- WHERE [Data_Creazione] BETWEEN '2021-05-21' AND '2021-06-14'
--  GROUP BY 
--  Id_Tipo_Missione
-- ,CONVERT(DATE, [Data_Creazione])  

with dates as (
	select 'out' Labels,  '2021-09-01' XAxis , 5 YAxis
    union 
    select 'ing' Labels, '2021-09-01' XAxis , 3 YAxis
    union 
    select 'pic' Labels, '2021-09-01' XAxis , 9 YAxis     
	union 
	select 'out' Labels, '2021-09-02' XAxis, 1 YAxis
    union 
    select 'ing' Labels, '2021-09-02' XAxis, 15 YAxis
    union 
    select 'pic' Labels, '2021-09-02' XAxis, 8 YAxis
	union
	select 'out' Labels, '2021-09-03' XAxis, 150 YAxis
    union 
    select 'ing' Labels, '2021-09-03' XAxis, 193 YAxis
    union 
    select 'pic' Labels, '2021-09-03' XAxis, 79 YAxis   
	union 
	select 'out' Labels, '2021-09-04' XAxis, 1 YAxis
    union 
    select 'ing' Labels, '2021-09-04' XAxis, 15 YAxis
    union 
    select 'pic' Labels, '2021-09-04' XAxis, 8 YAxis
	union 
	select 'out' Labels, '2021-09-05' XAxis, 9 YAxis
    union 
    select 'ing' Labels, '2021-09-05' XAxis, 18 YAxis
    union 
    select 'pic' Labels, '2021-09-05' XAxis, 4 YAxis
	union 
	select 'out' Labels, '2021-09-06' XAxis, 20 YAxis
    union 
    select 'ing' Labels, '2021-09-06' XAxis, 35 YAxis
    union 
    select 'pic' Labels, '2021-09-06' XAxis, 16 YAxis
	union
    select 'out' Labels, '2021-09-07' XAxis, 40 YAxis
    union 
    select 'ing' Labels, '2021-09-07' XAxis, 25 YAxis
    union 
    select 'pic' Labels, '2021-09-07' XAxis, 26 YAxis
	union
	select 'out' Labels, '2021-09-08' XAxis, 90 YAxis
    union 
    select 'ing' Labels, '2021-09-08' XAxis, 155 YAxis
    union 
    select 'pic' Labels, '2021-09-08' XAxis, 76 YAxis
	union
    select 'out' Labels, '2021-09-09' XAxis, 21 YAxis
    union 
    select 'ing' Labels, '2021-09-09' XAxis, 2 YAxis
    union 
    select 'pic' Labels, '2021-09-09' XAxis, 5 YAxis
    union
    select 'out' Labels, '2021-09-10' XAxis, 300 YAxis
    union 
    select 'ing' Labels, '2021-09-10' XAxis, 250 YAxis
    union 
    select 'pic' Labels, '2021-09-10' XAxis, 190 YAxis
    union
    select 'out' Labels, '2021-09-18' XAxis, 200 YAxis
    union 
    select 'ing' Labels, '2021-09-18' XAxis, 150 YAxis
    union 
    select 'pic' Labels, '2021-09-18' XAxis, 90 YAxis )

	select * from dates
 --order by CONVERT(DATE, [Data_Creazione]) 
GO
