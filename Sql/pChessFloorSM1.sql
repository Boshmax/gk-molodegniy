USE [molodej]
GO
/****** Object:  StoredProcedure [dbo].[pChessFloorSM1]    Script Date: 09/15/2014 09:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[pChessFloorSM1]
	@nHouse int = 1
,	@nUnit int = 1
,	@bitStr BIT = 1 
as

declare @nFloors_ int
,	@nFlatInFloor_ int 
,	@nStartFlat_ int = 0 
,	@nUnitFlat_ int = 0
,	@nRealFlatInFloor_ int 

select @nStartFlat_ = isnull(SUM(flatinfloor),0) from tfloor where houseid = @nHouse and unit < @nUnit

select @nFloors_ = Floors
,	@nFlatInFloor_ = FlatInFloor
from tHouse where House = @nHouse

declare @nFlatInFloorId_ int = 1
,	@nFloorsId_ int = @nFloors_
,	@nFlatId_ int
,	@szUser_ varchar(250)
,	@nUserId_ int
,	@abbr_ varchar(5)
,	@szUrlMap_ varchar(250)
,	@bitFraction_ BIT = 0

print '
[table layout=fixed width='+cast((@nFlatInFloor_ * 33+30) as varchar(30))+'px]
[tr]
[td width=30px bgcolor=#84A577][color=white]Этаж[/color][/td]
[td colspan='+isnull(cast(@nFlatInFloor_ as varchar(20)),'')+' bgcolor=#84A577][align=center][color=white]Номер на площадке[/color][/align][/td]
[/tr]'
print '[tr]'
print '[td] # [/td]'
set @nFlatInFloorId_ = 1
while @nFlatInFloorId_ <= @nFlatInFloor_
begin
print '[td]' + isnull(cast(@nFlatInFloorId_ as varchar(20)),'')+ '[/td]'

set @nFlatInFloorId_ = @nFlatInFloorId_ + 1
end
print '[/tr]'

while @nFloorsId_ > 0
begin
	print '[tr]'
	
	select @nUnitFlat_ = isnull(SUM(flatinfloor),0) 
	from tfloor 
	where houseid = @nHouse and unit = @nUnit and floorNum < @nFloorsId_

	select @nRealFlatInFloor_ =  flatinfloor
	,	@szUrlMap_ = urlMap
	from tfloor 
	where houseid = @nHouse and Unit = @nUnit and floorNum = @nFloorsId_

	set @nFlatInFloorId_ = 1
	if @szUrlMap_ <> ''
		print '[td][url='+isnull(@szUrlMap_,'')+']' + isnull(cast(@nFloorsId_ as varchar(20)),'')+ '[/url][/td]'
	else
		print '[td]'+isnull(cast(@nFloorsId_ as varchar(20)),'')+ '[/td]'

	while @nFlatInFloorId_ <= @nFlatInFloor_
	begin
		set @nFlatId_ = 0
		select @nFlatId_ = @nStartFlat_	+ @nUnitFlat_ + @nFlatInFloorId_
		
		if @nFloorsId_ = 1
			set @nFlatId_ = 0
		if @nRealFlatInFloor_ >= @nFlatInFloorId_
		begin
			if exists(select * from tUser where flat = @nFlatId_ and Houseid = @nHouse and isDisable = 0  and Apartment = 0)
			begin
				set @nUserId_ = 0 
				set @szUser_ = ''
				set @abbr_ = cast(@nFlatId_ as varchar(20))
				while 1 = 1
				begin 
					SELECT top 1 @nUserId_ = Id FROM tUser WHERE Id > @nUserId_ and houseid = @nHouse and flat = @nFlatId_ and isDisable = 0 and ((Fraction = 0 and @bitStr = 1) or (Fraction in(0,1) and @bitStr = 0)) and Apartment = 0 Order by Id
					IF @@ROWCOUNT = 0
						BREAK
					
					select @szUser_ = @szUser_ + 
						case when userid IS not null 
							then '[abbr="'+name+'"][url=http://gk-molodegniy.ru/profile.php?id='+cast(userid as varchar(20))+']'+@abbr_+'[/url][/abbr] ' 
						else '[abbr="'+name+'"]'+@abbr_+'[/abbr] '
						end
					from tUser 
					where flat = @nFlatId_ and ID = @nUserId_ and houseid = @nHouse  and Apartment = 0
					set @abbr_ = ' *' 
				end
				set @nUserId_ = 0 
				set @abbr_ = ' a'
				if @bitStr = 1
				begin
					while 1 = 1
					begin 
						SELECT top 1 @nUserId_ = Id FROM tUser WHERE Id > @nUserId_ and houseid = @nHouse and flat = @nFlatId_ and isDisable = 0 and Fraction = 1 and Apartment = 0 Order by Id
						IF @@ROWCOUNT = 0
							BREAK
						
						select @szUser_ = @szUser_ + 
							case when userid IS not null 
								then '[abbr="'+name+'"][url=http://gk-molodegniy.ru/profile.php?id='+cast(userid as varchar(20))+']'+@abbr_+'[/url][/abbr] ' 
							else '[abbr="'+name+'"]'+@abbr_+'[/abbr] '
							end
						,	@bitFraction_ = Fraction
						from tUser 
						where flat = @nFlatId_ and ID = @nUserId_ and houseid = @nHouse and Apartment = 0
						set @abbr_ = ' *'
					end
				end
				print '[td]' + @szUser_ + '[/td]'
			end
			else
				print '[td][color=#F4FADB]' + isnull(cast(@nFlatId_ as varchar(20)),'')+ '[/color][/td]'
		end
		else
		begin
			if @nFloorsId_ = 1
				print '[td][color=#F4FADB]' + isnull(cast(0 as varchar(20)),'')+ '[/color][/td]'
			else
				print '[td]X[/td]'
		end
		set @nFlatInFloorId_ = @nFlatInFloorId_ + 1
	end
	set @nFloorsId_ = @nFloorsId_ - 1
	print '[/tr]'
end
print '[/table]'



