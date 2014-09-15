﻿:r ../_sqlinc/create_proc.sqlinc
/*
$Date: 15.09.2014 13:26:52 $
$Source: Git\gk-molodegniy\Sql\pListTenant.sql $

Назначение:

Пример вызова:
*/


alter procedure $(_SCHEMA).$(_OBJECT)
	@nHouse int
as
begin

	print '[spoiler="Список жильцов"]'

	declare @nchar varchar(8000)=''
	select @nchar = @nchar+name +' (№ '+ cast(flat as varchar(5))+')'+ char(13)
	from tUser
	where houseid = @nHouse and isDisable = 0
	order by name

	print @nchar

end
