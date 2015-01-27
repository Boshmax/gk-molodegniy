/*
$Date: 27.01.2015 13:25:57 $
$Source: Git\gk-molodegniy\Init\tFlatDetail.sql $

Назначение:

Пример вызова:
*/
set quoted_identifier on
go

if not exists (
	select 1 from information_schema.tables
		where table_schema = N'dbo' and table_name = N'tFlatDetail'
)
create table [dbo].[tFlatDetail](
	[Id] [int] identity(1, 1) not null
,	[HouseId] [int] null
,	[Unit] [int] null
,	[Floor] [int] null
,	[FlatInFloor] [int] null
,	[FlatGroup] [int] not null default(1)
,	[Apartament] bit not null default(0)
) on [primary]


set quoted_identifier off
go



truncate table dbo.tFlatDetail
go

insert dbo.tFlatDetail(HouseId, Unit, [Floor], FlatInFloor, FlatGroup, Apartament)

select 1, 1, 1, 1, 12, 0
union all


select 1, 1, 2, 2, 1, 1
union all
select 1, 1, 2, 3, 1, 1
union all
select 1, 1, 2, 4, 2, 1
union all
select 1, 1, 3, 2, 1, 1
union all
select 1, 1, 3, 3, 1, 1
union all
select 1, 1, 3, 4, 2, 1

union all
select 2, 1, 1, 1, 11, 0
union all
select 2, 2, 1, 1, 9, 0
union all
select 2, 3, 1, 1, 10, 0
union all

select 2, 1, 9, 9, 2, 0
union all
select 2, 1, 10, 5, 2, 0
union all
select 2, 1, 10, 9, 2, 0
union all
select 2, 1, 11, 4, 2, 0
union all
select 2, 1, 11, 9, 2, 0
union all
select 2, 1, 12, 4, 2, 0
union all
select 2, 1, 12, 9, 2, 0
union all
select 2, 1, 12, 4, 2, 0
union all
select 2, 1, 12, 9, 2, 0
union all
select 2, 1, 13, 4, 2, 0
union all
select 2, 1, 13, 9, 2, 0
union all

select 2, 1, 14, 5, 2, 0
union all
select 2, 1, 14, 9, 2, 0
union all

select 2, 1, 15, 4, 2, 0
union all
select 2, 1, 15, 9, 2, 0
union all
select 2, 1, 16, 4, 2, 0
union all
select 2, 1, 16, 9, 2, 0
union all
select 2, 1, 17, 4, 2, 0
union all
select 2, 1, 17, 9, 2, 0
union all
select 2, 1, 18, 4, 2, 0
union all
select 2, 1, 18, 9, 2, 0
union all
select 2, 1, 19, 4, 2, 0
union all
select 2, 1, 19, 9, 2, 0
union all
select 2, 1, 20, 4, 2, 0
union all
select 2, 1, 20, 9, 2, 0
union all
select 2, 1, 21, 4, 2, 0
union all
select 2, 1, 21, 9, 2, 0
union all
select 2, 1, 22, 5, 2, 0
union all
select 2, 1, 22, 9, 2, 0
union all
select 2, 1, 23, 5, 2, 0
union all
select 2, 1, 23, 9, 2, 0
union all
select 2, 1, 24, 5, 2, 0
union all
select 2, 1, 24, 9, 2, 0
union all
select 2, 1, 25, 4, 2, 0
union all
select 2, 1, 25, 9, 2, 0
union all

select 2, 3, 8, 9, 2, 0
union all
select 2, 3, 9, 9, 2, 0
union all
select 2, 3, 10, 9, 2, 0
union all
select 2, 3, 11, 9, 2, 0
union all
select 2, 3, 12, 9, 2, 0
union all
select 2, 3, 13, 9, 2, 0
union all
select 2, 3, 14, 9, 2, 0
union all
select 2, 3, 15, 9, 2, 0
union all
select 2, 3, 16, 9, 2, 0
union all
select 2, 3, 17, 9, 2, 0
union all
select 2, 3, 18, 9, 2, 0
union all
select 2, 3, 19, 9, 2, 0
union all
select 2, 3, 20, 9, 2, 0
union all
select 2, 3, 21, 9, 2, 0
union all
select 2, 3, 22, 9, 2, 0
union all
select 2, 3, 23, 9, 2, 0
union all
select 2, 3, 24, 9, 2, 0
union all
select 2, 3, 25, 9, 2, 0

union all
select 3, 1, 1, 1, 9, 0
union all
select 3, 2, 1, 1, 9, 0
union all
select 3, 3, 1, 1, 9, 0

union all
select 4, 1, 1, 1, 11, 0
union all
select 4, 1, 2, 1, 11, 0
union all
select 4, 2, 1, 1, 10, 0
union all
select 4, 3, 1, 1, 10, 0
union all
select 4, 4, 1, 1, 11, 0