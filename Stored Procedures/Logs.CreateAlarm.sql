SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROC [Logs].[CreateAlarm]
		@Id_Tag		INT 
AS
BEGIN
	DECLARE @Id_Log_Alarms INT;

	INSERT INTO [Logs].[Alarms] 
			(	[Id_Tag],[TagId], [TagType], [Description], [RaisedTimeStamp])
	SELECT		@Id_Tag, TagId, TagType, Description, GETDATE() 
	FROM	dbo.TAG 
	WHERE	Id = @Id_Tag

	SET @Id_Log_Alarms = SCOPE_IDENTITY();

	INSERT INTO logs.Alarms_Percorso
	(
	    Id_Log_Alarms,
	    Id_Missione,
	    Id_Sequenza_Percorso,
	    Id_Udc,
	    Id_Adiacenza,
	    Id_Adiacenza_Composta,
		Id_Partizione_Sorgente,
		Id_Partizione_Destinazione
	)
	SELECT	@Id_Log_Alarms, 
			M.Id_Missione, 
			PRC.Id_Sequenza_Percorso, 
			M.Id_Udc, 
			PRC.Id_Adiacenza, 
			PRC.Id_Adiacenza_Composta,
			PRC.Id_Partizione_Sorgente,
			PRC.Id_Partizione_Destinazione

	FROM	dbo.TAG									T	WITH(NOLOCK)
	JOIN	dbo.Componenti							C	WITH(NOLOCK)
	ON		C.DESCRIZIONE = T.ASI
	JOIN	dbo.SottoComponenti						SC	WITH(NOLOCK)
	ON		SC.ID_COMPONENTE = C.ID_COMPONENTE
	JOIN	dbo.Partizioni							P	WITH(NOLOCK)
	ON		P.ID_SOTTOCOMPONENTE = SC.ID_SOTTOCOMPONENTE
	JOIN	dbo.Percorso							PRC WITH(NOLOCK)
	ON		PRC.Id_Tipo_Stato_Percorso = 2
		AND P.ID_PARTIZIONE IN (PRC.Id_Partizione_Sorgente, PRC.Id_Partizione_Destinazione)
	JOIN	dbo.Missioni							M   WITH(NOLOCK)
	ON		M.Id_Missione = PRC.Id_Missione
	WHERE	T.Id = @Id_Tag AND LEN(T.ASI) = 4
	OPTION  (RECOMPILE)
		
END



GO
