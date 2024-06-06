SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [AwmConfig].[vMissioniStorico]
AS
WITH Movimenti_Storico AS 
(
	SELECT  MIN(Id_Articolo)		Id_Articolo,
			Id_Udc
	FROM	dbo.Movimenti
	GROUP
		BY	Id_Udc
	HAVING  COUNT(distinct Id_Articolo) = 1
)
SELECT	MS.Id_Missione,
		MS.Id_Udc,
		MS.Codice_Udc,
		TM.Descrizione								[Tipo Missione],
		PS.DESCRIZIONE								Sorgente,
		PD.DESCRIZIONE								Destinazione,
		MS.Utente,
		TS.Descrizione								Esito,
		MS.Data_Storicizzazione,
		MS.Data_Creazione,
		MS.Motivo_Cancellazione						[Motivo Cancellazione],
		CONCAT(MS.sX, ' ', MS.sY, ' ', MS.sZ)		Coordinata_Sorgente,
		CONCAT(MS.dX, ' ', MS.dY, ' ', MS.dZ)		Coordinata_Destinazione,
		A.codice									Codice_Articolo
FROM	dbo.Missioni_Storico			MS
JOIN	dbo.Tipo_Stato_Missioni			TS
ON		MS.Stato_Missione = TS.Id_Stato_Missione 
JOIN	dbo.Partizioni					PS
ON		MS.Id_Partizione_Sorgente = PS.ID_PARTIZIONE 
JOIN	dbo.Partizioni					PD
ON		MS.ID_PARTIZIONE_DESTINAZIONE = PD.ID_PARTIZIONE 
JOIN	dbo.Tipo_Missioni				TM
ON		MS.Id_Tipo_Missione = TM.Id_Tipo_Missione
LEFT
JOIN	Movimenti_Storico			MSS
ON		MSS.Id_Udc = MS.Id_Udc
LEFT
JOIN	dbo.Articoli					A
ON		MSS.Id_Articolo  = A.Id_Articolo
GO
