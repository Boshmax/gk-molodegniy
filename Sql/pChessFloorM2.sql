/****** Object:  StoredProcedure [dbo].[pChessFloorM2]    Script Date: 09/15/2014 09:32:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[pChessFloorM2]
AS
BEGIN
print '[b]Молодежный II[/b]'
print ''
print '[b]Секция 1[/b]'
print ''
exec pChessFloor2 
	@nHouse = 2
,	@nUnit = 1
print ''
print '[b]Секция 2[/b]'
print ''
exec pChessFloor2 
	@nHouse = 2
,	@nUnit = 2
print ''
print '[b]Секция 3[/b]'
print ''
exec pChessFloor2 
	@nHouse = 2
,	@nUnit = 3
print ''
print ''
exec pListTenant
	@nHouse = 2

print '[/spoiler]'
print 'Для добавления указываем Секцию, Этаж, Квартиру'


END
