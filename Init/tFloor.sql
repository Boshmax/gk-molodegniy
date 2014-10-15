/*
$Date: 15.09.2014 13:02:07 $
$Source: Git\gk-molodegniy\Init\tFloor.sql $

Назначение:

Пример вызова:
*/
set quoted_identifier on
go

if not exists (
	select 1 from information_schema.tables
		where table_schema = N'dbo' and table_name = N'tFloor'
)

	create table dbo.tFloor(
		FloorId int IDENTITY(1, 1) not null,
		FloorNum int null,
		HouseId int null,
		Unit int null,
		FlatInFloor int null,
		UrlMap varchar(200) null,
		InFlat bit null
	,	NewFlatInFloor int null
	,	ApartmentInFloor int not null default(0)
	) on [primary]

go

set quoted_identifier off
go

truncate table dbo.tFloor;
go

insert dbo.tFloor(FloorNum, HouseId, Unit, FlatinFloor, UrlMap, inFlat, NewFlatinFloor)
 			select		1,	1,	1,	0,	null,	0,	null
union	all	select		2,	1,	1,	8,	'http://s4.uploads.ru/GYzCB.png',	1,	null
union	all	select		3,	1,	1,	8,	'http://s4.uploads.ru/GYzCB.png',	1,	null
union	all	select		4,	1,	1,	12,	'http://s4.uploads.ru/6haKT.png',	1,	null
union	all	select		5,	1,	1,	12,	'http://s4.uploads.ru/6haKT.png',	1,	null
union	all	select		6,	1,	1,	12,	'http://s4.uploads.ru/6haKT.png',	1,	null
union	all	select		7,	1,	1,	12,	'http://s4.uploads.ru/6haKT.png',	1,	null
union	all	select		8,	1,	1,	12,	'http://s4.uploads.ru/6haKT.png',	1,	null
union	all	select		9,	1,	1,	12,	'http://s4.uploads.ru/6haKT.png',	1,	null
union	all	select		10,	1,	1,	12,	'http://s5.uploads.ru/E9DA7.png',	1,	null
union	all	select		11,	1,	1,	12,	'http://s5.uploads.ru/E9DA7.png',	1,	null
union	all	select		12,	1,	1,	12,	'http://s5.uploads.ru/E9DA7.png',	1,	null
union	all	select		13,	1,	1,	12,	'http://s5.uploads.ru/E9DA7.png',	1,	null
union	all	select		14,	1,	1,	12,	'http://s5.uploads.ru/JjBpX.png',	1,	null
union	all	select		15,	1,	1,	12,	'http://s5.uploads.ru/JjBpX.png',	1,	null
union	all	select		16,	1,	1,	12,	'http://s5.uploads.ru/JjBpX.png',	1,	null
union	all	select		17,	1,	1,	12,	'http://s5.uploads.ru/JjBpX.png',	1,	null
union	all	select		18,	1,	1,	12,	'http://s4.uploads.ru/x27rn.png',	1,	null
union	all	select		19,	1,	1,	12,	'http://s4.uploads.ru/x27rn.png',	1,	null
union	all	select		20,	1,	1,	12,	'http://s4.uploads.ru/x27rn.png',	1,	null

