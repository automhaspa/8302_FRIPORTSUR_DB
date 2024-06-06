SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO








CREATE VIEW	[Mobile].[vUdcTestataInLista]
AS

WITH LinkedPallets AS
(
	SELECT DISTINCT id_udc, L.Codice, L.Id_Tipo_Lista, LA.Elaborato FROM dbo.Liste_Associazioni LA
	LEFT JOIN dbo.Liste_Dettaglio AS LD ON LA.Id_Lista_Dettaglio=LD.Id_Lista_Dettaglio
	LEFT JOIN dbo.Liste AS L ON L.Id_Lista=Ld.Id_Lista AND L.Id_Tipo_Stato_Lista <> 7 
)
SELECT 
		vUt.*,
		ISNULL(LP.Codice,'') Codice_Lista,
		ISNULL(LP.Id_Tipo_Lista,'') Id_Tipo_Lista,
		CASE
        WHEN LP.Elaborato = 0 AND M.Id_Missione IS NULL THEN 0
		WHEN lp.Elaborato = 0 AND M.Id_Missione IS NOT NULL THEN 1
		WHEN LP.Elaborato = 1 THEN 2
		END AS Stato_Elaborazione
FROM mobile.vUdcTestata vUT
JOIN LinkedPallets LP ON LP.Id_Udc = vUT.Id_Udc
LEFT JOIN dbo.Missioni M ON M.Id_Udc = LP.Id_Udc

GO
