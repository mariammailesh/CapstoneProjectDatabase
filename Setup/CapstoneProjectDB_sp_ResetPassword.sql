CREATE PROCEDURE sp_ResetPassword
    @Email VARCHAR(255),
    @NewPasswordHash VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM Users WHERE Email = @Email)
    BEGIN
        RAISERROR('Email not found.', 16, 1);
        RETURN;
    END

    UPDATE Users
    SET Password_Hash = @NewPasswordHash,
        Updated_By = 'API',
        Update_Date = GETDATE()
    WHERE Email = @Email;
END;
