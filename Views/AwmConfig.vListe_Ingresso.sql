SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO












CREATE	VIEW	[AwmConfig].[vListe_Ingresso]
AS
WITH	Sintesi_Dettaglio
AS
(	
		SELECT	Id_Lista, 
				COUNT(1)														AS Numero_Righe,   
				SUM(CASE WHEN Qta_Evasa >= Qta_Accettata THEN 1 ELSE 0 END)		AS Numero_Righe_Evase
		FROM	Liste_Dettaglio
		GROUP	
		BY		Id_Lista
)

SELECT	L.Id_Lista,
		L.Codice															AS Po_Number,		
		L.Label_Aggiuntive.value('data(//WorkCenter)[1]','VARCHAR(MAX)')	AS Work_Center,
		A.Codice AS Codice_Articolo,
		LD.Qta_Richiesta AS Qty, 
		TSL.Descrizione														AS Stato,		
		--L.Label_Aggiuntive.value('data(//OrderId)[1]','VARCHAR(MAX)')		AS Ordine,
		
		L.Data_Creazione,		
		L.Data_Previsione													AS Expected_For
		--SUBSTRING(P.DESCRIZIONE,1,4)										AS Ingresso_Selezionato,
		--Numero_Righe_Evase,
		--Numero_Righe,
		--CASE	WHEN ISNULL(Numero_Righe,0) = 0 THEN '0%' 
		--		ELSE CONCAT(ROUND(ISNULL(Numero_Righe_Evase,0)/CONVERT(FLOAT,ISNULL(Numero_Righe,0)),2) *100 ,'%')
		--END		AS Percentuale_Evasione
		
FROM	Liste						L
JOIN	Tipo_Stato_Lista			TSL
ON		TSL.Id_Tipo_Stato_Lista = L.Id_Tipo_Stato_Lista
JOIN	dbo.Liste_Dettaglio			LD
ON		LD.Id_Lista = L.Id_Lista
JOIN	dbo.Articoli				A
ON		A.Id_Articolo = LD.Id_Articolo
LEFT	
JOIN	Sintesi_Dettaglio			SD
ON		SD.Id_Lista = L.Id_Lista
LEFT
JOIN	Partizioni					P
ON		P.ID_PARTIZIONE	= L.Id_Partizione_Destinazione
WHERE	L.Id_Tipo_Lista = 'TDI'
	--AND L.Id_Tipo_Stato_Lista <> 6

GO
