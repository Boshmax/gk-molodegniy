
/****** Object:  UserDefinedFunction [dbo].[fParseUserFlat]    Script Date: 09/15/2014 09:34:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[fParseUserFlat]( @szLine VARCHAR(max)
)
RETURNS @tUser table (
	UserId int
,	name VARCHAR(50)
,	Flat INT
,	Fraction BIT
,	Apartment BIT
)
AS
BEGIN

DECLARE @nId_ INT = 0
,	@szSubLine_ VARCHAR(1000)
,	@nUserId_ INT
,	@szFlat_ VARCHAR(10)
,	@nFlat_ INT
,	@szName_ VARCHAR(50)
,	@nStart_ int = 0
,	@nFinish_ int = 0
,	@nSubStart_ int = 0
,	@nSubFinish_ int = 0
,	@nFraction_ Bit = 0
,	@nApartment_ Bit = 0

--DECLARE @tUser table (
--	UserId int
--,	name VARCHAR(50)
--,	Flat INT
--,	Fraction BIT)

WHILE 1=1
BEGIN
	
	SET @nStart_ = CHARINDEX  ( '[abbr' , @szLine , @nFinish_+ 1)
	SET @nFinish_ = CHARINDEX  ( '[/abbr]' , @szLine ,@nFinish_ +1)

	IF @nStart_ = 0
		BREAK
		
	
	SET	@nSubStart_ = 0
	SET	@nSubFinish_ = 0
	SET @szSubLine_ = SUBSTRING (@szLine, @nStart_, @nFinish_- @nStart_)


	SET @nSubStart_ = CHARINDEX( '[abbr="' , @szSubLine_)
	SET @nSubFinish_ = CHARINDEX( '"]' , @szSubLine_)
	
	set @szName_ = SUBSTRING (@szSubLine_,@nSubStart_+7,@nSubFinish_-@nSubStart_-7)
	

	SET @szSubLine_ = SUBSTRING(@szSubLine_, @nSubFinish_+2, 1000)
	SET	@nSubStart_ = 0
	SET	@nSubFinish_ = 0
	
	SET @nSubStart_ = CHARINDEX( '[url=http://gk-molodegniy.ru/profile.php?id=' , @szSubLine_)
	SET @nSubFinish_ = CHARINDEX( ']' , @szSubLine_)

	IF @nSubStart_<> 0
		set @nUserId_ = SUBSTRING(@szSubLine_,@nSubStart_+44,@nSubFinish_-@nSubStart_-44)
	ELSE 
		set @nSubFinish_ = -1

	SET @szSubLine_ = SUBSTRING(@szSubLine_, @nSubFinish_+1, 1000)
	SET	@nSubStart_ = 0
	SET	@nSubFinish_ = 0
	
	SET @nSubFinish_ = CHARINDEX( '[/url]' , @szSubLine_)
	IF @nSubFinish_ = 0
		SET @nSubFinish_ = LEN(@szSubLine_)+1
	set @szFlat_ = SUBSTRING(@szSubLine_,@nSubStart_,@nSubFinish_-@nSubStart_)

	
	IF ISNUMERIC(@szFlat_)= 1
		SET @nFlat_ = CAST(@szFlat_ AS INT)
	--IF @szFlat_ = '*'
	--номер остается
	IF @szFlat_ = 'a'
		set @nFraction_ = 1
	IF @szFlat_ like '[АA][0-9]%'
	begin 
		set @nApartment_ = 1
		set @szFlat_ = REPLACE (REPLACE (@szFlat_, 'A',''), 'А','')
		IF ISNUMERIC(@szFlat_)= 1
			SET @nFlat_ = CAST(@szFlat_ AS INT)
	end
	INSERT @tUser(UserId, name, Flat, Fraction, Apartment)
	select @nUserId_,@szName_, @nFlat_,@nFraction_, @nApartment_
	
END
	RETURN
END
