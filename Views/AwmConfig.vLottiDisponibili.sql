SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE   VIEW [AwmConfig].[vLottiDisponibili]
AS
WITH LD
AS
(
SELECT	LD.Id_Lotto, SUM (ISNULL(LD.Qta_Richiesta, LD.Qta_Accettata)- LD.Qta_Evasa) AS Qta_Rimanente
FROM Liste_Dettaglio LD
JOIN Liste L
ON		LD.Id_Lista = L.Id_Lista
WHERE		L.Id_Tipo_Stato_Lista < 6
	AND		ISNULL(LD.Qta_Richiesta, LD.Qta_Accettata) > LD.Qta_Evasa
	AND			LD.Id_Lotto IS NOT NULL
GROUP
BY		LD.Id_Lotto
) 
	SELECT	L.Id_Lotto AS batchId,
			L.Codice_Lotto														Lotto,
			COUNT(UD.Id_Udc)	 - ISNULL(MIN(LD.Qta_Rimanente),0)				DISPONIBILITA
	FROM	dbo.Lotti			L
	LEFT
	JOIN	dbo.Udc_Dettaglio	UD
	ON		UD.Id_Lotto_Produzione = L.Id_Lotto
	LEFT
	JOIN	LD 
	ON		LD.Id_Lotto = L.Id_Lotto
	GROUP
		BY	L.Id_Lotto,
			L.Codice_Lotto
	HAVING	COUNT(UD.Id_Udc) > 0
GO
