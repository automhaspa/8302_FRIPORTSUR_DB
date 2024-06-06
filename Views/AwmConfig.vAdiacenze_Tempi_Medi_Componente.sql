SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW	 [AwmConfig].[vAdiacenze_Tempi_Medi_Componente]
AS

WITH Tempi_Medi_Movimentazione
AS
(
	SELECT	SC.ID_COMPONENTE, CONVERT(DATE,A_T.Timestamp) Date, 
			AVG(A_T.Millisecondi)	Tempo_Medio_Ms,
			COUNT(A_T.Id_Tempo)		Numero_Movimenti,
			SUM(A_T.Millisecondi)	Tempo_Totale_Ms
	FROM	Adiacenze_Tempi		A_T
	JOIN	Adiacenze			A
	ON		A_T.Id_Adiacenza =  A.Id_Adiacenza
	JOIN	Partizioni			P
	ON		P.ID_PARTIZIONE IN (A.Id_Partizione_Sorgente, A.Id_Partizione_Destinazione)
	JOIN	SottoComponenti		SC
	ON		SC.ID_SOTTOCOMPONENTE = P.ID_SOTTOCOMPONENTE
	GROUP
	BY		SC.ID_COMPONENTE, CONVERT(DATE,A_T.Timestamp)
),Tempi_Medi_Scarico
AS
(
	SELECT	SC.ID_COMPONENTE, CONVERT(DATE,A_T.Timestamp) Date, 
			AVG(A_T.Millisecondi) Tempo_Medio_Ms,
			COUNT(A_T.Id_Tempo)		Numero_Movimenti
	FROM	Adiacenze_Tempi		A_T
	JOIN	Adiacenze			A
	ON		A_T.Id_Adiacenza =  A.Id_Adiacenza
	JOIN	Partizioni			P
	ON		P.ID_PARTIZIONE = A.Id_Partizione_Sorgente
	JOIN	SottoComponenti		SC
	ON		SC.ID_SOTTOCOMPONENTE = P.ID_SOTTOCOMPONENTE
	GROUP
	BY		SC.ID_COMPONENTE, CONVERT(DATE,A_T.Timestamp)
),Tempi_Medi_Carico
AS
(
	SELECT	SC.ID_COMPONENTE, CONVERT(DATE,A_T.Timestamp) Date, 
			AVG(A_T.Millisecondi) Tempo_Medio_Ms,
			COUNT(A_T.Id_Tempo)		Numero_Movimenti
	FROM	Adiacenze_Tempi		A_T
	JOIN	Adiacenze			A
	ON		A_T.Id_Adiacenza =  A.Id_Adiacenza
	JOIN	Partizioni			P
	ON		P.ID_PARTIZIONE = A.Id_Partizione_Destinazione
	JOIN	SottoComponenti		SC
	ON		SC.ID_SOTTOCOMPONENTE = P.ID_SOTTOCOMPONENTE
	GROUP
	BY		SC.ID_COMPONENTE, CONVERT(DATE,A_T.Timestamp)
)
SELECT	--C.ID_COMPONENTE, 
		C.DESCRIZIONE			AS Componente,
		TC.DESCRIZIONE			AS Tipo,		
		TMM.Date				AS Data,
		CEILING(TMM.Tempo_Totale_Ms		/60000.0)			    AS Minuti_Lavoro,
		CAST(TMM.Tempo_Medio_Ms / 1000.0 AS numeric(36,2))		AS Media_Movimentazione_Secondi,
		TMM.Numero_Movimenti,
		CAST(TMC.Tempo_Medio_Ms / 1000.0 AS numeric(36,2))		AS Media_Carico_Secondi,
		TMC.Numero_Movimenti	AS Numero_Carichi,
		CAST(TMS.Tempo_Medio_Ms	/ 1000.0 AS numeric(36,2))		AS Media_Scarico_Secondi,
		TMS.Numero_Movimenti	AS Numero_Scarichi
FROM	Componenti			C
JOIN	Tipo_Componenti		TC
ON		TC.ID_TIPO_COMPONENTE = C.ID_TIPO_COMPONENTE
LEFT
JOIN	Tempi_Medi_Movimentazione	TMM
ON		TMM.ID_COMPONENTE = C.ID_COMPONENTE
LEFT
JOIN	Tempi_Medi_Carico	TMC
ON		TMC.ID_COMPONENTE = C.ID_COMPONENTE
AND		TMC.Date = TMM.Date					
LEFT
JOIN	Tempi_Medi_Scarico	TMS
ON		TMS.ID_COMPONENTE = C.ID_COMPONENTE
AND		TMS.Date = TMM.Date				

WHERE	C.ID_TIPO_COMPONENTE NOT IN ('S')
GO
