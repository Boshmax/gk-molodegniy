
/****** Object:  UserDefinedFunction [dbo].[fStr2LineTable]    Script Date: 09/15/2014 09:34:57 ******/
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

ALTER FUNCTION [dbo].[fStr2LineTable](
	@strDelimiter VARCHAR(50) = '[^0-9А-яЁёA-Za-z]'
,	@strString VARCHAR(MAX)
)
RETURNS @tLine_ TABLE (
	Id INT IDENTITY
,	Line VARCHAR(1024)
)
AS
BEGIN
	DECLARE @szLine_ VARCHAR(255)
	,	@nLen_ INT

	SET @strDelimiter = '%' + @strDelimiter + '%'


	WHILE (LEN(@strString) > 0)
	BEGIN
		SET @strString = LTRIM(@strString)
		-- далее COLLATE применяется для исключения паразитных символов(№ЂЃѓЉЊЌЋЏђ™љњќћџЎўЈҐЁЄЇІіґёєјЅѕї)
		SET @nLen_ = PATINDEX (@strDelimiter, @strString COLLATE Cyrillic_General_BIN)
		IF (@nLen_ < 1)
		BEGIN
			SET @szLine_ = @strString
			SET @strString = NULL
		END
		ELSE
		BEGIN
			SET @szLine_ = LTRIM (SUBSTRING (@strString, 1, @nLen_ - 1))
			SET @strString = STUFF (@strString, 1, @nLen_, NULL)
		END

		IF (LEN(@szLine_) > 0)
		BEGIN
			--убираем (перевод строки, 0x0A) и (возврат каретки, 0x0D)
			SET @szLine_ = REPLACE (REPLACE (@szLine_, 0x0A, ''), 0x0D, '')
			INSERT @tLine_ ([Line]) VALUES (@szLine_)
		END
	END

	RETURN
END