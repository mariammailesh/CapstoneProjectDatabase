CREATE DATABASE [E-Single Restaurant Management System]; --Create database for Foodtek app

USE [E-Single Restaurant Management System]; --Use Foodtek database to add objects

CREATE TABLE Roles (
	Role_Id		INT PRIMARY KEY IDENTITY(1,1),
    Name_Ar		NVARCHAR(255) NOT NULL,
    Name_En		NVARCHAR(255) NOT NULL,
    Is_Active	BIT DEFAULT 1,
    Created_By	NVARCHAR(100),
    Updated_By	NVARCHAR(100),
    Created_At	DATETIME DEFAULT GETDATE(),
    Update_Date DATETIME
);

CREATE TABLE Users (
    User_Id		int PRIMARY KEY identity(1,1),
	Role_Id		INT NOT NULL,
    Full_Name	NVARCHAR(100) NOT NULL,
    Email		NVARCHAR(100) NOT NULL UNIQUE,
    Phone_Number	NVARCHAR(14) NOT NULL UNIQUE,
    UserName	NVARCHAR(30) NOT NULL UNIQUE,
    Password_Hash	NVARCHAR(16) NOT NULL UNIQUE,
    Profile_Image	NVARCHAR(MAX),
    Birth_Date		DATETIME,
    IsActive	BIT DEFAULT 1,
    IsVerified	BIT DEFAULT 0,
    Created_At	DATETIME DEFAULT GetDate(),
	Created_By	NVARCHAR(100),
    Updated_By	NVARCHAR(100),
	Update_Date DATETIME,
	FOREIGN KEY (Role_Id) REFERENCES Roles(Role_Id) ON DELETE CASCADE
);

CREATE TABLE Permissions (
    Permission_Id INT PRIMARY KEY IDENTITY(1,1),
    Name          NVARCHAR(100)  NOT NULL,
    Description   NVARCHAR(500),
    Is_Active     BIT            NOT NULL DEFAULT(1),
    Created_By    NVARCHAR(255),
    Updated_By    NVARCHAR(255),
    Created_At    DATETIME DEFAULT GETDATE(),
    Update_Date   DATETIME
);

ALTER TABLE Users
ADD CONSTRAINT CHK_Users_EmailDomain
CHECK (
    LOWER(Email) LIKE '%@gmail.com'
 OR LOWER(Email) LIKE '%@hotmail.com'
 OR LOWER(Email) LIKE '%@outlook.com'
 OR LOWER(Email) LIKE '%@zoho.com'
 OR LOWER(Email) LIKE '%@yahoo.com'
);

ALTER TABLE Users
ADD CONSTRAINT CK_Users_UserName_OnlyLetters
CHECK (UserName NOT LIKE '%[^A-Za-z]%');

CREATE TABLE Categories (
    Category_Id      INT PRIMARY KEY IDENTITY(1,1),
    Category_NameAr  NVARCHAR(100) NOT NULL,
    Category_NameEn  NVARCHAR(100) NOT NULL,
    Image            NVARCHAR(MAX),
    Is_Active        BIT DEFAULT(1),
    Created_By       NVARCHAR(255) ,
    Updated_By       NVARCHAR(255) ,
    Created_At       DATETIME  DEFAULT GETDATE(),
    Update_Date      DATETIME 
);

CREATE TABLE Items (
    Item_Id         INT PRIMARY KEY IDENTITY(1,1),
    Category_Id		INT NOT NULL,
    Name_Ar         NVARCHAR(100) NOT NULL,
    Name_En         NVARCHAR(100) NOT NULL,
    Description_Ar  NVARCHAR(MAX),
    Description_En  NVARCHAR(MAX),
    Image           NVARCHAR(MAX),
    Price           DECIMAL(18,2),
    Is_Active       BIT DEFAULT(1),
    Created_By      NVARCHAR(255),
    Updated_By      NVARCHAR(255),
    Creation_Date   DATETIME DEFAULT GETDATE(),
    Update_Date     DATETIME,
	FOREIGN KEY (Category_Id) REFERENCES Categories(Category_Id) ON DELETE CASCADE
);