union	all	select		1,	2,	1,	0,	null,	0,	0
union	all	select		1,	2,	2,	0,	null,	0,	0
union	all	select		1,	2,	3,	0,	null,	0,	0
union	all	select		2,	2,	1,	11,	'http://gk-molodegniy.ru/files/0011/53/1d/10729.jpg',	1,	11
union	all	select		3,	2,	1,	11,	'http://gk-molodegniy.ru/files/0011/53/1d/10729.jpg',	1,	11
union	all	select		4,	2,	1,	11,	'http://gk-molodegniy.ru/files/0011/53/1d/10729.jpg',	1,	11
union	all	select		5,	2,	1,	11,	'http://gk-molodegniy.ru/files/0011/53/1d/10729.jpg',	1,	11
union	all	select		6,	2,	1,	11,	'http://gk-molodegniy.ru/files/0011/53/1d/10729.jpg',	1,	11
union	all	select		7,	2,	1,	11,	'http://gk-molodegniy.ru/files/0011/53/1d/10729.jpg',	1,	11
union	all	select		8,	2,	1,	11,	'http://gk-molodegniy.ru/files/0011/53/1d/10729.jpg',	1,	11
union	all	select		9,	2,	1,	10,	'http://gk-molodegniy.ru/files/0011/53/1d/19358.jpg',	1,	10
union	all	select		10,	2,	1,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/74743.jpg',	1,	9
union	all	select		11,	2,	1,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/24979.jpg',	1,	9
union	all	select		12,	2,	1,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/24979.jpg',	1,	9
union	all	select		13,	2,	1,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/24979.jpg',	1,	9
union	all	select		14,	2,	1,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/74743.jpg',	1,	9
union	all	select		15,	2,	1,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/24979.jpg',	1,	9
union	all	select		16,	2,	1,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/24979.jpg',	1,	9
union	all	select		17,	2,	1,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/24979.jpg',	1,	9
union	all	select		18,	2,	1,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/24979.jpg',	1,	9
union	all	select		19,	2,	1,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/24979.jpg',	1,	9
union	all	select		20,	2,	1,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/24979.jpg',	1,	9
union	all	select		21,	2,	1,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/24979.jpg',	1,	9
union	all	select		22,	2,	1,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/74743.jpg',	1,	9
union	all	select		23,	2,	1,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/74743.jpg',	1,	9
union	all	select		24,	2,	1,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/74743.jpg',	1,	9
union	all	select		25,	2,	1,	9,	'http://s2.uploads.ru/5eS47.png',	1,	9
union	all	select		2,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		3,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		4,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		5,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		6,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		7,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		8,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		9,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		10,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		11,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		12,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		13,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		14,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		15,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		16,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		17,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		18,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		19,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		20,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		21,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		22,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		23,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		24,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		25,	2,	2,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/52052.jpg',	1,	9
union	all	select		2,	2,	3,	10,	'http://gk-molodegniy.ru/files/0011/53/1d/37552.jpg',	1,	10
union	all	select		3,	2,	3,	10,	'http://gk-molodegniy.ru/files/0011/53/1d/37552.jpg',	1,	10
union	all	select		4,	2,	3,	10,	'http://gk-molodegniy.ru/files/0011/53/1d/37552.jpg',	1,	10
union	all	select		5,	2,	3,	10,	'http://gk-molodegniy.ru/files/0011/53/1d/37552.jpg',	1,	10
union	all	select		6,	2,	3,	10,	'http://gk-molodegniy.ru/files/0011/53/1d/37552.jpg',	1,	10
union	all	select		7,	2,	3,	10,	'http://gk-molodegniy.ru/files/0011/53/1d/37552.jpg',	1,	10
union	all	select		8,	2,	3,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/41012.jpg',	1,	9
union	all	select		9,	2,	3,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/41012.jpg',	1,	9
union	all	select		10,	2,	3,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/28780.jpg',	1,	9
union	all	select		11,	2,	3,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/28780.jpg',	1,	9
union	all	select		12,	2,	3,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/28780.jpg',	1,	9
union	all	select		13,	2,	3,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/28780.jpg',	1,	9
union	all	select		14,	2,	3,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/28780.jpg',	1,	9
union	all	select		15,	2,	3,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/28780.jpg',	1,	9
union	all	select		16,	2,	3,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/28780.jpg',	1,	9
union	all	select		17,	2,	3,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/28780.jpg',	1,	9
union	all	select		18,	2,	3,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/28780.jpg',	1,	9
union	all	select		19,	2,	3,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/28780.jpg',	1,	9
union	all	select		20,	2,	3,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/28780.jpg',	1,	9
union	all	select		21,	2,	3,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/28780.jpg',	1,	9
union	all	select		22,	2,	3,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/28780.jpg',	1,	9
union	all	select		23,	2,	3,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/28780.jpg',	1,	9
union	all	select		24,	2,	3,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/28780.jpg',	1,	9
union	all	select		25,	2,	3,	9,	'http://gk-molodegniy.ru/files/0011/53/1d/28780.jpg',	1,	9

