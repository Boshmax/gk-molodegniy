
/****** Object:  StoredProcedure [dbo].[pChessFloorM1]    Script Date: 09/15/2014 09:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[pChessFloorM1]
AS
BEGIN
print '[b]Молодежный I[/b]'
print ''
exec pChessFloorSM1 
	@nHouse = 1
,	@nUnit = 1
,	@bitStr = 0
print ''
exec pListTenant
	@nHouse = 1

print '[/spoiler]'
print 'Для добавления указываем Этаж, Квартиру'


END
