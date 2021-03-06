﻿:r ../_sqlinc/create_func_tvf_multi.sqlinc

/*
$Date: 15.09.2014 13:21:57 $
$Source: Git\gk-molodegniy\Sql\fStr2TokenTable.sql $

Назначение:
Разбивает строку на подстроки, используя разделитель.
Возвращает таблицу подстрок.

Пример вызова:
select * from dbo.fStr2TokenTable(',', '1564, 123, 1233')
select * from dbo.fStr2TokenTable(' ', '    ИВАНОВ    ЕВГЕНИЙ     СЕМЕНОВИЧ   ')
*/

alter function $(_SCHEMA).$(_OBJECT)(
	@strDelimiter varchar(50) = '[^0-9А-яЁёA-Za-z]'
,	@strString varchar(max)
,	@nNumLen int
)
returns @tTokens_ table (
	Id int IDENTITY
,	Num varchar(10)
,	Token varchar(max)
)
as
begin
	declare @szToken_ varchar(max)
	,	@nLen_ int
	,	@szNum_ varchar(10)

	set @strDelimiter = '%' + @strDelimiter + '%'

	--убираем (перевод строки, 0x0A) и (возврат каретки, 0x0D)
	--SET @strString = REPLACE (REPLACE (@strString, 0x0A, ''), 0x0D, '')

	while (len(@strString) > 0)
	begin
		set @strString = ltrim(@strString)

		set @nLen_ = patindex (@strDelimiter, @strString COLLATE Cyrillic_General_BIN)
		set @szNum_ = ltrim (substring (@strString, 1, @nLen_ + @nNumLen))
		set @strString = STUFF (@strString, 1, @nLen_ + @nNumLen, null)

		-- далее COLLATE применяется для исключения паразитных символов(№ЂЃѓЉЊЌЋЏђ™љњќћџЎўЈҐЁЄЇІіґёєјЅѕї)
		set @nLen_ = patindex (@strDelimiter, @strString COLLATE Cyrillic_General_BIN)
		if (@nLen_ < 1)
		begin
			set @szToken_ = @strString
			set @strString = null
		end
		else
		begin
			set @szToken_ = ltrim (substring (@strString, 1, @nLen_ - 1))
			set @strString = STUFF (@strString, 1, @nLen_ - 1, null)
		end

		if (len(@szToken_) > 0)
			insert @tTokens_ (Num,[Token]) values (@szNum_, @szToken_)
	end

	return
end