CREATE TABLE Lookup_Types (
    TYPE_Id		INT PRIMARY KEY IDENTITY(1,1),
    Name_En		NVARCHAR(100) NOT NULL,
    Name_Ar		NVARCHAR(100),
    Description NVARCHAR(255),
	Is_Active	BIT DEFAULT(1),
    Created_By  NVARCHAR(255),
    Updated_By  NVARCHAR(255),
    Creation_Date   DATETIME DEFAULT GETDATE(),
    Update_Date     DATETIME,
);

CREATE TABLE Lookup_Items (
    Id				INT PRIMARY KEY IDENTITY(1,1),
    Type_Id			INT NOT NULL,
    Value_En		NVARCHAR(100) NOT NULL,
    Value_Ar		NVARCHAR(100),
	Is_Active       BIT DEFAULT(1),
    Created_By      NVARCHAR(255),
    Updated_By      NVARCHAR(255),
    Creation_Date   DATETIME DEFAULT GETDATE(),
    Update_Date     DATETIME,
    FOREIGN KEY (Type_Id) REFERENCES Lookup_Types(TYPE_Id)
);

CREATE TABLE Options (
    Option_Id      INT PRIMARY KEY IDENTITY(1,1),
    Name_Ar        NVARCHAR(100),
    Name_En        NVARCHAR(100),
    OptionType     NVARCHAR(50),
    Is_Required    BIT DEFAULT(0),
    Is_Active      BIT DEFAULT(1),
    Created_By     NVARCHAR(255) ,
    Updated_By     NVARCHAR(255) ,
    Creation_Date  DATETIME DEFAULT GETDATE(),
    Update_Date    DATETIME 
);

CREATE TABLE ItemOptions (
    Id			INT PRIMARY KEY IDENTITY(1,1),
    Item_Id		INT NOT NULL,
    Option_Id	INT NOT NULL,
    Is_Active	BIT NOT NULL DEFAULT(1),
    Created_By	NVARCHAR(255),
    Updated_By	NVARCHAR(255),
    Creation_Date DATETIME DEFAULT GETDATE(),
    Update_Date	DATETIME,
	FOREIGN KEY (Item_Id) REFERENCES Items(Item_Id) ON DELETE CASCADE,
	FOREIGN KEY (Option_Id) REFERENCES Options(Option_Id) ON DELETE CASCADE
);

CREATE TABLE Discounts (
    Discount_Id		INT PRIMARY KEY IDENTITY(1,1),
    Title_en		NVARCHAR(255),
    Title_ar		NVARCHAR(255),
    Description_en	NVARCHAR(MAX),
    Description_ar	NVARCHAR(MAX),
    Start_Date		DATETIME,
    End_Date		DATETIME,
    Limit_Amount	DECIMAL(18,2),
    Code			INT,
    Discount_Status INT,
    Is_Active		BIT,
    Created_By		NVARCHAR(100),
    Updated_By		NVARCHAR(100),
    Created_At		DATETIME DEFAULT GETDATE(),
    Update_Date		DATETIME,
	FOREIGN KEY (Discount_Status) REFERENCES Lookup_Items(Id) ON DELETE CASCADE
);

CREATE TABLE Orders (
    Order_Id		INT PRIMARY KEY IDENTITY(1,1),
    Client_Id		INT REFERENCES Users(User_Id) NOT NULL,
    Driver_Id		INT REFERENCES Users(User_Id) NOT NULL,
    Discount_Id		INT,
    Order_Status	INT,
    Total_Price		DECIMAL(18,2),
    Is_Active		BIT DEFAULT 1,
    Created_By		NVARCHAR(100),
    Updated_By		NVARCHAR(100),
    Created_At		DATETIME DEFAULT GETDATE(),
    Update_At		DATETIME,
	FOREIGN KEY (Discount_Id) REFERENCES Discounts(Discount_Id),
	FOREIGN KEY (Order_Status) REFERENCES Lookup_Items(Id) ON DELETE CASCADE
);

