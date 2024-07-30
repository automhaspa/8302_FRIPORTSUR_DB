SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   VIEW [AwmConfig].[vRegoleSequenzaTestata]
AS
SELECT	RST.Id_Sequenza_Regole,
		--RST.Id_Insieme_Regole,
		RST.Descrizione,
		TSM.Descrizione AS Tipo_Missione,
		RST.Data_Creazione,
		RST.Data_Ultima_Modifica 
FROM	dbo.Regole_Sequenza_Testata RST
JOIN	dbo.Tipo_Missioni			TSM
ON		TSM.Id_Tipo_Missione = RST.Id_Tipo_Missione

GO
