:r ../_sqlinc/create_proc.sqlinc
/*
$Date: 27.01.2015 13:42:09 $
$Source: Git\gk-molodegniy\Sql\pChessFloorM4.sql $

Назначение:

Пример вызова:
*/


alter procedure $(_SCHEMA).$(_OBJECT)
as
begin
print '[b]Молодежный IV[/b]'
print ''
print '[b]Секция 1[/b]'
print ''
exec pChessFloorSM1
	@nHouse = 4
,	@nUnit = 1
print ''
print '[b]Секция 2[/b]'
print ''
exec pChessFloorSM1
	@nHouse = 4
,	@nUnit = 2



end
