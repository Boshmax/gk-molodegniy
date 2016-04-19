--:r ../_sqlinc/create_proc.sqlinc
/*
$Date: 19.04.2016 13:51:27 $
$Source: Git\gk-molodegniy\Sql\pChessFloorSM1.sql $

Назначение:

Пример вызова:
*/

alter procedure $(_SCHEMA).$(_OBJECT)
	@nHouse int
,	@nUnit int

as
declare
	@nMaxFlatInFloor_ int --макимальное количество пемещений на площадке
,	@nStartFlat_ int	--начало нумерации в данной секции
,	@nStartApartment_ int --начало нумерации в данной секции
,	@nFloors_ int         --количество этажей

,	@nUnitFlat_ int = 0          --количество квартир до этой площадки
,	@nFlatInFloor_ int = 0       --количество квартир на этой площадки
,	@nUnitApartment_ int = 0     --количество апартаментов до этой площадки
,	@nApartmentInFloor_ int = 0  --количество апартаментов на этой площадки

,	@nFloorsId_ int		  --Этаж
,	@nFlatInFloorId_ int  --Помещение на этаже
,	@nFlatId_ int         --Квартира
,	@nApartmentId_ int    --Апартамент


,	@nFlatGroup_ int      --Объединение квартиры
,	@isApartament_ bit    --Признак апартамента

declare
	@szUrlMap_ varchar(250)
,	@szFlatNum_ varchar(10)
,	@szText_ varchar(250)
,	@szColspan_ varchar(20) = ''
,	@szUser_ varchar(250)
,	@nId_ int
,	@abbr_ varchar(5)
/*

declare
	@nRealFlatInFloor_ int
,	@nRealApartmentInFloor_ int
,	@nApartmentId_ int


declare @nApartmentInFloorId_ int = 1
,	@nFlatId_ int

,	@abbr_ varchar(5)
,	@szUrlMap_ varchar(250)
,	@bitFraction_ bit = 0

*/

--начало нумерации в данной секции
select @nStartFlat_ = isnull(sum(isnull(FlatInFloor, 0)), 0) from dbo.tFloor where HouseId = @nHouse and Unit < @nUnit
select @nStartApartment_ = isnull(sum(isnull(ApartmentInFloor, 0)), 0) from dbo.tFloor where HouseId = @nHouse and Unit < @nUnit

select @nStartApartment_ = @nStartApartment_  + StartApartamentNum - 1
from dbo.tHouse where Id = @nHouse

--получаем колличество этажей
select @nFloors_ = Floors
from dbo.tHouse where House = @nHouse

--получаем максимальное колличество помещений на площадке
select @nMaxFlatInFloor_ =  max(isnull(FlatInFloor, 0) + isnull(ApartmentInFloor, 0))
from dbo.tFloor where HouseId = @nHouse and Unit = @nUnit


