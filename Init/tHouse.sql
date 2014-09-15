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
		[id] [int] identity(1, 1) not null,
		[house] [int] null,
		[unit] [int] null,
		[floors] [int] null,
		[flatinfloor] [int] null
	) on [primary]

go
set quoted_identifier off
go
truncate table dbo.tHouse;
go

insert [tHouse](house, unit, floors, flatinfloor)
select 1, 1, 20, 12
union all
select 2, 3, 25, 9
union all
select 3, 3, 25, 9