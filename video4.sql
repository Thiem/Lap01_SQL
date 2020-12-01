use master
go

if(DB_ID('Example4')IS NOT NULL)
	DROP DATABASE Example4

CREATE DATABASE Example4
ON PRIMARY
(
	NAME=N'Customer_DB',
	FILENAME=N'C:\Temp\Example4.mdf'
)
LOG ON 
(
	NAME=N'Customer_DB_log',
	FILENAME=N'C:\Temp\Example4.ldf'
)
COLLATE SQL_Latin1_General_CP1_CI_AS
GO

USE Example4
GO
--Thay đổi CSDL Example4 thành Example4Test:
ALTER DATABASE Example4 MODIFY NAME= Example4Test
GO

USE Example4Test
GO
EXECUTE sp_changedbowner @loginame='sa'
EXEC sp_changedbowner 'sa'
GO

CREATE DATABASE Example4
ON PRIMARY
(
	NAME=N'Customer_DB',
	FILENAME=N'C:\Temp\Example4.mdf',
	SIZE=4MB,
	FILEGROWTH=1MB
),
FILEGROUP Example4_FG1
(
	NAME=N'Customer_DB',
	FILENAME=N'C:\Temp\Example4_FG1.mdf',
	SIZE=4MB,
	MAXSIZE=10MB,
	FILEGROWTH=1MB
)
LOG ON 
(
	NAME=N'Customer_DB_log',
	FILENAME=N'C:\Temp\Example4.ldf'
)
COLLATE SQL_Latin1_General_CP1_CI_AS
GO
