SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [IMPL].[vContenutoSemplificato]
AS

WITH Contenuto_Semplificato AS
(
	SELECT	UD.Id_Udc,
			CASE WHEN COUNT(DISTINCT UD.Id_Articolo) = 1			THEN MIN(UD.ID_Articolo)			ELSE -1 END		AS Id_Articolo, 
			MIN(UD.Data_Scadenza)																						AS Data_Scadenza,
			MIN(UD.Data_Produzione)																						AS Data_Produzione,
			CASE WHEN COUNT(DISTINCT UD.Id_Lotto_Produzione) <= 1	THEN MIN(UD.Id_Lotto_Produzione)	ELSE -1 END		AS Id_Lotto_Produzione,
			CASE WHEN COUNT(DISTINCT UD.Id_Lotto_Stoccaggio) <= 1	THEN MIN(UD.Id_Lotto_Stoccaggio)	ELSE -1 END		AS Id_Lotto_Stoccaggio,
			CASE WHEN COUNT(DISTINCT UD.Id_Azienda_Cliente)  <= 1   THEN MIN(UD.Id_Azienda_Cliente)		ELSE -1 END		AS Id_Azienda_Cliente,
			CASE WHEN COUNT(DISTINCT UD.Id_Azienda_Cliente)  <= 1   THEN MIN(UD.Id_Azienda_Fornitore)	ELSE -1 END		AS Id_Azienda_Fornitore,
			MIN(A.Indice_Rotazione)																						AS Indice_Rotazione,			
			CASE WHEN COUNT(DISTINCT UD.Quantita_Pezzi)  <= 1		THEN MIN(UD.Quantita_Pezzi)			ELSE -1 END		AS Quantita_Pezzi
	FROM dbo.Udc_Dettaglio UD
	JOIN dbo.Articoli      A
	ON A.Id_Articolo = UD.Id_articolo
	GROUP BY UD.Id_Udc
)
SELECT 
	   UT.Id_Udc,
	   CS.Id_Articolo,
	   NULL							AS [Hash],
       CS.Data_Scadenza,
	   CS.Data_Produzione,
	   CS.Id_Lotto_Produzione,
       CS.Id_Lotto_Stoccaggio,
       CS.Id_Azienda_Cliente,
	   CS.Id_Azienda_Fornitore,
  	   NULL							AS QuantitaAttesaProduzione,
	   NULL							AS QuantitaAttesaStoccaggio,
       CS.Indice_Rotazione,
	   NULL							AS Categoria_Piccola,
	   NULL							AS Categoria_Media,
	   NULL							AS Categoria_Grande,
	   NULL							AS Categoria_Enorme,
	   CS.Quantita_Pezzi			AS Quantita_Pezzi
FROM	dbo.Udc_Testata UT
LEFT 
JOIN	Contenuto_Semplificato	 AS CS
ON		CS.Id_Udc = UT.Id_Udc
GO
