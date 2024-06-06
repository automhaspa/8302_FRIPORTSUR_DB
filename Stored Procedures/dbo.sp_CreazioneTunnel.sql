SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[sp_CreazioneTunnel]
	@ID_SCAFFALE INT,
	@PIANI INT,
	@COLONNE INT,
	@NUMERO_PROFONDITA INT,
	@ALTEZZA INT,
	@LARGHEZZA INT,
	@PROFONDITA INT,
	@PESO INT,
	@ID_TIPO_PARTIZIONE VARCHAR(2) = 'MA',
	@CAPIENZA INT
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY	
		-- Dichiarazioni Variabili;
		DECLARE @Numero_Tunnel Int
		DECLARE @Descrizione_Scaffale Varchar(4)
		DECLARE @Codice_Abbreviato Varchar(4)
		DECLARE @Codice_Abbreviato_SottoComponente CHAR(4)
		DECLARE @Count Int
		DECLARE @COUNT_PARTIZIONI INT
		DECLARE @ID_SOTTOCOMPONENTE INT

		-- Inserimento del codice;
		SELECT	@Descrizione_Scaffale = Descrizione
		FROM	Componenti	
		WHERE	Id_Componente = @ID_SCAFFALE

		SET @Numero_Tunnel = @COLONNE * @PIANI

		INSERT INTO SottoComponenti (Id_Componente,Descrizione,Codice_Abbreviato)
		VALUES (@ID_SCAFFALE,@Descrizione_Scaffale,'0000')

		SELECT @ID_SOTTOCOMPONENTE = SCOPE_IDENTITY()

		INSERT INTO Partizioni (Id_SottoComponente,Descrizione,Codice_Abbreviato,Id_Tipo_Partizione, CAPIENZA)
		VALUES (@Id_SottoComponente,@Descrizione_Scaffale,'0000','OO', @CAPIENZA)


		WHILE ISNULL(@Count,0) < @Numero_Tunnel
		BEGIN

			SET @Count = ISNULL(@Count,0) + 1
			SET @COUNT_PARTIZIONI = 0

			IF @Count <= 9 SET @Codice_Abbreviato = '000' + CONVERT(Varchar,@Count)
			ELSE IF @Count <= 99 SET @Codice_Abbreviato = '00' + CONVERT(Varchar,@Count)
			ELSE IF @Count <= 999 SET @Codice_Abbreviato = '0' + CONVERT(Varchar,@Count)
			ELSE SET @Codice_Abbreviato = CONVERT(VARCHAR,@Count)
		
			INSERT INTO SottoComponenti (Id_Componente,Descrizione,Codice_Abbreviato,PIANO,COLONNA)
			VALUES (@ID_SCAFFALE
					,@Descrizione_Scaffale + '.' + @Codice_Abbreviato
					,@Codice_Abbreviato
					, CEILING(CONVERT(NUMERIC(18, 9), @Codice_Abbreviato) / @COLONNE) 
					, CONVERT(NUMERIC(18, 9), @Codice_Abbreviato) - (CEILING(CONVERT(NUMERIC(18, 9), @Codice_Abbreviato) / @COLONNE) - 1) * @COLONNE)
			SELECT @ID_SOTTOCOMPONENTE = SCOPE_IDENTITY()
			SET @Codice_Abbreviato_SottoComponente = @Codice_Abbreviato

			WHILE ISNULL(@COUNT_PARTIZIONI,0) < @NUMERO_PROFONDITA
			BEGIN
				SET @COUNT_PARTIZIONI = ISNULL(@COUNT_PARTIZIONI,0) + 1
			
				IF @COUNT_PARTIZIONI <= 9 SET @Codice_Abbreviato = '000' + CONVERT(VARCHAR,@COUNT_PARTIZIONI)
				ELSE IF @COUNT_PARTIZIONI <= 99 SET @Codice_Abbreviato = '00' + CONVERT(VARCHAR,@COUNT_PARTIZIONI)
				ELSE IF @COUNT_PARTIZIONI <= 999 SET @Codice_Abbreviato = '0' + CONVERT(VARCHAR,@COUNT_PARTIZIONI)
				ELSE SET @Codice_Abbreviato = CONVERT(VARCHAR,@Count)
			
				INSERT INTO dbo.Partizioni (ID_SOTTOCOMPONENTE,DESCRIZIONE,CODICE_ABBREVIATO,ID_TIPO_PARTIZIONE,CAPIENZA,ALTEZZA,LARGHEZZA,PROFONDITA,PESO)
				VALUES
				(
					@ID_SOTTOCOMPONENTE,
					@Descrizione_Scaffale + '.' + @Codice_Abbreviato_SottoComponente + '.' + @Codice_Abbreviato,
					@Codice_Abbreviato, 
					@ID_TIPO_PARTIZIONE, 
					@CAPIENZA, 
					@ALTEZZA,
					@LARGHEZZA,
					@PROFONDITA,
					@PESO
				)
			END
		END
	
		 COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		THROW;
	END CATCH;
END;
GO
