:r ../_sqlinc/create_proc.sqlinc
/*
$Date: 27.01.2015 11:30:59 $
$Source: Git\gk-molodegniy\Sql\pParseChessFloor.sql $

Назначение:

Пример вызова:
*/

alter procedure $(_SCHEMA).$(_OBJECT)
	@strString varchar(max)
,	@debug bit = 0
as
begin
declare @szDelimiter_ varchar(50)
set @szDelimiter_ = char(13)+CHAR(10)


create table #tline (id int, Line varchar(1000), Data bit)

insert #tline(id, Line, Data)
select Id, Line , 0
from [dbo].[fStr2LineTable](@szDelimiter_, @strString)

create table #tUser (
	UserId int
,	name varchar(50)
,	houseid int
,	flat int
,	Fraction bit
,	Apartment bit
)

if @debug <> 0
	select *From #tline

declare @szHouse_ varchar(100)
,	@nHouseId_ int

select @szHouse_ = Line from #tline where Line like '[[]b]Молодежный %[[]/b]'
if @@rowcount =0
begin
	raiserror('Не удалось определить Дом, поданы не правильные данные', 16, 10);
	return -1;
end

if @szHouse_ = '[b]Молодежный I[/b]'
	set @nHouseId_ = 1
if @szHouse_ = '[b]Молодежный II[/b]'
	set @nHouseId_ = 2
if @szHouse_ = '[b]Молодежный III[/b]'
	set @nHouseId_ = 3
if @szHouse_ = '[b]Молодежный IV[/b]'
	set @nHouseId_ = 4

if @nHouseId_ is null
begin
	raiserror('Не удалось определить Дом', 16, 10);
	return -1;
end

update #tline
set Data = 1
where line like '%[abbr="%"]%[/abbr]%'

declare @nId_ int = 0
,	@szLine_ varchar(1000)
,	@nUserId_ int
,	@szFlat_ varchar(10)
,	@nFlat_ int
,	@szName_ varchar(50)

while 1=1
begin
	select top(1) @szLine_ = Line, @nId_ = Id from #tline where Data = 1 and id > @nId_
	order by id
	if @@rowcount =0
		break

	insert #tUser(UserId, name, houseid, flat, Fraction, Apartment)
	select UserId, name, @nHouseId_, flat, Fraction, Apartment
	from dbo.fParseUserFlat(@szLine_)

end
if @debug <> 0
	select *From #tUser
--select @nHouseId_ as HouseId


--select * from #tUser

if @debug = 0
	insert tUser (userid, name, houseid, Flat, Fraction, Apartment)
	select T.UserId, T.name, T.houseid, T.flat, T.Fraction, T.Apartment
	from #tUser T
	left join tUser U on T.houseid = U.houseid and U.flat = T.flat and U.Apartment = T.Apartment and U.name = T.name
	where U.id is null
	order by T.flat

if @debug = 1
begin
	select *
	from #tUser T
	left join tUser U on T.houseid = U.houseid and U.flat = T.flat and U.Apartment = T.Apartment and U.name = T.name
	where U.id is null
	order by T.flat

	select *
	from tUser U
	left join #tUser T on T.houseid = U.houseid and U.flat = T.flat and U.Apartment = T.Apartment and U.name = T.name
	where T.UserId is null and U.houseid = @nHouseId_
	order by T.flat
end
end
