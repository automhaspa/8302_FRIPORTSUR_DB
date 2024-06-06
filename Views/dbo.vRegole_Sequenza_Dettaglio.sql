SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vRegole_Sequenza_Dettaglio]
AS
SELECT RSD.Id_Sequenza_Regole_Dettaglio,
             RSD.Sequenza,
             RST.Descrizione AS Descrizione_Sequenza,
             R.Nome,
             R.Ordinamento,
             RI.Descrizione      AS Descrizione_Insieme
FROM   Regole_Sequenza_Dettaglio  RSD
JOIN   Regole_Sequenza_Testata           RST
ON           RSD.Id_Sequenza_Regole = RST.Id_Sequenza_Regole
JOIN   Regole                                  R
ON           R.Id_Regola = RSD.Id_Regola
JOIN   Regole_Insieme                          RI
ON           RI.Id_Insieme_Regole = RST.Id_Insieme_Regole
GO
