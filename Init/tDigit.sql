/*
$Date: 15.09.2014 12:03:27 $
$Source: Git\gk-molodegniy\Init\tDigit.sql $

Назначение:

Пример вызова:
*/

set quoted_identifier on
go

if not exists (
	select 1 from information_schema.views
		where table_schema = N'dbo' and table_name = N'tDigit'
)
	create table dbo.tDigit(
		id int identity(1, 1) not null,
		num int null
	) on primary

go

set quoted_identifier off
go

truncate table dbo.tDigit;
go

declare @n int = 1;

while @n<1000
begin
	insert dbo.tDigit(num)
	select @n;

	set @n= @n+1;
end
