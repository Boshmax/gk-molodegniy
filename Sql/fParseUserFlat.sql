:r ../_sqlinc/create_func_tvf_multi.sqlinc

/*
$Date: 27.01.2015 11:52:05 $
$Source: Git\gk-molodegniy\Sql\fParseUserFlat.sql $
Назначение:

Пример вызова:

*/
alter function $(_SCHEMA).$(_OBJECT)(@szLine varchar(max)
)
returns @tUser table (
	UserId int
,	name varchar(50)
,	Flat int
,	Fraction bit
,	Apartment bit
)
as
begin

declare @nId_ int = 0
,	@szSubLine_ varchar(1000)
,	@nUserId_ int
,	@szFlat_ varchar(10)
,	@nFlat_ int
,	@szName_ varchar(50)
,	@nStart_ int = 0
,	@nFinish_ int = 0
,	@nSubStart_ int = 0
,	@nSubFinish_ int = 0
,	@nFraction_ bit = 0
,	@nApartment_ bit = 0

--DECLARE @tUser table (
--	UserId int
--,	name varchar(50)
--,	Flat int
--,	Fraction bit)

while 1=1
begin

	set @nStart_ = charindex  ('[abbr' , @szLine , @nFinish_+ 1)
	set @nFinish_ = charindex  ('[/abbr]' , @szLine , @nFinish_ +1)

	if @nStart_ = 0
		break


	set @nSubStart_ = 0
	set @nSubFinish_ = 0
	set @szSubLine_ = substring (@szLine, @nStart_, @nFinish_- @nStart_)


	set @nSubStart_ = charindex('[abbr="' , @szSubLine_)
	set @nSubFinish_ = charindex('"]' , @szSubLine_)

	set @szName_ = substring (@szSubLine_, @nSubStart_+7, @nSubFinish_-@nSubStart_-7)


	set @szSubLine_ = substring(@szSubLine_, @nSubFinish_+2, 1000)
	set @nSubStart_ = 0
	set @nSubFinish_ = 0

	set @nSubStart_ = charindex('[url=http://gk-molodegniy.ru/profile.php?id=' , @szSubLine_)
	set @nSubFinish_ = charindex(']' , @szSubLine_)

	if @nSubStart_<> 0
		set @nUserId_ = substring(@szSubLine_, @nSubStart_+44, @nSubFinish_-@nSubStart_-44)
	else
		set @nSubFinish_ = -1

	set @szSubLine_ = substring(@szSubLine_, @nSubFinish_+1, 1000)
	set @nSubStart_ = 0
	set @nSubFinish_ = 0

	set @nSubFinish_ = charindex('[/url]' , @szSubLine_)
	if @nSubFinish_ = 0
		set @nSubFinish_ = len(@szSubLine_)+1
	set @szFlat_ = substring(@szSubLine_, @nSubStart_, @nSubFinish_-@nSubStart_)


	if ISNUMERIC(@szFlat_)= 1
		set @nFlat_ = cast(@szFlat_ as int)
	--IF @szFlat_ = '*'
	--номер остается
	if ISNUMERIC(@szFlat_)= 1
		set @nFlat_ = cast(@szFlat_ as int)
	if @szFlat_ like '[aаAА]'
		set @nFraction_ = 1
	if @szFlat_ like '%[0-9][aаAА]' or @szFlat_ like '%[0-9] [aаAА]'
	begin
		set @nFraction_ = 1
		set @szFlat_ = REPLACE (REPLACE (@szFlat_, 'A',''), 'А','')
		if ISNUMERIC(@szFlat_)= 1
			set @nFlat_ = cast(@szFlat_ as int)
	end
	if @szFlat_ like '[АA][0-9]%'
	begin
		set @nApartment_ = 1
		set @szFlat_ = REPLACE (REPLACE (@szFlat_, 'A',''), 'А','')
		if ISNUMERIC(@szFlat_)= 1
			set @nFlat_ = cast(@szFlat_ as int)
	end
	insert @tUser(UserId, name, Flat, Fraction, Apartment)
	select @nUserId_, @szName_, @nFlat_, @nFraction_, @nApartment_

end
	return
end
