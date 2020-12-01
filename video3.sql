USE AdventureWorks2019
GO
SELECT * FROM HumanResources.Employee
DECLARE @deptID INT
SELECT @deptID=1
SELECT Name, GroupName From	HumanResources.Department WHERE	DepartmentID = @deptID
GO

SELECT @@LANGUAGE
SELECT @@VERSION
SELECT @@IDENTITY
GO
--Các hàm lấy ra giá trị tổng Sum, trung bình Avg, max, đếm tổng số bản ghi count
SELECT SUM(StandardCost) FROM Production.ProductCostHistory
SELECT AVG(StandardCost) FROM Production.ProductCostHistory
SELECT MAX(StandardCost) FROM Production.ProductCostHistory
SELECT COUNT(*) FROM Production.ProductProductPhoto
SELECT * FROM Production.ProductPhoto

--Lấy ra ngày giờ hệ thống:
SELECT GETDATE()
--Lấy ra phút hệ thống:
SELECT DATEPART(MINUTE,GETDATE())
--Định dạng ngày dùng hàm convert
SELECT CONVERT(varchar(50), GETDATE(),103)

--Tạo ra CSDL:
CREATE DATABASE EXAMPLE
USE EXAMPLE
GO
--Tạo bảng CSDL
CREATE TABLE Contacts(MailID VARCHAR(20), Name NTEXT, TelephoneNumber INT)

--Thêm một cột vào bảng contacts
ALTER TABLE Contacts ADD Address NVARCHAR(50)

--Thêm dữ liệu vào bảng contacts
INSERT INTO Contacts VALUES ('ANV@GMAIL.COM', N'NGUYEN VAN A', 9898989, N'HA NOI')
INSERT INTO Contacts VALUES ('BNV@GMAIL.COM', N'NGUYEN VAN B', 19898989, N'HA NOI')
INSERT INTO Contacts VALUES ('CNV@GMAIL.COM', N'NGUYEN VAN C', 29898989, N'HA NOI')
SELECT * FROM Contacts
--Sửa bản ghi có name là Nguyen Van A
UPDATE Contacts SET MailID='ANV@GMAIL.COM' WHERE Name=N'NGUYEN VAN A'
--Xoá bản ghi có tên là Nguyen Van B
DELETE FROM Contacts WHERE MailID='ABC@GMAIL.COM'
--Tạo login account để test GRANT
CREATE LOGIN EXAMPLE WITH PASSWORD='123456'
--Tạo user từ login account vừa tạo
CREATE USER EXAMPLE FROM LOGIN EXAMPLE
--Huỷ bỏ tất cả các quyền của user example trên bảng contacts
REVOKE ALL ON Contacts FROM EXAMPLE
--Gán quyền SELECT cho example trên bảng contacts
GRANT SELECT ON Contacts TO EXAMPLE
