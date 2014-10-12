/*
$Date: 15.09.2014 13:02:13 $
$Source: Git\gk-molodegniy\Init\tHouse.sql $

Назначение:

Пример вызова:
*/

set quoted_identifier on
go

if not exists (
	select 1 from information_schema.tables
		where table_schema = N'dbo' and table_name = N'tHouse'
)
	create table [dbo].[tHouse](
		[Id] [int] identity(1, 1) not null,
		[House] [int] null,
		[Unit] [int] null,
		[Floors] [int] null,
		[FlatInFloor] [int] null
	,	StartApartamentNum [int] null
	) on [primary]

go
set quoted_identifier off
go
truncate table dbo.tHouse;
go

insert [tHouse](House, Unit, Floors, FlatInFloor, StartApartamentNum)
select 1, 1, 20, 12,  8
union all
select 2, 3, 25, 9, 0
union all
select 3, 3, 25, 9, 0