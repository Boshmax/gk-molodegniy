﻿:r ../_sqlinc/create_proc.sqlinc
/*
$Date: 15.09.2014 13:31:22 $
$Source: Git\gk-molodegniy\Sql\pChessFloorM2.sql $

Назначение:

Пример вызова:
*/

alter procedure $(_SCHEMA).$(_OBJECT)
as
begin
print '[b]Молодежный II[/b]'
print ''
print '[b]Секция 1[/b]'
print ''
exec pChessFloorSM2
	@nHouse = 2
,	@nUnit = 1
print ''
print '[b]Секция 2[/b]'
print ''
exec pChessFloorSM2
	@nHouse = 2
,	@nUnit = 2
print ''
print '[b]Секция 3[/b]'
print ''
exec pChessFloorSM2
	@nHouse = 2
,	@nUnit = 3
print ''
print ''
exec pListTenant
	@nHouse = 2

print '[/spoiler]'
print 'Для добавления указываем Секцию, Этаж, Квартиру'


end
