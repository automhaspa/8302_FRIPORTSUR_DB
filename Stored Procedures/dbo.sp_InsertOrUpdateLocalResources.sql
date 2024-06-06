SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   PROC [dbo].[sp_InsertOrUpdateLocalResources]
	@ResourceName				nvarchar(200),
	@ResourceValue				nvarchar(max),
	
	@LanguageId					nvarchar(2) = 'en'
AS
BEGIN	
	IF LEN(@ResourceName) < 1
		THROW 50009, 'ResourceName non pervenuta',1;

	IF NOT EXISTS(SELECT TOP (1) 1 FROM AwmConfig.LocalResource WHERE ResourceName= @ResourceName AND LanguageId  = @LanguageId)
	BEGIN
		INSERT INTO AwmConfig.LocalResource
		(
			ResourceName,
			ResourceValue,
			LanguageId
		)
		VALUES
		(
			@ResourceName,
			@ResourceValue,
			@LanguageId
		)
	END
	ELSE
	BEGIN
		UPDATE  AwmConfig.LocalResource
		SET		ResourceValue = @ResourceValue
		WHERE	ResourceName= @ResourceName 
			AND LanguageId  = @LanguageId
	END

	SELECT	LanguageId,
			ResourceName,
			ResourceValue 
	FROM	AwmConfig.LocalResource
	WHERE	ResourceName= @ResourceName 
		AND LanguageId  = @LanguageId
END
GO
