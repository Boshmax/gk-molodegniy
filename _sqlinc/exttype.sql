/*
$Name:  $
$Revision: 1.2 $
$Date: 2007/10/23 09:39:52 $
$Source: /home/cvs/fact/Sql/_sqlinc/exttype.sql,v $

Назначение:

Пример вызова:
*/

if '$(_EXTTYPE_MODE)' = 'DROP' begin
	if exists(
		select 1 from sys.types t 
			inner join sys.schemas s on s.schema_id = t.schema_id
			where s.name = '$(_SCHEMA)' and t.name = '$(_OBJECT)'
	)
		drop type $(_SCHEMA).$(_OBJECT);
end
else if '$(_EXTTYPE_MODE)' = 'CREATE' begin
	create type $(_SCHEMA).$(_OBJECT)
		external name [$(_ASSEMBLY)].[$(_ASSEMBLY_NS).Sql$(_OBJECT)];
end
go

