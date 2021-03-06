﻿:r ../_sqlinc/create_func_tvf_multi.sqlinc

/*
$Date: 15.09.2014 13:22:21 $
$Source: Git\gk-molodegniy\Sql\fStr2LineTable.sql $

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
)
returns @tLine_ table (
	Id int IDENTITY
,	Line varchar(1024)
)
as
begin
	declare @szLine_ varchar(255)
	,	@nLen_ int

	set @strDelimiter = '%' + @strDelimiter + '%'


	while (len(@strString) > 0)
	begin
		set @strString = ltrim(@strString)
		-- далее COLLATE применяется для исключения паразитных символов(№ЂЃѓЉЊЌЋЏђ™љњќћџЎўЈҐЁЄЇІіґёєјЅѕї)
		set @nLen_ = patindex (@strDelimiter, @strString COLLATE Cyrillic_General_BIN)
		if (@nLen_ < 1)
		begin
			set @szLine_ = @strString
			set @strString = null
		end
		else
		begin
			set @szLine_ = ltrim (substring (@strString, 1, @nLen_ - 1))
			set @strString = STUFF (@strString, 1, @nLen_, null)
		end

		if (len(@szLine_) > 0)
		begin
			--убираем (перевод строки, 0x0A) и (возврат каретки, 0x0D)
			set @szLine_ = REPLACE (REPLACE (@szLine_, 0x0A, ''), 0x0D, '')
			insert @tLine_ ([Line]) values (@szLine_)
		end
	end

	return
end