SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO










CREATE VIEW [AwmConfig].[vMonitor_Uscite]
AS	
WITH Faults AS
(
	SELECT	T.ASI, COUNT(DISTINCT T.ID) AS N_Fault
	FROM	Logs.Alarms LA
	JOIN	TAG			T
	ON		T.TAGID = LA.TagId
	AND		T.DESCRIPTION = LA.Description
	WHERE	LA.ResettedTimeStamp IS NULL AND T.ASI IS NOT NULL
	GROUP
	BY		T.ASI
)

SELECT	REPLACE(L.Codice, 'AWM','A')		AS Codice,
		A.Codice AS Articolo, 
		LO.Codice_Lotto AS Lotto,
		UT.Codice_Udc, 
		--LD.Sequenza AS Sequence,

		P.DESCRIZIONE AS Posizione, 
		TM.Descrizione AS Tipo_Missione ,
		PRC.Descrizione	 AS Passo,
		CASE WHEN PRC.Id_Tipo_Stato_Percorso IN (2,9) THEN  DATEDIFF(SECOND,PRC.Ultima_Esecuzione,GETDATE()) END AS Secondi_Esecuz,
		EP.Errore,
		F.N_Fault AS Numero_Fault,
		CASE WHEN P.ID_PARTIZIONE = L.Id_Partizione_Destinazione			THEN	N'🏁'
			 WHEN LA.Id_Lista_Associazione IS NULL							THEN	N'🔍'
			 WHEN F.N_Fault > 0												THEN	N'🔴'
			 WHEN EP.Id_Errore_Percorso IS NOT NULL							THEN	N'📒'
			 WHEN P.LOCKED_OUTFEED = 1 
				OR PRCS.LOCKED_OUTFEED = 1 
				OR PRCD.LOCKED_OUTFEED = 1									THEN	N'🔒'

			--WHEN DATEDIFF(SECOND,PRC.Ultima_Esecuzione,GETDATE()) > 120 		
			--	 AND	P.DESCRIZIONE LIKE '_F%'							THEN	N'⏰'
			WHEN DATEDIFF(SECOND,PRC.Ultima_Esecuzione,GETDATE()) > 120		THEN	N'❓'
			WHEN M.Id_Missione IS NOT NULL									THEN	N'⬇️'
																			ELSE	N'🔍'
		END		AS _
		--,			
		--Ld.*, LA.* 
FROM	Liste	L
JOIN	Liste_Dettaglio	LD
ON		L.Id_Lista = LD.Id_Lista
LEFT
JOIN	Articoli	A
ON		LD.Id_Articolo = A.Id_Articolo
LEFT
JOIN	Lotti		LO
ON		LO.Id_Lotto		 = LD.Id_Lotto
LEFT
JOIN	Liste_Associazioni		LA
ON		LD.Id_Lista_Dettaglio = LA.Id_Lista_Dettaglio
LEFT
JOIN	Udc_Testata		UT
ON		UT.Id_Udc = LA.Id_Udc
LEFT
JOIN	Udc_Posizione		UP
ON		UP.Id_Udc = UT.Id_Udc
LEFT
JOIN	Partizioni			P
ON		P.ID_PARTIZIONE = UP.Id_Partizione
LEFT
JOIN	Missioni			M
ON		M.Id_Udc = UT.Id_Udc
LEFT
JOIN	Tipo_Missioni		TM
ON		TM.Id_Tipo_Missione = M.Id_Tipo_Missione
LEFT
JOIN	Percorso			PRC
ON		PRC.Id_Missione = M.Id_Missione 
AND		PRC.Id_Tipo_Stato_Percorso	IN (2,9)
LEFT 
JOIN	Errori_Percorso			EP		
ON		PRC.Id_Tipo_Stato_Percorso = 9 
AND		PRC.Id_Missione = EP.Id_Missione
AND		PRC.Id_Sequenza_Percorso = EP.Id_Sequenza_Percorso
LEFT	
JOIN	Partizioni				PRCS
ON		PRC.Id_Partizione_Sorgente = PRCS.ID_PARTIZIONE
LEFT	
JOIN	Partizioni				PRCD
ON		PRC.Id_Partizione_Destinazione = PRCD.ID_PARTIZIONE
LEFT
JOIN	Faults					F
ON		F.ASI = SUBSTRING(PRCS.DESCRIZIONE,1,4) 
	OR	F.ASI = SUBSTRING(PRCD.DESCRIZIONE,1,4) 
WHERE	L.Id_Tipo_Lista = 'TDO' AND L.Id_Tipo_Stato_Lista IN( 5,6)
	AND LD.Qta_Richiesta > LD.Qta_Evasa
GO
