/*
\_sqlinc\synonym_db.sql

Назначение: Добавление синонима для объекта в другой базе
*/

if exists(
	select 1 from sys.synonyms y
		inner join sys.schemas s on s.schema_id = y.schema_id
		where s.name = '$(_SCHEMA)' and y.name = '$(_OBJECT)'
	)
	drop synonym $(_SCHEMA).$(_OBJECT);

if '$(_ACTION)' = 'CREATE'
	create synonym $(_SCHEMA).$(_OBJECT) for $(_BASE_DB).$(_BASE_SCHEMA).$(_BASE_OBJECT);

:r grant_read_to_public.sqlinc
