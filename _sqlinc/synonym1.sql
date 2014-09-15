/*
$Name:  $
$Revision: 1.1 $
$Date: 27.02.2014 12:25:03 $
$Source: Git\registrar-force\Sql\_sqlinc\synonym1.sql $

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
	create synonym $(_SCHEMA).$(_OBJECT) for $(_BASE_SCHEMA).$(_OBJECT);
go