CREATE TABLE Order_Items (
    OrderItem_Id	INT PRIMARY KEY IDENTITY(1,1),
    Order_Id		INT,
    Item_Id			INT,
    Total_Price		DECIMAL(18,2),
    Item_Price		DECIMAL(18,2),
    Quantity		INT,
    Is_Active		BIT DEFAULT 1,
    Created_By		NVARCHAR(100),
    Updated_By		NVARCHAR(100),
    Created_At		DATETIME DEFAULT GETDATE(),
    Update_Date		DATETIME,
	FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id) ON DELETE CASCADE,
	FOREIGN KEY (Item_Id) REFERENCES Items(Item_Id)
);

CREATE TABLE Orders_History (
    Order_Id		INT,
    Client_Id		INT REFERENCES Users(User_Id) NOT NULL,
    Is_Active		BIT DEFAULT 1,
    Created_By		NVARCHAR(100),
    Updated_By		NVARCHAR(100),
    Created_At		DATETIME DEFAULT GETDATE(),
    Update_Date		DATETIME,
    CONSTRAINT PK_OrdersHistory PRIMARY KEY (Order_Id,	Client_Id),
	FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id) ON DELETE CASCADE
);

CREATE TABLE Chats (
    Chat_Id			INT PRIMARY KEY IDENTITY(1,1),
    Order_Id		INT NOT NULL,
    Client_Id		INT REFERENCES Users(User_Id) NOT NULL,
    Driver_Id		INT REFERENCES Users(User_Id) NOT NULL,
    Chat_File_Path	NVARCHAR(255) NOT NULL, -- Stores path to the JSON file
    Is_Active		BIT DEFAULT 1,
    Created_By		NVARCHAR(100),
    Updated_By		NVARCHAR(100),
    Creation_Date	DATETIME DEFAULT GETDATE(),
    Update_Date		DATETIME,
	FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id) ON DELETE CASCADE
);

CREATE TABLE Payments (
    Payment_Id		INT PRIMARY KEY IDENTITY(1,1),
    Order_Id		INT,
    Client_Id		INT REFERENCES Users(User_Id) NOT NULL,
    Payment_Method	INT,
    Amount			DECIMAL(18,2),
    Paid_At			DATETIME,
	Is_Active		BIT DEFAULT 1,
    Created_By		NVARCHAR(100),
    Updated_By		NVARCHAR(100),
    Created_At		DATETIME DEFAULT GETDATE(),
    Update_At		DATETIME,
	FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id) ON DELETE CASCADE,
	FOREIGN KEY (Payment_Method) REFERENCES Lookup_Items(Id)
);

CREATE TABLE DeliveryLocations (
    Location_Id		INT PRIMARY KEY IDENTITY(1,1),
    Order_Id		INT,
    Client_Id		INT REFERENCES Users(User_Id) NOT NULL,
    Delivery_Status NVARCHAR(50) NOT NULL,
    Delivery_Time	DATETIME NOT NULL,
    Title			NVARCHAR(255),
    Region			NVARCHAR(255),
    Longitude		FLOAT,
    Latitude		FLOAT,
    Is_Active		BIT DEFAULT 1,
    Created_By		NVARCHAR(100),
    Updated_By		NVARCHAR(100),
    Creation_Date	DATETIME DEFAULT GETDATE(),
    Update_Date		DATETIME,
	FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id) ON DELETE CASCADE
);

CREATE TABLE Ratings (
    Id				INT PRIMARY KEY IDENTITY(1,1),
    Client_Id		INT REFERENCES Users(User_Id) NOT NULL,
    Order_Id		INT,
    Driver_Id		INT REFERENCES Users(User_Id) NOT NULL,
    Rating_Amount	FLOAT,
    Feedback		NVARCHAR(MAX),
    Is_Active		BIT DEFAULT 1,
    Created_By		NVARCHAR(100),
    Updated_By		NVARCHAR(100),
    Created_At		DATETIME DEFAULT GETDATE(),
    Update_Date		DATETIME,
	FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id) ON DELETE CASCADE
);

