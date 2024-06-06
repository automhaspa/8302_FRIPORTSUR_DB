SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE FUNCTION [TESTS].[humanReadableXmlDataCluster] 
(@MessageId nvarchar(10), @xml XML)
RETURNS VARCHAR(1000)
AS
BEGIN
	-- Gets main message info from XML
	--,DataCluster.value('(/DataCluster/Asi/text())[1]','varchar(100)') ASI
	--  ,DataCLuster.query('//HANDLING_MODE/text()')
	--  ,DataCLuster.query('//Asi/text()').value('.','varchar(100)')
	DECLARE @return VARCHAR(1000)

	DECLARE @Asi VARCHAR(100)
	DECLARE @HandlingMode VARCHAR(100)
	DECLARE @LUMoveId VARCHAR(100)
	DECLARE @OPID VARCHAR(100)
	

	SET @Asi = @xml.query('//Asi/text()').value('.','varchar(100)')
	SET @HandlingMode = @xml.query('//HANDLING_MODE/text()').value('.','varchar(10)')
	SET @LUMoveId = @xml.query('//LU_MOVE_ID/text()').value('.','varchar(10)')
	SET @OPID = @xml.query('//OpProgressId/text()').value('.','varchar(10)')
	

	SET @return = CONCAT('#',@OPID)
	--IF (@Asi<>'')
	--BEGIN
	--	SET @return = CONCAT(@return,' ASI ',@Asi)
	--END
	IF (@HandlingMode<>'')
	BEGIN
		SET @return = CONCAT(@return,' HMode ',@HandlingMode)
	END

	
	
