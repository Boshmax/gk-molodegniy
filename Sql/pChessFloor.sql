/****** Object:  StoredProcedure [dbo].[pChessFloor]    Script Date: 09/15/2014 09:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[pChessFloor]
	@nHouse int = 1
,	@nUnit int = 1
as

declare @nFloors_ int
,	@nFlatInFloor_ int 



select @nFloors_ = Floors
,	@nFlatInFloor_ = FlatInFloor
from tHouse where House = @nHouse

declare @nFlatInFloorId_ int = 1
,	@nFloorsId_ int = @nFloors_
,	@nFlatId_ int
,	@szUser_ varchar(250)
,	@nUserId_ int
,	@abbr_ varchar(5)

print '
[table layout=fixed width=330px]
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
	set @nFlatInFloorId_ = 1
	print '[td]' + isnull(cast(@nFloorsId_ as varchar(20)),'')+ '[/td]'
	while @nFlatInFloorId_ <= @nFlatInFloor_
	begin
		set @nFlatId_ = 0
		select @nFlatId_ = id from tdigit 
		where ID = (@nUnit-1) * (@nFloors_ - 1) * @nFlatInFloor_ 
			+ (@nFloorsId_ - 2) * @nFlatInFloor_ + @nFlatInFloorId_
		
		if @nFloorsId_ = 1
			set @nFlatId_ = 0
		
		if exists(select * from tUser where flat = @nFlatId_ and Houseid = @nHouse )
		begin
			set @nUserId_ = 0 
			set @szUser_ = ''
			set @abbr_ = cast(@nFlatId_ as varchar(20))
			while 1 = 1
			begin 
				SELECT top 1 @nUserId_ = Id  FROM tUser WHERE Id > @nUserId_ and flat = @nFlatId_ Order by Id
				IF @@ROWCOUNT = 0
					BREAK
				
				select @szUser_ = @szUser_ + '[url=http://gk-molodegniy.ru/profile.php?id='+cast(userid as varchar(20))+'][abbr="'+name+'"]'+@abbr_+'[/abbr][/url]' 
				from tUser 
				where flat = @nFlatId_ and ID = @nUserId_
				set @abbr_ = ' *'
			end
			print '[td]' + @szUser_ + '[/td]'
		end
		else
			print '[td][color=#F4FADB]' + isnull(cast(@nFlatId_ as varchar(20)),'')+ '[/color][/td]'

		set @nFlatInFloorId_ = @nFlatInFloorId_ + 1
	end
	set @nFloorsId_ = @nFloorsId_ - 1
	print '[/tr]'
end
print '[/table]'
