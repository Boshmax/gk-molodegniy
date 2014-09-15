/*
$Date: 15.09.2014 13:08:31 $
$Source: Git\gk-molodegniy\Init\tUser.sql $

Назначение:

Пример вызова:
*/
set quoted_identifier on
go

if not exists (
	select 1 from information_schema.tables
		where table_schema = N'dbo' and table_name = N'tUser'
)
create table [dbo].[tUser](
	[id] [int] identity(1, 1) not null,
	[name] [varchar](50) null,
	[userid] [int] null,
	[houseid] [int] null,
	[flatStr] [int] null,
	[isDisable] [bit] not null default ((0)),
	[Nev] [nchar](10) null,
	[Flat] [int] null,
	[Fraction] [bit] not null  default ((0)) ,
	[Apartment] [bit] not null default ((0)) ,
	[NewFlat] [int] null
) on [primary]


set quoted_identifier off
go

