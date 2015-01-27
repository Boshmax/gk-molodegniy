:r ../_sqlinc/create_proc.sqlinc
/*
$Date: 27.01.2015 13:41:23 $
$Source: Git\gk-molodegniy\Sql\pChessFloorM4_2.sql $

Назначение:

Пример вызова:
*/


alter procedure $(_SCHEMA).$(_OBJECT)
as
begin
print '[b]Молодежный IV[/b]'
print ''
print '[b]Секция 3[/b]'
print ''
exec pChessFloorSM1
	@nHouse = 4
,	@nUnit = 3
print ''
print '[b]Секция 4[/b]'
print ''
exec pChessFloorSM1
	@nHouse = 4
,	@nUnit = 4
print ''
print ''
exec pListTenant
	@nHouse = 4

print '[/spoiler]'
print 'Для добавления указываем Секцию, Этаж, Квартиру'


end
