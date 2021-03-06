--Microsoft SQL: The server principal "loginuser" is not able to access the database "userDB" under the current security context.
--Cannot open database "userDB" requested by the login. The login failed.
--Login failed for user 'loginuser'.

--Çözüm;

--1. İlgili kullanıcının rolleri kontrol edilir

SELECT 
DP1.name AS DatabaseRoleName,
isnull (DP2.name, 'No members') AS DatabaseUserName
FROM sys.database_role_members AS DRM
RIGHT OUTER JOIN sys.database_principals AS DP1
ON DRM.role_principal_id = DP1.principal_id
LEFT OUTER JOIN sys.database_principals AS DP2
ON DRM.member_principal_id = DP2.principal_id
WHERE DP1.type = 'R'
ORDER BY DP1.name;

--2. db_datawriter,db_datareader Rollerinin DatabaseUserName kolonunda "No Member" olması durumunda aşağıda ki işlemler sırasıyla yapılmalıdır.

--Kullanıcı kaldırılır.
DROP USER [loginuser];
GO
--Kullanıcı tekrar kaydedilir.
CREATE USER [loginuser] FOR LOGIN [loginuser] WITH DEFAULT_SCHEMA=[dbo]
GO
--Kullanıcıya db_datawriter rolü tanımlanır.
ALTER ROLE db_datawriter ADD MEMBER loginuser;
GO
--Kullanıcıya db_datareader rolü tanımlanır.
ALTER ROLE db_datareader ADD MEMBER loginuser;
GO

--3. Tekrar veri alma işlemi yapılabilir.