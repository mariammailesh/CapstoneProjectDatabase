CREATE PROCEDURE ValidateOtpAndMarkUsed
    @Email NVARCHAR(100),
    @OTPCode VARCHAR(5)
AS
BEGIN
    DECLARE @TryCount INT, @ExpirationTime DATETIME, @IsUsed BIT

    SELECT TOP 1 
        @TryCount = TryCount, 
        @ExpirationTime = ExpirationTime,
        @IsUsed = IsUsed
    FROM UserOTP
    WHERE Email = @Email AND OTPCode = @OTPCode AND Purpose = 'ResetPassword'
    ORDER BY Created_At DESC

    IF @IsUsed = 1
    BEGIN
        RAISERROR('OTP already used.', 16, 1)
        RETURN
    END

    IF @ExpirationTime < GETDATE()
    BEGIN
        RAISERROR('OTP expired.', 16, 1)
        RETURN
    END

    IF @TryCount >= 3
    BEGIN
        RAISERROR('Too many OTP attempts.', 16, 1)
        RETURN
    END

    -- If valid OTP
    UPDATE UserOTP
    SET IsUsed = 1
    WHERE Email = @Email AND OTPCode = @OTPCode
END
