/****** Object:  StoredProcedure [dbo].[pChessFloorM3]    Script Date: 09/15/2014 09:32:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[pChessFloorM3]
AS
BEGIN
print '[b]Молодежный III[/b]'
print ''
print '[b]Секция 1[/b]'
print ''
exec pChessFloor2 
	@nHouse = 3
,	@nUnit = 1
print ''
print '[b]Секция 2[/b]'
print ''
exec pChessFloor2 
	@nHouse = 3
,	@nUnit = 2
print ''
print '[b]Секция 3[/b]'
print ''
exec pChessFloor2 
	@nHouse = 3
,	@nUnit = 3
print ''
print ''
exec pListTenant
	@nHouse = 3

print '[/spoiler]'
print 'Для добавления указываем Секцию, Этаж, Квартиру'


END