-- 1100	UDC ON ITEM
-- 11001	ASI_GET_EMPTY
-- 11013	ASI_MOVE_TO_COMP
-- 12000	LU_ON_ASI_CONF
-- 12002	ASI_COMMAND
-- 62020	SHOW_MESSAGE_TO_ASI
-- 12031	LU_DATA_RQ_TO_ASI	

	IF (@MessageId='11031' OR @MessageId='11000') -- 11031	LU_DATA_FROM_ASI -- 11000	LU_ON_ASI
	BEGIN
		DECLARE @CONTAINER_TYPE VARCHAR(100)
		DECLARE @CONTAINER_HEIGHT VARCHAR(100)
		DECLARE @CONTAINER_LENGTH VARCHAR(100)
		DECLARE @CONTAINER_WIDTH VARCHAR(100)
		DECLARE @HEIGHT VARCHAR(100)    
		DECLARE @LENGTH VARCHAR(100)    
		DECLARE @WIDTH VARCHAR(100)    
		DECLARE @WEIGTH VARCHAR(100)    
		DECLARE @LENGTH_SIDE_1_SURPLUS VARCHAR(100)    
		DECLARE @LENGTH_SIDE_2_SURPLUS VARCHAR(100)    
		DECLARE @WIDTH_SIDE_1_SURPLUS VARCHAR(100)
		DECLARE @WIDTH_SIDE_2_SURPLUS VARCHAR(100)    
		DECLARE @HEIGHT_SURPLUS VARCHAR(100)    
		DECLARE @CODE VARCHAR(100)
		SET @CONTAINER_TYPE  = @xml.query('//LU_CONTAINER_TYPE/text()').value('.','varchar(100)')
		SET @CONTAINER_HEIGHT = @xml.query('//LU_CONTAINER_SIZE_HEIGHT/text()').value('.','varchar(100)')
		SET @CONTAINER_LENGTH = @xml.query('//LU_CONTAINER_SIZE_LENGTH/text()').value('.','varchar(100)')
		SET @CONTAINER_WIDTH = @xml.query('//LU_CONTAINER_SIZE_WIDTH/text()').value('.','varchar(100)')
		SET @HEIGHT  = @xml.query('//LU_HEIGHT/text()').value('.','varchar(100)')
		SET @LENGTH = @xml.query('//LU_LENGTH/text()').value('.','varchar(100)')
		SET @WIDTH = @xml.query('//LU_WIDTH/text()').value('.','varchar(100)')
		SET @WEIGTH = @xml.query('//LU_WEIGTH/text()').value('.','varchar(100)')
		SET @LENGTH_SIDE_1_SURPLUS = @xml.query('//LU_LENGTH_SIDE_1_SURPLUS/text()').value('.','varchar(100)')
		SET @LENGTH_SIDE_2_SURPLUS = @xml.query('//LU_LENGTH_SIDE_2_SURPLUS/text()').value('.','varchar(100)')
		SET @WIDTH_SIDE_1_SURPLUS = @xml.query('//LU_WIDTH_SIDE_1_SURPLUS/text()').value('.','varchar(100)')
		SET @WIDTH_SIDE_2_SURPLUS = @xml.query('//LU_WIDTH_SIDE_2_SURPLUS/text()').value('.','varchar(100)')
		SET @HEIGHT_SURPLUS = @xml.query('//LU_HEIGHT_SURPLUS/text()').value('.','varchar(100)')
		SET @CODE = @xml.query('//LU_CODE/text()').value('.','varchar(100)')
		SET @return = CONCAT(@return,' Code ',@CODE) 
		SET @return = CONCAT(@return,' ',@LENGTH,'x',@WIDTH,'x',@HEIGHT)
		SET @return = CONCAT(@return,' Weight ',@WEIGTH)
		SET @return = CONCAT(@return,' L+ ',@LENGTH_SIDE_1_SURPLUS,',',@LENGTH_SIDE_2_SURPLUS)
		SET @return = CONCAT(@return,' W+ ',@WIDTH_SIDE_1_SURPLUS,',',@WIDTH_SIDE_2_SURPLUS)
		SET @return = CONCAT(@return,' Ht+ ',@HEIGHT_SURPLUS)
		SET @return = CONCAT(@return,' Container type ',@CONTAINER_TYPE,' ',@CONTAINER_LENGTH,'x',@CONTAINER_WIDTH,'x',@CONTAINER_HEIGHT)
	END

	IF (@MessageId='11033') -- 11033	RAW_DATA_FROM_ASI
	BEGIN
		SET @return = CONCAT(@return,' R0 ',@xml.query('//DATA_0/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,' R1 ',@xml.query('//DATA_1/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,' R2 ',@xml.query('//DATA_2/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,' R3 ',@xml.query('//DATA_3/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,' R4 ',@xml.query('//DATA_4/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,' R5 ',@xml.query('//DATA_5/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,' R6 ',@xml.query('//DATA_6/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,' R7 ',@xml.query('//DATA_7/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,' R8 ',@xml.query('//DATA_8/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,' R9 ',@xml.query('//DATA_9/text()').value('.','varchar(100)')) 
	END

	IF (@MessageId='12020') -- 12020	LU_MOVE_TO
	BEGIN
		SET @return = CONCAT(@return,' SRC ',@xml.query('//LU_1_SOURCE_ASI/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,'.',@xml.query('//LU_1_SOURCE_SUBITEM/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,'.',@xml.query('//LU_1_SOURCE_PARTITION/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,' DEST ',@xml.query('//LU_1_DEST_ASI/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,'.',@xml.query('//LU_1_DEST_SUBITEM/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,'.',@xml.query('//LU_1_DEST_PARTITION/text()').value('.','varchar(100)')) 
	END

	IF (@MessageId='12021') -- 12021	LU_MOVE_TO_PREDICTIVE
	BEGIN
		SET @return = CONCAT(@return,' SRC ',@xml.query('//LU_1_SOURCE_ASI/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,'.',@xml.query('//LU_1_SOURCE_SUBITEM/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,'.',@xml.query('//LU_1_SOURCE_PARTITION/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,' DEST ',@xml.query('//LU_1_DEST_ASI/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,'.',@xml.query('//LU_1_DEST_SUBITEM/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,'.',@xml.query('//LU_1_DEST_PARTITION/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,' DESTN ',@xml.query('//LU_1_DEST_NEXT_ASI/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,'.',@xml.query('//LU_1_DEST_NEXT_SUBITEM/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,'.',@xml.query('//LU_1_DEST_NEXT_PARTITION/text()').value('.','varchar(100)')) 
	END
	
	IF (@MessageId='11023')-- 11023	LU_MOVE_TO_COMPLETED
	BEGIN
		SET @return = CONCAT(@return,' FINALPOS ',@xml.query('//LU_1_FINAL_POS_ASI/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,'.',@xml.query('//LU_1_FINAL_POS_SUBITEM/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,'.',@xml.query('//LU_1_FINAL_POS_PARTITION/text()').value('.','varchar(100)')) 
	END

	IF (@MessageId='12010')-- 12010	ASI_MOVE_TO
	BEGIN
		SET @return = CONCAT(@return,' POS ',@xml.query('//POS_PARAM_0/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,'.',@xml.query('//POS_PARAM_1/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,'.',@xml.query('//POS_PARAM_2/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,' REF ',@xml.query('//REF_PARAM_0/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,'.',@xml.query('//REF_PARAM_1/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,'.',@xml.query('//REF_PARAM_2/text()').value('.','varchar(100)')) 
	END

	IF (@MessageId='11002')-- 11002	ASI_EVENT
	BEGIN
		SET @return = CONCAT(@return,' EVENT ',@xml.query('//EVENT_CODE/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,' P1 ',@xml.query('//EVENT_PARAM_1/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,' P2 ',@xml.query('//EVENT_PARAM_2/text()').value('.','varchar(100)')) 
	END

	IF (@MessageId='12002')-- 11002	ASI_COMMAND
	BEGIN
		SET @return = CONCAT(@return,' CMD ',@xml.query('//COMMAND_CODE/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,' P1 ',@xml.query('//COMMAND_PARAM_1/text()').value('.','varchar(100)')) 
		SET @return = CONCAT(@return,' P2 ',@xml.query('//COMMAND_PARAM_2/text()').value('.','varchar(100)')) 
	END

	IF (@LUMoveId<>'')
	BEGIN
		SET @return = CONCAT(@return,' LuMoveId ',@LUMoveId)
	END

	RETURN @return
END
GO
