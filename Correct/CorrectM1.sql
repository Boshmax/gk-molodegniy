
/****** Object:  StoredProcedure [dbo].[CorrectM1]    Script Date: 09/15/2014 09:28:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER procedure [dbo].[CorrectM1]
AS
BEGIN

update tfloor 
set FlatinFloor = 0
where houseid = 1
and FloorNum in (1)


update tfloor 
set FlatinFloor = 12
where houseid = 1
and FloorNum not in (1,2,3)

update tfloor 
set FlatinFloor = 8
where houseid = 1
and FloorNum in(2,3)

update tuser 
set flat = 1
where houseid = 1
and flatstr = 3 and Apartment = 1

update tuser 
set flat = 4
where houseid = 1
and flatstr = 14 and Apartment = 1


--2 этаж
update tuser
set flat = flatstr-3
where houseid = 1 and flatstr in (6,7,8,9,10,11)
and flatstr is not null and Apartment = 0

--3 этаж
update tuser
set flat = flatstr-3
where houseid = 1 and flatstr in (12,13)
and flatstr is not null and Apartment = 0

update tuser
set flat = flatstr-6
where houseid = 1 and flatstr in (17,18,19,20,21,22)
and flatstr is not null and Apartment = 0



--4,5,6,7,8,9 этаж
update tuser
set flat = flatstr-6
where houseid = 1 and (flatstr >= 23 and flatstr < 95)
and flatstr is not null and Apartment = 0


--10 этаж
update tuser
set flat = flatstr-5
where houseid = 1 and (flatstr > 98 OR (flatstr = 98 and Fraction = 1))
and flatstr is not null and Apartment = 0

--11 этаж
update tuser
set flat = flatstr-4
where houseid = 1 and (flatstr > 109 OR (flatstr = 109 and Fraction = 1))
and flatstr is not null and Apartment = 0

--12 этаж
update tuser
set flat = flatstr-3
where houseid = 1 and (flatstr > 120 OR (flatstr = 120 and Fraction = 1))
and flatstr is not null and Apartment = 0

--13 этаж
update tuser
set flat = flatstr-2
where houseid = 1 and (flatstr > 131 OR (flatstr = 131 and Fraction = 1))
and flatstr is not null and Apartment = 0

--14 этаж
update tuser
set flat = flatstr-1
where houseid = 1 and (flatstr > 142 OR (flatstr = 142 and Fraction = 1))
and flatstr is not null and Apartment = 0

--15 этаж
update tuser
set flat = flatstr
where houseid = 1 and (flatstr > 153 OR (flatstr = 153 and Fraction = 1))
and flatstr is not null and Apartment = 0

--16 этаж
update tuser
set flat = flatstr+1
where houseid = 1 and (flatstr > 164 OR (flatstr = 164 and Fraction = 1))
and flatstr is not null and Apartment = 0

--17 этаж
update tuser
set flat = flatstr+2
where houseid = 1 and (flatstr > 175 OR (flatstr = 175 and Fraction = 1))
and flatstr is not null and Apartment = 0

--18 этаж
update tuser
set flat = flatstr+3
where houseid = 1 and (flatstr > 186 OR (flatstr = 186 and Fraction = 1))
and flatstr is not null and Apartment = 0

--19 этаж
update tuser
set flat = flatstr+4
where houseid = 1 and (flatstr > 197 OR (flatstr = 197 and Fraction = 1))
and flatstr is not null and Apartment = 0

--20 этаж
update tuser
set flat = flatstr+5
where houseid = 1 and (flatstr > 208 OR (flatstr = 208 and Fraction = 1))
and flatstr is not null and Apartment = 0

end
