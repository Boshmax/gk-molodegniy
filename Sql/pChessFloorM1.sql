:r ../_sqlinc/create_proc.sqlinc
/*
$Date: 15.09.2014 13:24:20 $
$Source: Git\gk-molodegniy\Sql\pChessFloorM1.sql $

Назначение:

Пример вызова:
*/

alter procedure $(_SCHEMA).$(_OBJECT)
as
begin
print '[b]Молодежный I[/b]'
print ''
exec pChessFloorSM1
	@nHouse = 1
,	@nUnit = 1
print ''
exec pListTenant
	@nHouse = 1

print '[/spoiler]'
print 'Для добавления указываем Этаж, Квартиру'


end
