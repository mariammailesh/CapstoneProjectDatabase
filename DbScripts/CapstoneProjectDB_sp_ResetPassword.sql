CREATE PROCEDURE sp_ResetPassword
    @Email NVARCHAR(255),
    @NewPasswordHash NVARCHAR(255)
AS
BEGIN
    DECLARE @OldPasswordHash NVARCHAR(100)

    SELECT @OldPasswordHash = Password_Hash FROM Users WHERE Email = @Email 

    IF @OldPasswordHash IS NULL
    BEGIN
        RAISERROR('Super Admin not found.', 16, 1)
        RETURN
    END

    IF @OldPasswordHash = @NewPasswordHash
    BEGIN
        RAISERROR('New password must be different.', 16, 1)
        RETURN
    END

    UPDATE Users
    SET Password_Hash = @NewPasswordHash
    WHERE Email = @Email 
END