union	all	select		1,	3,	1,	0,	null,	0,	null
union	all	select		1,	3,	2,	0,	null,	0,	null
union	all	select		1,	3,	3,	0,	null,	0,	null
union	all	select		2,	3,	1,	9,	'http://s3.uploads.ru/sUBER.png',	1,	null
union	all	select		3,	3,	1,	9,	'http://s3.uploads.ru/kftCI.png',	1,	null
union	all	select		4,	3,	1,	9,	'http://s3.uploads.ru/kftCI.png',	1,	null
union	all	select		5,	3,	1,	9,	'http://s3.uploads.ru/kftCI.png',	1,	null
union	all	select		6,	3,	1,	9,	'http://s3.uploads.ru/kftCI.png',	1,	null
union	all	select		7,	3,	1,	9,	'http://s3.uploads.ru/kftCI.png',	1,	null
union	all	select		8,	3,	1,	9,	'http://s3.uploads.ru/kftCI.png',	1,	null
union	all	select		9,	3,	1,	9,	'http://s3.uploads.ru/kftCI.png',	1,	null
union	all	select		10,	3,	1,	9,	'http://s2.uploads.ru/g2NFy.png',	1,	null
union	all	select		11,	3,	1,	9,	'http://s2.uploads.ru/g2NFy.png',	1,	null
union	all	select		12,	3,	1,	9,	'http://s2.uploads.ru/g2NFy.png',	1,	null
union	all	select		13,	3,	1,	9,	'http://s3.uploads.ru/RwYuc.png',	1,	null
union	all	select		14,	3,	1,	9,	'http://s3.uploads.ru/RwYuc.png',	1,	null
union	all	select		15,	3,	1,	9,	'http://s3.uploads.ru/RwYuc.png',	1,	null
union	all	select		16,	3,	1,	9,	'http://s3.uploads.ru/RwYuc.png',	1,	null
union	all	select		17,	3,	1,	9,	'http://s3.uploads.ru/RwYuc.png',	1,	null
union	all	select		18,	3,	1,	9,	'http://s2.uploads.ru/5eS47.png',	1,	null
union	all	select		19,	3,	1,	9,	'http://s2.uploads.ru/5eS47.png',	1,	null
union	all	select		20,	3,	1,	9,	'http://s2.uploads.ru/5eS47.png',	1,	null
union	all	select		21,	3,	1,	9,	'http://s2.uploads.ru/5eS47.png',	1,	null
union	all	select		22,	3,	1,	9,	'http://s2.uploads.ru/5eS47.png',	1,	null
union	all	select		23,	3,	1,	9,	'http://s2.uploads.ru/5eS47.png',	1,	null
union	all	select		24,	3,	1,	9,	'http://s2.uploads.ru/5eS47.png',	1,	null
union	all	select		25,	3,	1,	9,	'http://s2.uploads.ru/5eS47.png',	1,	null
union	all	select		2,	3,	2,	9,	'http://s2.uploads.ru/spfAX.png',	1,	null
union	all	select		3,	3,	2,	9,	'http://s3.uploads.ru/WGbS8.png',	1,	null
union	all	select		4,	3,	2,	9,	'http://s3.uploads.ru/WGbS8.png',	1,	null
union	all	select		5,	3,	2,	9,	'http://s3.uploads.ru/WGbS8.png',	1,	null
union	all	select		6,	3,	2,	9,	'http://s3.uploads.ru/WGbS8.png',	1,	null
union	all	select		7,	3,	2,	9,	'http://s3.uploads.ru/WGbS8.png',	1,	null
union	all	select		8,	3,	2,	9,	'http://s3.uploads.ru/WGbS8.png',	1,	null
union	all	select		9,	3,	2,	9,	'http://s3.uploads.ru/WGbS8.png',	1,	null
union	all	select		10,	3,	2,	9,	'http://s3.uploads.ru/oIGvw.png',	1,	null
union	all	select		11,	3,	2,	9,	'http://s3.uploads.ru/oIGvw.png',	1,	null
union	all	select		12,	3,	2,	9,	'http://s3.uploads.ru/oIGvw.png',	1,	null
union	all	select		13,	3,	2,	9,	'http://s3.uploads.ru/34ka0.png',	1,	null
union	all	select		14,	3,	2,	9,	'http://s3.uploads.ru/34ka0.png',	1,	null
union	all	select		15,	3,	2,	9,	'http://s3.uploads.ru/34ka0.png',	1,	null
union	all	select		16,	3,	2,	9,	'http://s3.uploads.ru/34ka0.png',	1,	null
union	all	select		17,	3,	2,	9,	'http://s3.uploads.ru/34ka0.png',	1,	null
union	all	select		18,	3,	2,	9,	'http://s2.uploads.ru/JzVC4.png',	1,	null
union	all	select		19,	3,	2,	9,	'http://s2.uploads.ru/JzVC4.png',	1,	null
union	all	select		20,	3,	2,	9,	'http://s2.uploads.ru/JzVC4.png',	1,	null
union	all	select		21,	3,	2,	9,	'http://s2.uploads.ru/JzVC4.png',	1,	null
union	all	select		22,	3,	2,	9,	'http://s2.uploads.ru/JzVC4.png',	1,	null
union	all	select		23,	3,	2,	9,	'http://s2.uploads.ru/JzVC4.png',	1,	null
union	all	select		24,	3,	2,	9,	'http://s2.uploads.ru/JzVC4.png',	1,	null
union	all	select		25,	3,	2,	9,	'http://s2.uploads.ru/JzVC4.png',	1,	null
union	all	select		2,	3,	3,	9,	'http://s2.uploads.ru/kOoQr.png',	1,	null
union	all	select		3,	3,	3,	9,	'http://s2.uploads.ru/6Nw75.png',	1,	null
union	all	select		4,	3,	3,	9,	'http://s3.uploads.ru/lvrIG.png',	1,	null
union	all	select		5,	3,	3,	9,	'http://s2.uploads.ru/DClWh.png',	1,	null
union	all	select		6,	3,	3,	9,	'http://s2.uploads.ru/DClWh.png',	1,	null
union	all	select		7,	3,	3,	9,	'http://s2.uploads.ru/DClWh.png',	1,	null
union	all	select		8,	3,	3,	9,	'http://s2.uploads.ru/DClWh.png',	1,	null
union	all	select		9,	3,	3,	9,	'http://s2.uploads.ru/DClWh.png',	1,	null
union	all	select		10,	3,	3,	9,	'http://s2.uploads.ru/q7Pe2.png',	1,	null
union	all	select		11,	3,	3,	9,	'http://s3.uploads.ru/lxbcV.png',	1,	null
union	all	select		12,	3,	3,	9,	'http://s3.uploads.ru/rmbBO.png',	1,	null
union	all	select		13,	3,	3,	9,	'http://s2.uploads.ru/cnQK2.png',	1,	null
union	all	select		14,	3,	3,	9,	'http://s2.uploads.ru/cnQK2.png',	1,	null
union	all	select		15,	3,	3,	9,	'http://s2.uploads.ru/cnQK2.png',	1,	null
union	all	select		16,	3,	3,	9,	'http://s2.uploads.ru/cnQK2.png',	1,	null
union	all	select		17,	3,	3,	9,	'http://s2.uploads.ru/cnQK2.png',	1,	null
union	all	select		18,	3,	3,	9,	'http://s3.uploads.ru/u67hU.png',	1,	null
union	all	select		19,	3,	3,	9,	'http://s3.uploads.ru/u67hU.png',	1,	null
union	all	select		20,	3,	3,	9,	'http://s3.uploads.ru/u67hU.png',	1,	null
union	all	select		21,	3,	3,	9,	'http://s3.uploads.ru/u67hU.png',	1,	null
union	all	select		22,	3,	3,	9,	'http://s3.uploads.ru/u67hU.png',	1,	null
union	all	select		23,	3,	3,	9,	'http://s3.uploads.ru/u67hU.png',	1,	null
union	all	select		24,	3,	3,	9,	'http://s3.uploads.ru/u67hU.png',	1,	null
union	all	select		25,	3,	3,	9,	'http://s3.uploads.ru/u67hU.png',	1,	null


update dbo.tFloor
set ApartmentInFloor = 3
where HouseId = 1 and FloorNum in (2, 3)
