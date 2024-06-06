SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [dbo].[vContenuto_Partizioni]
AS
	WITH Famiglie_A_Stock AS
	(
		SELECT	P.ID_PARTIZIONE,
				P.DESCRIZIONE,
				UD.Id_Articolo,
				CAST(UD.Data_Scadenza AS DATE)	Data_Produzione,
				MIN(UP.Z)							QuotaDeposito,
				P.PROFONDITA,
				MAX(UT.Profondita)					ProfonditaUDC
		FROM	Partizioni			P
		JOIN	Udc_Posizione		UP
		ON		UP.Id_Partizione = P.ID_PARTIZIONE
			AND P.ID_TIPO_PARTIZIONE IN ('MA','SC')
		JOIN	Udc_Testata			UT
		ON		UT.Id_Udc = UP.Id_Udc
		JOIN	Udc_Dettaglio		UD
		ON		UD.Id_Udc  = UP.Id_Udc
		JOIN	Articoli			A
		ON		A.Id_Articolo = UD.Id_Articolo
		GROUP
			BY	P.ID_PARTIZIONE,
				P.DESCRIZIONE,
				UD.Id_Articolo,
				CAST(UD.Data_Scadenza AS DATE),
				P.PROFONDITA
	)
	SELECT	ID_PARTIZIONE,
			DESCRIZIONE,
			COUNT(DISTINCT Id_Articolo)								N_Famiglie_Articolo,
			COUNT(DISTINCT Data_Produzione)							N_Famiglie_Produzione--,
			--PROFONDITA - MIN(QuotaDeposito) - MAX(ProfonditaUDC)	Spazio_Libero,
			--(PROFONDITA - MIN(QuotaDeposito) - MAX(ProfonditaUDC))
			--	/ MAX(ProfonditaUDC)								N_Udc_Medie_Pox,
			--(PROFONDITA / MAX(ProfonditaUDC))						N_POSTI_TOTALI
	FROM	Famiglie_A_Stock
	GROUP
		BY	ID_PARTIZIONE,
			DESCRIZIONE,
			PROFONDITA
	
GO
