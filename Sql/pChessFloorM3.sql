:r ../_sqlinc/create_proc.sqlinc
/*
$Date: 15.09.2014 13:31:31 $
$Source: Git\gk-molodegniy\Sql\pChessFloorM3.sql $

Назначение:

Пример вызова:
*/


alter procedure $(_SCHEMA).$(_OBJECT)
as
begin
print '[b]Молодежный III[/b]'
print ''
print '[b]Секция 1[/b]'
print ''
exec pChessFloorSM1
	@nHouse = 3
,	@nUnit = 1
print ''
print '[b]Секция 2[/b]'
print ''
exec pChessFloorSM1
	@nHouse = 3
,	@nUnit = 2
print ''
print '[b]Секция 3[/b]'
print ''
exec pChessFloorSM1
	@nHouse = 3
,	@nUnit = 3
print ''
print ''
exec pListTenant
	@nHouse = 3

print '[/spoiler]'
print 'Для добавления указываем Секцию, Этаж, Квартиру'


end
