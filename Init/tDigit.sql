/*
$Date: 15.09.2014 13:02:02 $
$Source: Git\gk-molodegniy\Init\tDigit.sql $

Назначение:

Пример вызова:
*/

set quoted_identifier on
go

if not exists (
	select 1 from information_schema.tables
		where table_schema = N'dbo' and table_name = N'tDigit'
)
	create table dbo.tDigit(
		Id int identity(1, 1) not null,
		Num int null
	) on [primary]

go

set quoted_identifier off
go

truncate table dbo.tDigit;
go

declare @n int = 1;

while @n<1000
begin
	insert dbo.tDigit(Num)
	select @n;

	set @n= @n+1;
end
