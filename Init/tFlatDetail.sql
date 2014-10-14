/*
$Date: 14.10.2014 19:18:07 $
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

