SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   VIEW [AwmConfig].[vAdiacenzeGruppate]
AS
SELECT	AGT.Id_Gruppo_Adiacenza,
        AGT.Regola,
        AGT.Id_Tipo_Gruppo_Adiacenza,
        AGT.Stato_Gruppo,

		AGD.Id_Gruppo_Adiacenza_Dettaglio,
        AGD.Min_Lu_No,
        AGD.Max_Lu_No,
        AGD.Ordine,

		A.Id_Adiacenza,
        A.Id_Partizione_Sorgente,
        A.SORGENTE,
        A.Id_Partizione_Destinazione,
        A.DESTINAZIONE,
        A.Descrizione,
        A.Abilitazione,
        A.Peso,
        A.Tipo,
        A.Configurazione,
        A.Direzione,
        A.Min_Lu_No AS A_Min_Lu_No,
        A.Max_Lu_No AS A_Max_Lu_No,
        A.Escludi_Lu_No

FROM	dbo.Adiacenze_Gruppi_Testata		AGT
LEFT
JOIN	dbo.Adiacenze_Gruppi_Dettaglio		AGD
ON		AGD.Id_Gruppo_Adiacenza = AGT.Id_Gruppo_Adiacenza
LEFT
JOIN	AwmConfig.vAdiacenze						A
ON		A.Id_Adiacenza = AGD.Id_Adiacenza
GO
