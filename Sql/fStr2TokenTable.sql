
/****** Object:  UserDefinedFunction [dbo].[fStr2TokenTable]    Script Date: 09/15/2014 09:35:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
; $Date: 29.11.2012 17:36:21 $
; $Source: \Git\registrar-sql\Sql\System\fStr2TokenTable.sql $

Назначение:
Разбивает строку на подстроки, используя разделитель.
Возвращает таблицу подстрок.

Пример вызова:
SELECT * FROM dbo.fStr2TokenTable(',', '1564,123,1233')
SELECT * FROM dbo.fStr2TokenTable(' ', '    ИВАНОВ    ЕВГЕНИЙ     СЕМЕНОВИЧ   ')
*/

ALTER FUNCTION [dbo].[fStr2TokenTable](
	@strDelimiter VARCHAR(50) = '[^0-9А-яЁёA-Za-z]'
,	@strString VARCHAR(max)
,	@nNumLen INT
)
RETURNS @tTokens_ TABLE (
	Id INT IDENTITY
,	Num VARCHAR(10)
,	Token VARCHAR(max)
)
AS
BEGIN
	DECLARE @szToken_ VARCHAR(max)
	,	@nLen_ INT
	,	@szNum_ VARCHAR(10)

	SET @strDelimiter = '%' + @strDelimiter + '%'

	--убираем (перевод строки, 0x0A) и (возврат каретки, 0x0D)
	--SET @strString = REPLACE (REPLACE (@strString, 0x0A, ''), 0x0D, '')

	WHILE (LEN(@strString) > 0)
	BEGIN
		SET @strString = LTRIM(@strString)
		
		SET @nLen_ = PATINDEX (@strDelimiter, @strString COLLATE Cyrillic_General_BIN)
		SET @szNum_ = LTRIM (SUBSTRING (@strString, 1, @nLen_ + @nNumLen))
		SET @strString = STUFF (@strString, 1, @nLen_ + @nNumLen, NULL)
		
		-- далее COLLATE применяется для исключения паразитных символов(№ЂЃѓЉЊЌЋЏђ™љњќћџЎўЈҐЁЄЇІіґёєјЅѕї)
		SET @nLen_ = PATINDEX (@strDelimiter, @strString COLLATE Cyrillic_General_BIN)
		IF (@nLen_ < 1)
		BEGIN
			SET @szToken_ = @strString
			SET @strString = NULL
		END
		ELSE
		BEGIN
			SET @szToken_ = LTRIM (SUBSTRING (@strString, 1, @nLen_ - 1))
			SET @strString = STUFF (@strString, 1, @nLen_ - 1, NULL)
		END

		IF (LEN(@szToken_) > 0)
			INSERT @tTokens_ (Num,[Token]) VALUES (@szNum_, @szToken_)
	END

	RETURN
END