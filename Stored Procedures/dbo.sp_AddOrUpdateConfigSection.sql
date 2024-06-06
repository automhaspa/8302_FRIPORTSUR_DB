SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
ESEMPI UTILIZZO:
--MODIFICA/INSERIMENTO DI UNA CONFIGURAZIONE NEL NAVMENU
EXEC sp_AddOrUpdateConfigSection
@Chiave				= 'Blazor:DefaultEntity:NavMenu:MenuItems',
@PropertyKey		= '',
@Position			= 2,
@PropertyValue		= '{          "Href": "v/RushMover",          "Title": "RushMover",          "ImageSrc": "Partitions.svg",          "HasSeparator": "false"      }'

--RIMOZIONE DI UNA PROPRIETA' DA UNA CONFIGURAZIONE
EXEC sp_AddOrUpdateConfigSection
@Chiave				= 'Blazor:Capienza_Magazzino',
@PropertyKey		= '"UpdateInterval"',
@PropertyValue		= NULL

--MODIFICA DEL VALORE DI UNA PROPRIETA' DA UNA CONFIGURAZIONE
EXEC sp_AddOrUpdateConfigSection
@Chiave				= 'Blazor:Capienza_Magazzino',
@PropertyKey		= '"IdleTimeout"',
@PropertyValue		= '15'

--INSERIMENTO DI UNA NUOVA PROPRIETA' IN UNA CONFIGURAZIONE SPECIFICANDO LA POSIZIONE
EXEC sp_AddOrUpdateConfigSection
@Chiave				= 'Blazor:Capienza_Magazzino',
@PropertyKey		= '"UpdateInterval"',
@Position			= 1,
@PropertyValue		= '15000'


--INSERIMENTO DI UNA NUOVA PROPRIETA' IN UNA CONFIGURAZIONE SENZA SPECIFICARE LA POSIZIONE
EXEC sp_AddOrUpdateConfigSection
@Chiave				= 'Blazor:Capienza_Magazzino',
@PropertyKey		= '"Test"',
@PropertyValue		= '15000'

--INSERIMENTO DI UNA NUOVA PROPRIETA' IN UNA CONFIGURAZIONE SPECIFICANDO CHE DEVE ESSERE LA PRIMA
EXEC sp_AddOrUpdateConfigSection
@Chiave				= 'Blazor:Capienza_Magazzino',
@PropertyKey		= '"Ciao"',
@Position			= 0,
@PropertyValue		= 'Laura'

*/

CREATE   PROC [dbo].[sp_AddOrUpdateConfigSection]
	@Chiave				NVARCHAR(255),
	@PropertyKey		VARCHAR(255),
	@Position			INT				= 9999999,
	@PropertyValue		NVARCHAR(MAX)	= NULL
AS
BEGIN
	DECLARE @NewPropertyValue	NVARCHAR(MAX) = CASE WHEN ISNULL(@PropertyKey,'') = '' THEN '[ ]' ELSE '{}' END

	DECLARE @CurrentValue		NVARCHAR(MAX)
	SELECT	@CurrentValue = Valore
	FROM	dbo.Configurazioni
	WHERE	Chiave = @Chiave

	IF ISNULL(@PropertyKey,'') <> ''
		SET @PropertyKey = CONCAT('$.', @PropertyKey)

	IF @PropertyValue IS NULL
		SET @NewPropertyValue = REPLACE
								(
									JSON_MODIFY(@CurrentValue,@PropertyKey, NULL),
									'null,',''
								)
	ELSE
	BEGIN
		DECLARE @InKey		VARCHAR(100)
		DECLARE @InValue	VARCHAR(MAX)
				
		DECLARE @CurPosition	INT = 0

		IF @PropertyKey <> ''
		BEGIN
			IF (
					@Position IS NULL
					OR
					(
						SELECT	COUNT([key])
						FROM	OPENJSON(@CurrentValue)
					) <= @Position
				)
				SET @NewPropertyValue = JSON_MODIFY(@CurrentValue,@PropertyKey,	CASE
																					WHEN ISJSON(@PropertyValue) = 1 THEN	JSON_QUERY(@PropertyValue)
																					ELSE									@PropertyValue
																				END)
			ELSE
			BEGIN
				DECLARE CurJson CURSOR LOCAL FAST_FORWARD FOR
					SELECT	[Key],
							[Value]
					FROM	OPENJSON(@CurrentValue)
			
				OPEN CurJson
				FETCH NEXT FROM CurJson INTO
					@InKey,
					@InValue

				WHILE @@FETCH_STATUS = 0
				BEGIN
					SET @NewPropertyValue =	JSON_MODIFY	(
															@NewPropertyValue,
															CASE
																WHEN @CurPosition <> @Position THEN CONCAT('$.', @InKey)
																ELSE @PropertyKey
															END,
															CASE
																WHEN @CurPosition <> @Position THEN
																	CASE
																		WHEN ISJSON(@InValue) = 1 THEN	JSON_QUERY(@InValue)
																		ELSE							@InValue
																	END
																ELSE
																	CASE
																		WHEN ISJSON(@PropertyValue) = 1 THEN	JSON_QUERY(@PropertyValue)
																		ELSE									@PropertyValue
																	END
															END
														)
					
					IF @CurPosition <> @Position
						FETCH NEXT FROM CurJson INTO
							@InKey,
							@InValue

					SET @CurPosition +=1
				END

				CLOSE CurJson
				DEALLOCATE CurJson
			END
		END
		ELSE
		BEGIN
			DECLARE @TMP_TABLE TABLE (Chiave VARCHAR(4000), Valore VARCHAR(MAX))
			INSERT INTO @TMP_TABLE
			SELECT	CASE
						WHEN [key] >= @Position THEN [Key] + 1
						ELSE [Key]
					END,
					[Value]
			FROM	OPENJSON(@CurrentValue)UNION
			SELECT  @Position,
					@PropertyValue

			DECLARE CurJson CURSOR LOCAL FAST_FORWARD FOR
				SELECT	MIN(CAST(Chiave AS INT)),
						Valore
				FROM	@TMP_TABLE
				GROUP
					BY	Valore
				ORDER
					BY	MIN(CAST(Chiave AS INT))

			OPEN CurJson
			FETCH NEXT FROM CurJson INTO
				@InKey,
				@InValue

			WHILE @@FETCH_STATUS = 0
			BEGIN
				SET @NewPropertyValue = JSON_MODIFY(@NewPropertyValue, 'append $', JSON_QUERY(@InValue))
				
				FETCH NEXT FROM CurJson INTO
					@InKey,
					@InValue
			END

			CLOSE CurJson
			DEALLOCATE CurJson
		END
	END
	
	EXEC dbo.sp_InsertOrUpdateConfig
		@Chiave = @Chiave,
	    @Valore = @NewPropertyValue	

END

GO
