/*
$Name:  $
$Revision: 1.1 $
$Date: 2007/10/23 09:19:27 $
$Source: /home/cvs/fact/Sql/_sqlinc/synonym.sql,v $

Назначение:

Пример вызова:
*/

if exists( 
	select 1 from sys.synonyms y
		inner join sys.schemas s on s.schema_id = y.schema_id
		where s.name = '$(_SCHEMA)' and y.name = '$(_OBJECT)'
	)
	drop synonym $(_SCHEMA).$(_OBJECT);

if '$(_ACTION)' = 'CREATE'
	create synonym $(_SCHEMA).$(_OBJECT) for $(_BASE_OBJECT);

go



