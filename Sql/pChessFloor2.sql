use molodej
go

alter procedure pChessFloor2
	@nHouse int = 1
,	@nUnit int = 1
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
			if exists(select * from tUser where flat = @nFlatId_ and Houseid = @nHouse and isDisable = 0)
			begin
				set @nUserId_ = 0 
				set @szUser_ = ''
				set @abbr_ = cast(@nFlatId_ as varchar(20))
				while 1 = 1
				begin 
					SELECT top 1 @nUserId_ = Id FROM tUser WHERE Id > @nUserId_ and houseid = @nHouse and flat = @nFlatId_ and isDisable = 0 Order by Id
					IF @@ROWCOUNT = 0
						BREAK
					
					select @szUser_ = @szUser_ + 
						case when userid IS not null 
							then '[abbr="'+name+'"][url=http://gk-molodegniy.ru/profile.php?id='+cast(userid as varchar(20))+']'+@abbr_+'[/url][/abbr] ' 
						else '[abbr="'+name+'"]'+@abbr_+'[/abbr] '
						end
					from tUser 
					where flat = @nFlatId_ and ID = @nUserId_ and houseid = @nHouse
					set @abbr_ = ' *'
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



go
print '[b]Молодежный I[/b]'
print ''
exec pChessFloor2 1,1
print ''
print '[spoiler="Список жильцов"]'
declare @nchar varchar(8000)=''
select @nchar = @nchar+name +' (№ '+ cast(flat as varchar(5))+')'+ char(13) 
from tUser
where houseid = 1 and isDisable = 0
order by name
print @nchar

print '[/spoiler]'
print 'Для добавления указываем Этаж, Квартиру'
/*
print '[b]Молодежный II[/b]'
print ''
print '[b]Секция 1[/b]'
print ''
exec pChessFloor2 2,1
print ''
print '[b]Секция 2[/b]'
print ''
exec pChessFloor2 2,2
print ''
print '[b]Секция 3[/b]'
print ''
exec pChessFloor2 2,3
print ''
print '[spoiler="Список жильцов"]'
declare @nchar varchar(8000)=''
select @nchar = @nchar+name +' (№ '+ cast(flat as varchar(5))+')'+ char(13) 
from tUser
where houseid = 2 and isDisable = 0
order by name
print @nchar

print '[/spoiler]'
print 'Для добавления указываем Секцию, Этаж, Квартиру'

go
*/
/*
print '[b]Молодежный III[/b]'
print ''
print '[b]Секция 1[/b]'
print ''
exec pChessFloor2 3,1
print ''
print '[b]Секция 2[/b]'
print ''
exec pChessFloor2 3,2
print ''
print '[b]Секция 3[/b]'
print ''
exec pChessFloor2 3,3
print ''
print '[spoiler="Список жильцов"]'
declare @nchar varchar(8000)=''
select @nchar = @nchar+name +' (№ '+ cast(flat as varchar(5))+')'+ char(13) 
from tUser
where houseid = 3 and isDisable = 0
order by name
print @nchar

print '[/spoiler]'
print 'Для добавления указываем Секцию, Этаж, Квартиру'

go
*/