CREATE TABLE Notifications (
    Id				INT PRIMARY KEY IDENTITY(1,1),
    User_Id			INT,
    Title			NVARCHAR(255),
    Message			NVARCHAR(MAX),
    Notification_Type INT,
    Is_Read			BIT DEFAULT 0,
    Is_Active		BIT DEFAULT 1,
    Created_By		NVARCHAR(100),
    Updated_By		NVARCHAR(100),
    Created_At		DATETIME DEFAULT GETDATE(),
    Update_Date		DATETIME,
	FOREIGN KEY (User_Id) REFERENCES Users(User_Id) ON DELETE CASCADE,
	FOREIGN KEY (Notification_Type) REFERENCES Lookup_Items(Id)
);

CREATE TABLE Issues_Suggestions (
    Id				INT PRIMARY KEY IDENTITY(1,1),
    User_Id			INT,
    Title			NVARCHAR(255),
    Message			NVARCHAR(MAX),
    Issue_Type		INT,
    Status			NVARCHAR(50),
    Is_Active		BIT DEFAULT 1,
    Created_By		NVARCHAR(100),
    Updated_By		NVARCHAR(100),
    Created_At		DATETIME DEFAULT GETDATE(),
    Update_Date		DATETIME,
	FOREIGN KEY (User_Id) REFERENCES Users(User_Id) ON DELETE CASCADE,
	FOREIGN KEY (Issue_Type) REFERENCES Lookup_Items(Id)
);

CREATE TABLE Discount_items (
    Id				INT PRIMARY KEY IDENTITY(1,1),
    Discount_Id		INT,
    Item_Id			INT,
    Is_Active		BIT DEFAULT 1,
    Created_By		NVARCHAR(100),
    Updated_By		NVARCHAR(100),
    Created_At		DATETIME DEFAULT GETDATE(),
    Update_Date		DATETIME,
	FOREIGN KEY (Discount_Id) REFERENCES Discounts(Discount_Id) ON DELETE CASCADE,
	FOREIGN KEY (Item_Id) REFERENCES Items(Item_ID) ON DELETE CASCADE
);

CREATE TABLE Discount_Categories (
    Id				INT PRIMARY KEY IDENTITY(1,1),
    Discount_Id		INT,
    Category_Id		INT,
    Is_Active		BIT DEFAULT 1,
    Created_By		NVARCHAR(100),
    Updated_By		NVARCHAR(100),
    Created_At		DATETIME DEFAULT GETDATE(),
    Update_Date		DATETIME,
	FOREIGN KEY (Discount_Id) REFERENCES Discounts(Discount_Id) ON DELETE CASCADE,
	FOREIGN KEY (Category_Id) REFERENCES Categories(Category_Id) ON DELETE CASCADE
);

CREATE TABLE Reports (
    Id				INT PRIMARY KEY IDENTITY(1,1),
    User_Id			INT,
    Item_Id			INT,
    Order_Id		INT,
    Title			NVARCHAR(255),
    Description		NVARCHAR(MAX),
    Is_Active		BIT DEFAULT 1,
    Created_By		NVARCHAR(100),
    Updated_By		NVARCHAR(100),
    Created_At		DATETIME DEFAULT GETDATE(),
    Update_Date		DATETIME,
	FOREIGN KEY (User_Id) REFERENCES Users(User_Id) ON DELETE CASCADE,
	FOREIGN KEY (Item_Id) REFERENCES Items(Item_Id) ON DELETE CASCADE,
	FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id) ON DELETE CASCADE
);

CREATE TABLE User_Notifications (
    User_Id			INT,
    Notification_Id INT,
    Is_Read			BIT DEFAULT 0,
    Is_Active		BIT DEFAULT 1,
    Created_By		NVARCHAR(100),
    Updated_By		NVARCHAR(100),
    Created_At		DATETIME DEFAULT GETDATE(),
    Update_Date		DATETIME,
	CONSTRAINT PK_User_Notifications PRIMARY KEY (User_Id, Notification_Id),
	FOREIGN KEY (User_Id) REFERENCES Users(User_Id) ON DELETE CASCADE,
	FOREIGN KEY (Notification_Id) REFERENCES Notifications(Id)
);

