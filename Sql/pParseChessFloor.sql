/****** Object:  StoredProcedure [dbo].[pParseChessFloor]    Script Date: 09/15/2014 09:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER Procedure [dbo].[pParseChessFloor]
	@strString VARCHAR(MAX)
,	@debug Bit = 0
AS
BEGIN
declare @szDelimiter_ VARCHAR(50)
set @szDelimiter_ = CHAR(13)+CHAR(10)


create table #tline (id int, Line VARCHAR(1000), Data Bit)

insert #tline(id,Line, Data)
select Id, Line ,0 
from [dbo].[fStr2LineTable](@szDelimiter_, @strString)

create table #tUser (
	UserId int
,	name VARCHAR(50)
,	houseid int
,	flat INT
,	Fraction BIT
,	Apartment BIT
)

DECLARE @szHouse_ VARCHAR(100)
,	@nHouseId_ INT

select @szHouse_ = Line from #tline where Line like '[[]b]Молодежный %[[]/b]'
IF @@ROWCOUNT =0
BEGIN
	RAISERROR('Не удалось определить Дом, поданы не правильные данные', 16, 10);
	RETURN -1;
END

IF @szHouse_ = '[b]Молодежный I[/b]'
	SET @nHouseId_ = 1
IF @szHouse_ = '[b]Молодежный II[/b]'
	SET @nHouseId_ = 2
IF @szHouse_ = '[b]Молодежный III[/b]'
	SET @nHouseId_ = 3

IF @nHouseId_ IS NULL
BEGIN
	RAISERROR('Не удалось определить Дом', 16, 10);
	RETURN -1;
END

update #tline
set Data = 1
where line like '%[abbr="%"]%[/abbr]%'

DECLARE @nId_ INT = 0
,	@szLine_ VARCHAR(1000)
,	@nUserId_ INT
,	@szFlat_ VARCHAR(10)
,	@nFlat_ INT
,	@szName_ VARCHAR(50)

WHILE 1=1
BEGIN
	SELECT top(1) @szLine_ = Line,@nId_ = Id FROM #tline WHERE Data = 1 AND id > @nId_
	order by id
	IF @@ROWCOUNT =0
		BREAK

	insert #tUser(UserId,name,houseid,flat,Fraction, Apartment)
	SELECT UserId,name,@nHouseId_,flat,Fraction, Apartment
	FROM dbo.fParseUserFlat(@szLine_)
	
END

--select @nHouseId_ AS HouseId


--select * from #tUser

if @debug = 0
	insert tUser (userid,name,houseid,Flat,Fraction, Apartment)
	select T.UserId,T.name,T.houseid,T.flat, T.Fraction, T.Apartment
	FRom #tUser T
	left join tUser U ON T.houseid = U.houseid and U.flat = T.flat and U.Apartment = T.Apartment and U.name = T.name
	where U.id is null
	order by T.flat

if @debug = 1
begin
	select *
	FRom #tUser T
	left join tUser U ON T.houseid = U.houseid and U.flat = T.flat and U.Apartment = T.Apartment and U.name = T.name
	where U.id is null
	order by T.flat
	
	select *
	FRom tUser U
	left join #tUser T ON T.houseid = U.houseid and U.flat = T.flat and U.Apartment = T.Apartment and U.name = T.name
	where T.UserId is null and U.houseid = @nHouseId_
	order by T.flat
end
END
