CREATE PROCEDURE sp_RegisterUser
    @Full_Name NVARCHAR(255),
    @UserName NVARCHAR(100),
    @Email VARCHAR(255),
    @Phone_Number VARCHAR(20),
    @PasswordHash VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    -- تحقق من عدم وجود المستخدم مسبقًا
    IF EXISTS (SELECT 1 FROM Users WHERE Email = @Email OR UserName = @UserName)
    BEGIN
        RAISERROR('User with this email or username already exists.', 16, 1);
        RETURN;
    END

    -- إدخال المستخدم الجديد
    INSERT INTO Users (Full_Name, UserName, Email, Phone_Number, Password_Hash, Role_Id, IsActive, Created_By, Created_At)
    VALUES (@Full_Name, @UserName, @Email, @Phone_Number, @PasswordHash, 2, 1, 'API', GETDATE());

    SELECT SCOPE_IDENTITY() AS NewUserId;
END;
