/****** Object:  StoredProcedure [dbo].[CorrectM2]    Script Date: 09/15/2014 09:28:57 ******/
set ANSI_NULLS on
go
set QUOTED_IDENTIFIER on
go


--AS

begin


update F
set F.FlatStr = F.Flat
from dbo.tUser F
where F.HouseId = 4 and F.FlatStr is null

update F
set F.Flat = FlatStr-2
from tUser F
where F.HouseId = 4

update F
set F.Flat = FlatStr
from tUser F
where F.HouseId = 4 and FlatStr in(1, 2, 3, 4)

select * from tUser
where HouseId = 4


end
