/****** Object:  StoredProcedure [dbo].[pListTenant]    Script Date: 09/15/2014 09:33:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[pListTenant]
@nHouse int
AS
BEGIN

print '[spoiler="Список жильцов"]'
declare @nchar varchar(8000)=''
select @nchar = @nchar+name +' (№ '+ cast(flat as varchar(5))+')'+ char(13) 
from tUser
where houseid = @nHouse and isDisable = 0
order by name
print @nchar

END
