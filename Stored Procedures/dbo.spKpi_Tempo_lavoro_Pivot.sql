SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[spKpi_Tempo_lavoro_Pivot]
   
	@DATA_INIZIALE date = NULL,
	@DATA_FINALE date = NULL,
	@TIPO_COMP VARCHAR(50) = NULL
AS

BEGIN
 SET DATEFORMAT dmy;  
   
DECLARE 

    @columns NVARCHAR(MAX) = '';

	SET NOCOUNT ON;

	 IF (@DATA_INIZIALE IS NULL OR @DATA_INIZIALE = '')
		BEGIN
		         SET @DATA_INIZIALE = (      
					  SELECT  MIN(ATEMP.Timestamp) AS MIN_DATA 
			          FROM    Componenti COMP JOIN SottoComponenti SOTTO
				      ON  COMP.ID_COMPONENTE = SOTTO.ID_COMPONENTE
					  JOIN Partizioni PTS ON SOTTO.ID_SOTTOCOMPONENTE = PTS.ID_SOTTOCOMPONENTE
					  JOIN Adiacenze AD ON AD.Id_Partizione_Sorgente = PTS.ID_PARTIZIONE
					  JOIN Partizioni PTD ON AD.Id_Partizione_Destinazione = PTD.ID_PARTIZIONE
					  JOIN Tipo_Componenti TC ON COMP.ID_TIPO_COMPONENTE = TC.ID_TIPO_COMPONENTE
					  JOIN Adiacenze_Tempi ATEMP ON ATEMP.Id_Adiacenza = AD.Id_Adiacenza
					  WHERE COMP.ID_TIPO_COMPONENTE != 'S')
		END;

	 IF (@DATA_FINALE IS NULL OR @DATA_FINALE = '')
    		BEGIN
		         SET @DATA_FINALE = (      
					  SELECT  MAX(ATEMP.Timestamp) AS MAX_DATA 
			          FROM    Componenti COMP JOIN SottoComponenti SOTTO
				      ON  COMP.ID_COMPONENTE = SOTTO.ID_COMPONENTE
					  JOIN Partizioni PTS ON SOTTO.ID_SOTTOCOMPONENTE = PTS.ID_SOTTOCOMPONENTE
					  JOIN Adiacenze AD ON AD.Id_Partizione_Sorgente = PTS.ID_PARTIZIONE
					  JOIN Partizioni PTD ON AD.Id_Partizione_Destinazione = PTD.ID_PARTIZIONE
					  JOIN Tipo_Componenti TC ON COMP.ID_TIPO_COMPONENTE = TC.ID_TIPO_COMPONENTE
					  JOIN Adiacenze_Tempi ATEMP ON ATEMP.Id_Adiacenza = AD.Id_Adiacenza
					  WHERE COMP.ID_TIPO_COMPONENTE != 'S')
		END;

		
		IF(@TIPO_COMP IS NULL)
			BEGIN	
			   SET @TIPO_COMP = '%'
  		   END;

		  

WITH	Ore_Lavoro
AS
(
	SELECT	CONVERT(DATE,Timestamp)	AS Data_Esec,
			DATEDIFF
			(
				s,
				MIN(Timestamp),
				MAX(Timestamp)
			)						AS Mill_Lavoro
	FROM	Logs.CommunicationManagerLogs
	WHERE	MessageType  = 'MSG RCV'
	--AND   CONVERT(DATE,Timestamp) BETWEEN  @DATA_INIZIALE and @DATA_FINALE
	GROUP	
	BY		CONVERT(DATE,Timestamp)
),

KPI
AS
(
	SELECT  COMP.ID_COMPONENTE, COMP.DESCRIZIONE, TC.DESCRIZIONE AS COMP_TIPO_DESC, COMP.ID_TIPO_COMPONENTE, SOTTO.ID_SOTTOCOMPONENTE, SOTTO.DESCRIZIONE AS SOTTO_COMP_DESC,
			          AD.Id_Partizione_Sorgente, PTS.DESCRIZIONE AS PART_SORGENTE, AD.Id_Partizione_Destinazione, PTD.DESCRIZIONE AS PART_DESTINAZIONE,
			          ATEMP.Id_Tempo , ATEMP.Millisecondi ,Convert(date, ATEMP.Timestamp) as Data_Esec
			  FROM    Componenti COMP JOIN SottoComponenti SOTTO
				      ON  COMP.ID_COMPONENTE = SOTTO.ID_COMPONENTE
					  JOIN Partizioni PTS ON SOTTO.ID_SOTTOCOMPONENTE = PTS.ID_SOTTOCOMPONENTE
					  JOIN Adiacenze AD ON AD.Id_Partizione_Sorgente = PTS.ID_PARTIZIONE
					  JOIN Partizioni PTD ON AD.Id_Partizione_Destinazione = PTD.ID_PARTIZIONE
					  JOIN Tipo_Componenti TC ON COMP.ID_TIPO_COMPONENTE = TC.ID_TIPO_COMPONENTE
					  JOIN Adiacenze_Tempi ATEMP ON ATEMP.Id_Adiacenza = AD.Id_Adiacenza
					  WHERE COMP.ID_TIPO_COMPONENTE != 'S'
					
)

SELECT        K.DESCRIZIONE AS CODICE, K.COMP_TIPO_DESC, CONVERT(date, K.Data_Esec) AS GIORNO, ROUND(((CAST(SUM(K.Millisecondi) AS FLOAT)/CAST(OL.Mill_Lavoro AS FLOAT))*100),2) AS Percent_Lavorato
INTO              [#TEMP]
FROM            KPI AS K LEFT OUTER JOIN
              Ore_Lavoro AS OL ON CONVERT(date, K.Data_Esec) = OL.Data_Esec
WHERE        (K.Data_Esec >= @DATA_INIZIALE AND K.Data_Esec <= @DATA_FINALE) AND (K.COMP_TIPO_DESC LIKE @TIPO_COMP)
GROUP BY K.COMP_TIPO_DESC,  K.DESCRIZIONE , CONVERT(date, K.Data_Esec), OL.Mill_Lavoro, Millisecondi


DECLARE @cols AS NVARCHAR(MAX),
      @query  AS NVARCHAR(MAX);
SET @cols = STUFF((SELECT distinct ',' + QUOTENAME(K.Data_Exec) 
            FROM vKPI_Magazzino K
			WHERE ((K.Data_Exec >= @DATA_INIZIALE AND K.Data_Exec <= @DATA_FINALE) AND (K.COMP_TIPO_DESC LIKE @TIPO_COMP))
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'')


SET  @query = 'SELECT CODICE, COMP_TIPO_DESC , ' +  @cols + ' FROM 
            (
                SELECT * FROM #TEMP
           ) t
           PIVOT 
            (
                MAX(Percent_Lavorato)
                FOR  GIORNO IN ( ' + @cols  +'  )
            ) p '

			execute(@query)
			
			IF OBJECT_ID(N'TEMPDB..#TEMP') IS NOT NULL
			BEGIN
			DROP TABLE #TEMP
			END 
			
END






GO
