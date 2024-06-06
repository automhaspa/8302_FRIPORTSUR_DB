SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[spKPI_Magazzino_Nel_Tempo] AS

SET DATEFORMAT dmy;  
DECLARE @cols AS NVARCHAR(MAX),
        @query  AS NVARCHAR(MAX);

SET @cols = STUFF((SELECT distinct ',' + QUOTENAME(K.Data_Exec) 
            FROM vKPI_Magazzino K
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'')

--select @cols = STRING_AGG(quotename (C.name),',')   after SQL Server 2017
--          from sys.columns c
--          where c.object_id = OBJECT_ID('dbo.vKPI_Magazzino')

set @query = 'SELECT DESCRIZIONE AS CODICE, COMP_TIPO_DESC,  ' + @cols + ' FROM 
            (
                SELECT Millisecondi , COMP_TIPO_DESC , DESCRIZIONE , CONVERT(Date,Data_Exec) AS GIORNO 
			    FROM  vKPI_Magazzino 
                GROUP BY DESCRIZIONE, COMP_TIPO_DESC, CONVERT(Date,Data_Exec) , COMP_TIPO_DESC , Millisecondi
           ) t
           PIVOT 
            (
                AVG(Millisecondi)
                FOR  GIORNO IN (' + @cols + ')
            ) p '


execute(@query)



GO
