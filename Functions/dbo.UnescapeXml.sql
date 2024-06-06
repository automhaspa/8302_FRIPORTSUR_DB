SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE FUNCTION [dbo].[UnescapeXml] 
(@xml nvarchar(4000))
RETURNS nvarchar(4000)
AS
BEGIN
    declare @return nvarchar(4000)
    select @return = 
	REPLACE(
    REPLACE(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(@xml, '&amp;','&')
                , '&lt;','<')
            , '&gt;','>')
        , '&quot;','"')
    , '&#39;','''')
	,'&apos;', '''')

return @return
end
GO
