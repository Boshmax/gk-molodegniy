if not exists(
	select 1 from sys.database_principals
		where name = '$(_DATABASE_ROLE)' and type='R'
	)
	create role [$(_DATABASE_ROLE)] authorization [dbo];
go



