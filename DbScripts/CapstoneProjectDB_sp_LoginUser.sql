CREATE PROCEDURE sp_LoginUser
    @Email NVARCHAR(255),
    @PasswordHash NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT User_Id, Full_Name, UserName, Email, Role_Id
    FROM Users
    WHERE Email = @Email AND Password_Hash = @PasswordHash AND IsActive = 1;
END;
