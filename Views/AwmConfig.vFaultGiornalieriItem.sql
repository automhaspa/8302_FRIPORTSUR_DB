SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE   VIEW [AwmConfig].[vFaultGiornalieriItem] AS

SELECT	CONVERT(DATE, GIORNO)															Data,
		ITEM																			Item,
		TC.DESCRIZIONE																	Tipologia_Item,
		COUNT(1)																		N_Fault,
		CAST(AVG(ELAPSED_TIME) AS INT)													Durata_Media_Fermi_Minuti,
		CAST(SUM(ELAPSED_TIME) AS INT)													Durata_Totale_Fermi_Minuti,
		CONCAT(CAST(100 * pc.Peso_Indisponibilita_Elettromeccanica AS INT),'%')			Peso_Item_Su_Impianto,
		CAST(SUM(ELAPSED_TIME) * PC.Peso_Indisponibilita_Elettromeccanica  AS INT)		Impatto_Totale_Fermi_Minuti
FROM	Logs.[Fault_Item_Per_Day](CAST(DATEADD(DAY,-1,GETDATE()) AS DATE))				FI
JOIN	dbo.Peso_Componenti							PC
ON		PC.Asi = FI.ITEM COLLATE Latin1_General_CI_AS
JOIN	dbo.Componenti								C
ON		C.DESCRIZIONE = FI.ITEM COLLATE Latin1_General_CI_AS
JOIN	dbo.Tipo_Componenti							TC
ON		TC.ID_TIPO_COMPONENTE = C.ID_TIPO_COMPONENTE 
GROUP
	BY	FI.Giorno,
		Item,
		PC.Peso_Indisponibilita_Elettromeccanica,
		TC.DESCRIZIONE

GO
