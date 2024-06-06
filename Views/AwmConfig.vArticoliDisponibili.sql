SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE   VIEW [AwmConfig].[vArticoliDisponibili]
AS
WITH LD
AS
(
SELECT	LD.Id_Articolo, SUM (ISNULL(LD.Qta_Richiesta, LD.Qta_Accettata)- LD.Qta_Evasa) AS Qta_Rimanente
FROM Liste_Dettaglio LD
JOIN Liste L
ON		LD.Id_Lista = L.Id_Lista
WHERE		L.Id_Tipo_Stato_Lista < 6
	AND		ISNULL(LD.Qta_Richiesta, LD.Qta_Accettata) > LD.Qta_Evasa
GROUP
BY		LD.Id_Articolo
) 


	SELECT	A.Id_Articolo AS articleId,
			A.Codice,
		--	A.Descrizione,
			COUNT(UD.Id_Udc) - ISNULL(MIN(LD.Qta_Rimanente),0) Presenza_Udc
	FROM	dbo.Articoli		A
	LEFT
	JOIN	dbo.Udc_Dettaglio	UD
	ON		UD.Id_Articolo = A.Id_Articolo
	LEFT
	JOIN	LD 
	ON		LD.Id_Articolo = A.Id_Articolo
	GROUP
		BY	A.Id_Articolo,
			A.Codice,
			A.Descrizione
GO
