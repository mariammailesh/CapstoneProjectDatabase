CREATE PROCEDURE sp_LoginUser
    @Email VARCHAR(255),
    @PasswordHash VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT UserId, Full_Name, UserName, Email, Role_Id
    FROM Users
    WHERE Email = @Email AND Password_Hash = @PasswordHash AND IsActive = 1;
END;
