SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE     PROC [dbo].[sp_InsertOrUpdateNavigation]
	@NavigationKey				VARCHAR(50),
	@EntityTypeNameSource		NVARCHAR(250)
AS
BEGIN

	IF LEN(@NavigationKey) < 1
		THROW 50009, '@NavigationKey non pervenuta',1;		

	IF LEN(@EntityTypeNameSource) < 1
		THROW 50009, '@EntityTypeNameSource non pervenuta',1;

	IF NOT EXISTS(SELECT TOP (1) 1 FROM AwmConfig.Navigation WHERE NavigationKey= @NavigationKey)
	BEGIN
		INSERT INTO AwmConfig.Navigation
		(
		    NavigationKey,
		    entityTypeNameSource,
		    hashSource,
		    fieldNameSource,
		    entityTypeNameDest,
		    hashDest,
		    fieldNameDest,
		    AuthRoles,
		    ChildOrder
		)
		VALUES
		(   
			@NavigationKey,   -- NavigationKey - varchar(50)
		    @EntityTypeNameSource,  -- entityTypeNameSource - nvarchar(250)
		    '',   -- hashSource - varchar(250)
		    '',   -- fieldNameSource - varchar(100)
		    N'',  -- entityTypeNameDest - nvarchar(max)
		    '',   -- hashDest - varchar(250)
		    '', -- fieldNameDest - varchar(50)
		    1, -- AuthRoles - bigint
		    NULL  -- ChildOrder - varchar(250)
		    )

	END
	ELSE
	BEGIN
		UPDATE AwmConfig.Navigation
		SET		entityTypeNameSource = @EntityTypeNameSource
		WHERE	NavigationKey = @NavigationKey
	END

	SELECT * FROM AwmConfig.Navigation WHERE  NavigationKey = @NavigationKey
END
GO