CREATE TABLE User_Issues_Suggestions (
    User_Id			INT,
    Issue_Suggestion_Id INT,
    Is_Active		BIT DEFAULT 1,
    Created_By		NVARCHAR(100),
    Updated_By		NVARCHAR(100),
    Created_At		DATETIME DEFAULT GETDATE(),
    Update_Date		DATETIME,
    CONSTRAINT PK_User_Issues_Suggestions PRIMARY KEY (User_Id, Issue_Suggestion_Id),
	FOREIGN KEY (User_Id) REFERENCES Users(User_Id) ON DELETE CASCADE,
	FOREIGN KEY (Issue_Suggestion_Id) REFERENCES Issues_Suggestions(Id)
); 

CREATE TABLE Role_Permissions (
    Role_Id			INT,
    Permission_Id	INT,
    Is_Active		BIT DEFAULT 1,
    Created_By		NVARCHAR(100),
    Updated_By		NVARCHAR(100),
    Created_At		DATETIME DEFAULT GETDATE(),
    Update_Date		DATETIME,
    CONSTRAINT PK_Role_Permissions PRIMARY KEY (Role_Id, Permission_Id),
	FOREIGN KEY (Role_Id) REFERENCES Roles(Role_Id) ON DELETE CASCADE,
	FOREIGN KEY (Permission_Id) REFERENCES Permissions(Permission_Id) ON DELETE CASCADE
);

CREATE TABLE UserOTP (
    UserOTP_Id		INT IDENTITY PRIMARY KEY,
    User_Id			INT NULL,                         -- Optional FK
    Email			NVARCHAR(100) NOT NULL UNIQUE,
    OTPCode			CHAR(5)	NOT NULL,
    ExpirationTime	DATETIME NOT NULL,
    IsUsed			BIT DEFAULT 0,
    TryCount		INT DEFAULT 0,
    Purpose			NVARCHAR(50) DEFAULT 'ResetPassword',
	Is_Active		BIT DEFAULT 1,
    Created_By		NVARCHAR(100),
    Updated_By		NVARCHAR(100),
    Created_At		DATETIME DEFAULT GETDATE(),
    Update_Date		DATETIME,
	FOREIGN KEY (User_Id) REFERENCES Users(User_Id) 
);

CREATE TABLE Cart (
    Cart_Id			INT PRIMARY KEY IDENTITY(1,1),
    User_Id			INT NOT NULL UNIQUE,
    Cart_Status		INT,							-- e.g., active, checked_out, abandoned
    Total_Price		DECIMAL(18,2) DEFAULT 0,
	Is_Active		BIT DEFAULT 1,
    Created_By		NVARCHAR(100),
    Updated_By		NVARCHAR(100),
    Created_At		DATETIME DEFAULT GETDATE(),
    Update_At		DATETIME,
    FOREIGN KEY (User_Id) REFERENCES Users(User_Id) ON DELETE CASCADE,
    FOREIGN KEY (Cart_Status) REFERENCES Lookup_Items(Id)
);

CREATE TABLE Cart_Items (
    Cart_Item_Id	INT PRIMARY KEY IDENTITY(1,1),
    Cart_Id			INT NOT NULL,
    Item_Id			INT NOT NULL,
    Quantity		INT NOT NULL DEFAULT 1,
    Price			DECIMAL(18,2) NOT NULL,
	Is_Active		BIT DEFAULT 1,
    Created_By		NVARCHAR(100),
    Updated_By		NVARCHAR(100),
    Created_At		DATETIME DEFAULT GETDATE(),
    Update_Date		DATETIME,
    FOREIGN KEY (Cart_Id) REFERENCES Cart(Cart_Id) ON DELETE CASCADE,
    FOREIGN KEY (Item_Id) REFERENCES Items(Item_Id) ON DELETE CASCADE
);
