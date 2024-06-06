SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [AwmConfig].[vListe_Uscita]
AS
WITH	Sintesi_Dettaglio
AS
(	
		SELECT	Id_Lista, 
				COUNT(1)														AS Numero_Righe,   
				SUM(CASE WHEN Qta_Evasa >= ISNULL(Qta_Accettata,Qta_Richiesta) THEN 1 ELSE 0 END)		
																				AS Numero_Righe_Evase
		FROM	Liste_Dettaglio
		GROUP	
		BY		Id_Lista
)

SELECT	L.Id_Lista,
		REPLACE(L.Codice,'AWM','A') AS Codice,	
		L.Label_Aggiuntive.value('data(//ShipmentID)[1]','VARCHAR(100)')		AS ShipmentId,
		L.Label_Aggiuntive.value('data(//Door)[1]','VARCHAR(100)')		AS Door,
		L.Destinazione		AS Zone,
		L.Label_Aggiuntive.value('data(//ReqType)[1]','VARCHAR(100)')		AS ReqType,
		TSL.Descrizione		AS Stato,
		L.Data_Creazione,		
		L.Data_Esecuzione,
		Numero_Righe_Evase,
		Numero_Righe,
		CASE	WHEN ISNULL(Numero_Righe,0) = 0 THEN '0%' 
				ELSE CONCAT(ROUND(ISNULL(Numero_Righe_Evase,0)/CONVERT(FLOAT,ISNULL(Numero_Righe,0)),2) *100 ,'%')
		END		AS Percentuale_Evasione

FROM	Liste						L
JOIN	Tipo_Stato_Lista			TSL
ON		TSL.Id_Tipo_Stato_Lista = L.Id_Tipo_Stato_Lista
LEFT	
JOIN	Sintesi_Dettaglio			SD
ON		SD.Id_Lista = L.Id_Lista
WHERE	L.Id_Tipo_Lista IN ('TDO','PKL')
GO
