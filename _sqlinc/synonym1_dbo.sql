/*
$Name:  $
$Revision: 1.1 $
$Date: 27.02.2014 12:25:06 $
$Source: Git\registrar-force\Sql\_sqlinc\synonym1_dbo.sql $

Назначение:

Пример вызова:
*/

if exists(
	select 1 from sys.synonyms y
		inner join sys.schemas s on s.schema_id = y.schema_id
		where s.name = 'dbo' and y.name = '$(_OBJECT)'
	)
	drop synonym dbo.[$(_OBJECT)];

if '$(_ACTION)' = 'CREATE'
	create synonym dbo.[$(_OBJECT)] for $(_SCHEMA).[$(_OBJECT)];
go



