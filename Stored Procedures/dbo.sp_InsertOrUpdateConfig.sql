SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   PROC [dbo].[sp_InsertOrUpdateConfig]	
	@Chiave	NVARCHAR(255),
	@Valore NVARCHAR(MAX)
AS
BEGIN
	IF NOT (ISJSON (@Valore) = 1)
		THROW 50009, 'Errore nel json',1;

	IF LEN(@Valore) < 1
		THROW 50009, 'Valore non specificato',1;


	IF NOT EXISTS(SELECT TOP (1) 1 FROM dbo.Configurazioni WHERE Chiave = @Chiave)
	BEGIN
		INSERT INTO dbo.Configurazioni
		(
		    Chiave,
		    Valore
		)
		VALUES
		(  
			@Chiave,
			@Valore
		)
	END
	ELSE
	BEGIN
		UPDATE	dbo.Configurazioni
		SET		Valore = @Valore
		WHERE	Chiave = @Chiave
	END

	SELECT Chiave,
           Valore 
	FROM dbo.Configurazioni 
	WHERE Chiave = @Chiave
END

GO
