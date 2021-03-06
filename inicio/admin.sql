USE [master]
GO
CREATE LOGIN [admin] WITH PASSWORD=N'123456', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER SERVER ROLE [bulkadmin] ADD MEMBER [admin]
GO
ALTER SERVER ROLE [dbcreator] ADD MEMBER [admin]
GO
ALTER SERVER ROLE [diskadmin] ADD MEMBER [admin]
GO
ALTER SERVER ROLE [processadmin] ADD MEMBER [admin]
GO
ALTER SERVER ROLE [securityadmin] ADD MEMBER [admin]
GO
ALTER SERVER ROLE [serveradmin] ADD MEMBER [admin]
GO
ALTER SERVER ROLE [setupadmin] ADD MEMBER [admin]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [admin]
GO
use [VideogamesDB];
GO
use [master];
GO
USE [VideogamesDB]
GO
CREATE USER [admin] FOR LOGIN [admin]
GO
USE [VideogamesDB]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [admin]
GO
USE [VideogamesDB]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [admin]
GO
USE [VideogamesDB]
GO
ALTER ROLE [db_datareader] ADD MEMBER [admin]
GO
USE [VideogamesDB]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [admin]
GO
USE [VideogamesDB]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [admin]
GO
USE [VideogamesDB]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [admin]
GO
USE [VideogamesDB]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [admin]
GO
USE [VideogamesDB]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin]
GO
USE [VideogamesDB]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [admin]
GO