print '
[table layout=fixed width='+cast((@nMaxFlatInFloor_ * 33+30) as varchar(30))+'px]
[tr]
[td width=30px bgcolor=#84A577][color=white]Этаж[/color][/td]
[td colspan='+isnull(cast(@nMaxFlatInFloor_ as varchar(20)),'')+' bgcolor=#84A577][align=center][color=white]Номер на площадке[/color][/align][/td]
[/tr]'
print '[tr]'
print '[td] # [/td]'

set @nFlatInFloorId_ = 1
--заголовок таблицы с номерами
while @nFlatInFloorId_ <= @nMaxFlatInFloor_
begin
	print '[td]' + isnull(cast(@nFlatInFloorId_ as varchar(20)),'')+ '[/td]'

	set @nFlatInFloorId_ = @nFlatInFloorId_ + 1
end
print '[/tr]'

set @nFloorsId_ = @nFloors_

--основная таблица
--Поэтажный цикл
while @nFloorsId_ > 0
begin
	print '[tr]'

	--количество квартир до этой площадки в данной секции
	select @nUnitFlat_ = isnull(sum(isnull(FlatInFloor, 0)), 0)
	,	@nUnitApartment_ = isnull(sum(isnull(ApartmentInFloor, 0)), 0)
	from dbo.tFloor
	where HouseId = @nHouse and Unit = @nUnit and FloorNum < @nFloorsId_

	--количество квартир на данной площадке
	select @nFlatInFloor_ =  FlatInFloor
	,	@nApartmentInFloor_ = ApartmentInFloor
	,	@szUrlMap_ = UrlMap
	from dbo.tFloor
	where HouseId = @nHouse and Unit = @nUnit and FloorNum = @nFloorsId_

	--построение столбца таблицы с порядковыми номерами
	if @szUrlMap_ <> ''
		print '[td][url='+isnull(@szUrlMap_,'')+']' + isnull(cast(@nFloorsId_ as varchar(20)),'')+ '[/url][/td]'
	else
		print '[td]'+isnull(cast(@nFloorsId_ as varchar(20)),'')+ '[/td]'

	select @nFlatId_ = @nStartFlat_ + @nUnitFlat_
	select @nApartmentId_ = @nStartApartment_ + @nUnitApartment_

	--Внутриэтажный цикл
	set @nFlatInFloorId_ = 1
	while @nFlatInFloorId_ <= @nMaxFlatInFloor_
	begin
		set @isApartament_ = 0
		set @nFlatGroup_ = 0
		set @szColspan_ = ''

		select @isApartament_ = isnull(Apartament, 0)
		,	@nFlatGroup_ = FlatGroup
		from dbo.tFlatDetail where Houseid = @nHouse and Unit = @nUnit and [Floor] = @nFloorsId_ and FlatInFloor = @nFlatInFloorId_

		if @isApartament_ = 1
		begin
			set @nApartmentId_ = @nApartmentId_ + 1
			if @nHouse = 1
				set @szFlatNum_ = 'A'+ cast(@nApartmentId_ as varchar(10))
			else
				set @szFlatNum_ = 'A'+ cast(@nFlatId_ as varchar(10))
		end
		else
		begin
			set @nFlatId_ = @nFlatId_ + 1
			set @szFlatNum_ = @nFlatId_
		end

		if @nFlatGroup_ > 1
		begin
			set @szColspan_ = ' colspan='+cast(@nFlatGroup_ as varchar(10))+''
			set @nFlatInFloorId_ = @nFlatInFloorId_ + @nFlatGroup_ - 1
		end

		if @nFloorsId_ = 1
		begin
			set @szFlatNum_ = ''
			set @szUser_ = ''
			print '[td'+ @szColspan_ + '][align=center]' + @szUser_ + '[/align][/td]'
		end
		else
		begin
			if exists(select 1 from dbo.tUser
					where HouseId = @nHouse  and IsDisable = 0 and Apartment = @isApartament_
					and ((@isApartament_ = 1 and Flat = @nApartmentId_ and @nHouse = 1) or (@isApartament_ = 0 and Flat = @nFlatId_)
						or (@isApartament_ = 1 and Flat = @nFlatId_ and @nHouse = 3))
				)
			begin
				set @nId_ = 0
				set @szUser_ = ''
				if @isApartament_ = 1
					if @nHouse = 1
					begin
						set @abbr_ = 'A'+ cast(@nApartmentId_ as varchar(20))
					end
					else
					begin
						set @abbr_ = 'A'+ cast(@nFlatId_ as varchar(20))
					end
				else
					set @abbr_ = cast(@nFlatId_ as varchar(20))
				while 1 = 1
				begin
					select top 1 @nId_ = Id
					from dbo.tUser
					where Id > @nId_ and HouseId = @nHouse  and IsDisable = 0 and Apartment = @isApartament_
					and ((@isApartament_ = 1 and Flat = @nApartmentId_ and @nHouse = 1) or (@isApartament_ = 0 and Flat = @nFlatId_)
						or (@isApartament_ = 1 and Flat = @nFlatId_ and @nHouse = 3))
					--and ((Fraction = 0 and @bitStr = 1) or (Fraction in(0, 1) and @bitStr = 0)) and Apartment = 0
					order by Id
						if @@rowcount = 0
							break

					select @szUser_ = @szUser_ +
							case when UserId is not null
								then '[abbr="'+Name+'"][url=http://gk-molodegniy.ru/profile.php?id='+cast(UserId as varchar(20))+']'+
								case Fraction when 1 then replace(@abbr_, ' *', '') + ' а' else @abbr_ end
								+'[/url][/abbr] '
							else '[abbr="'+Name+'"]'+case Fraction when 1 then replace(@abbr_, ' *', '') + ' а' else @abbr_ end+'[/abbr] '
							end
					from dbo.tUser
					where Id = @nId_

					set @abbr_ = ' *'
				end
				print '[td'+ @szColspan_ + '][align=center]' + @szUser_ + '[/align][/td]'
				set @szUser_ = ''
			end
			else
			begin
				print '[td'+ @szColspan_ + '][align=center][color=#F4FADB]' + @szFlatNum_+ '[/color][/align][/td]'
				set @szFlatNum_ = ''
			end
		end

/*




		if @nRealFlatInFloor_ >= @nFlatInFloorId_
		begin
			select * from dbo.tFlatDetail where Houseid = @nHouse and [Floor] = @nFloorsId_ and



			if exists(select 1 from dbo.tUser where Flat = @nFlatId_ and Houseid = @nHouse and IsDisable = 0  and Apartment = 0)
			begin
				set @nUserId_ = 0
				set @szUser_ = ''
				set @abbr_ = cast(@nFlatId_ as varchar(20))
				while 1 = 1
				begin
					select top 1 @nUserId_ = Id from dbo.tUser where Id > @nUserId_ and HouseId = @nHouse and Flat = @nFlatId_ and IsDisable = 0 and ((Fraction = 0 and @bitStr = 1) or (Fraction in(0, 1) and @bitStr = 0)) and Apartment = 0 order by Id
					if @@rowcount = 0
						break

					select @szUser_ = @szUser_ +
						case when UserId is not null
							then '[abbr="'+Name+'"][url=http://gk-molodegniy.ru/profile.php?id='+cast(UserId as varchar(20))+']'+@abbr_+'[/url][/abbr] '
						else '[abbr="'+Name+'"]'+@abbr_+'[/abbr] '
						end
					from dbo.tUser
					where Flat = @nFlatId_ and Id = @nUserId_ and HouseId = @nHouse and Apartment = 0
					set @abbr_ = ' *'
				end
				set @nUserId_ = 0
				set @abbr_ = ' a'
				if @bitStr = 1
				begin
					while 1 = 1
					begin
						select top 1 @nUserId_ = Id from dbo.tUser where Id > @nUserId_ and HouseId = @nHouse and Flat = @nFlatId_ and IsDisable = 0 and Fraction = 1 and Apartment = 0 order by Id
						if @@rowcount = 0
							break

						select @szUser_ = @szUser_ +
							case when UserId is not null
								then '[abbr="'+Name+'"][url=http://gk-molodegniy.ru/profile.php?id='+cast(UserId as varchar(20))+']'+@abbr_+'[/url][/abbr] '
							else '[abbr="'+Name+'"]'+@abbr_+'[/abbr] '
							end
						,	@bitFraction_ = Fraction
						from dbo.tUser
						where Flat = @nFlatId_ and Id = @nUserId_ and HouseId = @nHouse and Apartment = 0
						set @abbr_ = ' *'
					end
				end
				print '[td]' + @szUser_ + '[/td]'
			end
			else
			*/

				/*
		end
		else
		begin
			if @nFloorsId_ = 1
				print '[td][color=#F4FADB]' + isnull(cast(0 as varchar(20)),'')+ '[/color][/td]'
			else
				print '[td]X[/td]'
		end
		*/
		set @nFlatInFloorId_ = @nFlatInFloorId_ + 1
	end
	set @nFloorsId_ = @nFloorsId_ - 1
	print '[/tr]'
end
print '[/table]'
go

