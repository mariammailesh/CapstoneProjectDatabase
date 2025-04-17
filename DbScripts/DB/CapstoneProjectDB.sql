CREATE DATABASE [E-Food Management System]; --Create database for Foodtek app

USE [E-Food Management System]; --Use Foodtek database to add objects

CREATE TABLE Roles (
	Role_Id INT PRIMARY KEY IDENTITY(1,1),
    Name_Ar VARCHAR(255) NOT NULL,
    Name_En VARCHAR(255) NOT NULL,
    Is_Active BIT DEFAULT 1,
    Created_By VARCHAR(100),
    Updated_By VARCHAR(100),
    Created_At DATETIME DEFAULT GETDATE(),
    Update_Date DATETIME
);

CREATE TABLE Users (
    UserId int PRIMARY KEY identity(1,1),
	Role_Id INT NOT NULL,
    Full_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone_Number VARCHAR(15) NOT NULL UNIQUE,
    UserName VARCHAR(30) NOT NULL UNIQUE,
    Password_Hash TEXT NOT NULL,
    Profile_Image TEXT,
    Birth_Date DATE,
    IsActive bit DEFAULT 1,
    IsVerified bit DEFAULT 0,
    Created_At DATETIME DEFAULT GetDate(),
	Created_By VARCHAR(100),
    Updated_By VARCHAR(100),
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
);

CREATE TABLE Categories (
    Category_ID      INT PRIMARY KEY IDENTITY(1,1),
    Category_NameAr  NVARCHAR(100) NOT NULL,
    Category_NameEn  NVARCHAR(100) NOT NULL,
    Image            NVARCHAR(500),
    Is_Active        BIT DEFAULT(1),
    Created_By       NVARCHAR(255) ,
    Updated_By       NVARCHAR(255) ,
    Created_At       DATETIME  DEFAULT GETDATE(),
    Update_Date      DATETIME 
);

CREATE TABLE Items (
    Item_ID         INT PRIMARY KEY IDENTITY(1,1),
    FK_Category_ID  INT NOT NULL,
    Name_Ar         NVARCHAR(100) NOT NULL,
    Name_En         NVARCHAR(100) NOT NULL,
    Description_Ar  NVARCHAR(MAX),
    Description_En  NVARCHAR(MAX),
    Image           NVARCHAR(500),
    Price           DECIMAL(18,2),
    Is_Active       BIT DEFAULT(1),
    Created_By      NVARCHAR(255),
    Updated_By      NVARCHAR(255),
    Creation_Date   DATETIME DEFAULT GETDATE(),
    Update_Date     DATETIME,
	FOREIGN KEY (FK_Category_ID) REFERENCES Categories(Category_ID) ON DELETE CASCADE
);

CREATE TABLE Lookup_Types (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name_En VARCHAR(100) NOT NULL,
    Name_Ar VARCHAR(100),
    Description VARCHAR(255),
	Is_Active       BIT DEFAULT(1),
    Created_By      NVARCHAR(255),
    Updated_By      NVARCHAR(255),
    Creation_Date   DATETIME DEFAULT GETDATE(),
    Update_Date     DATETIME,
);

CREATE TABLE Lookup_Items (
    Id INT PRIMARY KEY IDENTITY(1,1),
    FK_Lookup_Type INT NOT NULL,
    Value_En VARCHAR(100) NOT NULL,
    Value_Ar VARCHAR(100),
	Is_Active       BIT DEFAULT(1),
    Created_By      NVARCHAR(255),
    Updated_By      NVARCHAR(255),
    Creation_Date   DATETIME DEFAULT GETDATE(),
    Update_Date     DATETIME,
    FOREIGN KEY (FK_Lookup_Type) REFERENCES Lookup_Types(Id)
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
    Id INT PRIMARY KEY IDENTITY(1,1),
    FK_Item_ID INT NOT NULL,
    FK_Option_ID INT NOT NULL,
    Is_Active BIT NOT NULL DEFAULT(1),
    Created_By NVARCHAR(255),
    Updated_By NVARCHAR(255),
    Creation_Date DATETIME DEFAULT GETDATE(),
    Update_Date DATETIME,
	FOREIGN KEY (FK_Item_ID) REFERENCES Items(Item_ID) ON DELETE CASCADE,
	FOREIGN KEY (FK_Option_ID) REFERENCES Options(Option_Id) ON DELETE CASCADE
);

CREATE TABLE Discounts (
    Discount_Id INT PRIMARY KEY IDENTITY(1,1),
    Title_en VARCHAR(255),
    Title_ar VARCHAR(255),
    Description_en VARCHAR(MAX),
    Description_ar VARCHAR(MAX),
    Start_Date DATETIME,
    End_Date DATETIME,
    Limit_Amount FLOAT,
    Code INT,
    FK_Discount_Status INT,
    Is_Active BIT,
    Created_By VARCHAR(100),
    Updated_By VARCHAR(100),
    Created_At DATETIME DEFAULT GETDATE(),
    Update_Date DATETIME,
	FOREIGN KEY (FK_Discount_Status) REFERENCES Lookup_Items(Id) ON DELETE CASCADE
);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY IDENTITY(1,1),
    Client_ID INT REFERENCES Users(UserId) NOT NULL,
    Driver_ID INT REFERENCES Users(UserId) NOT NULL,
    FK_Discount_ID INT,
    FK_Order_Status INT,
    Total_Price FLOAT,
    Is_Active BIT DEFAULT 1,
    Created_By VARCHAR(100),
    Updated_By VARCHAR(100),
    Created_At DATETIME DEFAULT GETDATE(),
    Update_At DATETIME,
	FOREIGN KEY (FK_Discount_ID) REFERENCES Discounts(Discount_Id) ON DELETE NO ACTION,
	FOREIGN KEY (FK_Order_Status) REFERENCES Lookup_Items(Id) ON DELETE CASCADE
);

CREATE TABLE Order_Items (
    OrderItem_ID INT PRIMARY KEY IDENTITY(1,1),
    FK_Order_ID INT,
    FK_Item_ID INT,
    Total_Price FLOAT,
    Item_Price FLOAT,
    Quantity INT,
    Is_Active BIT,
    Created_By VARCHAR(100),
    Updated_By VARCHAR(100),
    Created_At DATETIME DEFAULT GETDATE(),
    Update_Date DATETIME,
	FOREIGN KEY (FK_Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE,
	FOREIGN KEY (FK_Item_ID) REFERENCES Items(Item_ID)
);

CREATE TABLE Orders_History (
    FK_Order_ID INT,
    FK_Client_ID INT REFERENCES Users(UserId) NOT NULL,
    Is_Active BIT DEFAULT 1,
    Created_By VARCHAR(100),
    Updated_By VARCHAR(100),
    Created_At DATETIME DEFAULT GETDATE(),
    Update_Date DATETIME,
    CONSTRAINT PK_OrdersHistory PRIMARY KEY (FK_Order_ID, FK_Client_ID),
	FOREIGN KEY (FK_Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE
);

CREATE TABLE Chats (
    Chat_ID INT PRIMARY KEY IDENTITY(1,1),
    FK_Order_ID INT NOT NULL,
    FK_Client_ID INT REFERENCES Users(UserId) NOT NULL,
    FK_Driver_ID INT REFERENCES Users(UserId) NOT NULL,
    Chat_File_Path VARCHAR(255) NOT NULL, -- Stores path to the JSON file
    Is_active BIT DEFAULT 1,
    Created_By VARCHAR(100),
    Updated_By VARCHAR(100),
    Creation_Date DATETIME DEFAULT GETDATE(),
    Update_Date DATETIME,
	FOREIGN KEY (FK_Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE
);

CREATE TABLE Payments (
    Payment_Id INT PRIMARY KEY IDENTITY(1,1),
    FK_Order_ID INT,
    Client_ID INT REFERENCES Users(UserId) NOT NULL,
    FK_Payment_Method INT,
    Amount FLOAT,
    Paid_At DATETIME,
	Is_Active BIT DEFAULT 1,
    Created_By VARCHAR(100),
    Updated_By VARCHAR(100),
    Created_At DATETIME DEFAULT GETDATE(),
    Update_At DATETIME,
	FOREIGN KEY (FK_Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE,
	FOREIGN KEY (FK_Payment_Method) REFERENCES Lookup_Items(Id)
);

CREATE TABLE DeliveryLocations (
    ID INT PRIMARY KEY IDENTITY(1,1),
    FK_Order_ID INT,
    FK_Client_ID INT REFERENCES Users(UserId) NOT NULL,
    Delivery_Status VARCHAR(50) NOT NULL,
    Delivery_Time DATETIME NOT NULL,
    Title VARCHAR(255),
    Region VARCHAR(255),
    Longitude FLOAT,
    Latitude FLOAT,
    Is_Active BIT DEFAULT 1,
    Created_By VARCHAR(100),
    Updated_By VARCHAR(100),
    Creation_Date DATETIME DEFAULT GETDATE(),
    Update_Date DATETIME,
	FOREIGN KEY (FK_Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE
);

CREATE TABLE Ratings (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Client_ID INT REFERENCES Users(UserId) NOT NULL,
    Order_ID INT,
    Driver_ID INT REFERENCES Users(UserId) NOT NULL,
    Rating_Amount FLOAT,
    Feedback VARCHAR(MAX),
    Is_Active BIT DEFAULT 1,
    Created_By VARCHAR(100),
    Updated_By VARCHAR(100),
    Created_At DATETIME DEFAULT GETDATE(),
    Update_Date DATETIME,
	FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE
);

CREATE TABLE Notifications (
    Id INT PRIMARY KEY IDENTITY(1,1),
    FK_User_ID INT,
    Title VARCHAR(255),
    Message VARCHAR(MAX),
    FK_Notification_Type INT,
    Is_Read BIT,
    Is_Active BIT DEFAULT 1,
    Created_By VARCHAR(100),
    Updated_By VARCHAR(100),
    Created_At DATETIME DEFAULT GETDATE(),
    Update_Date DATETIME,
	FOREIGN KEY (FK_User_ID) REFERENCES Users(UserId) ON DELETE CASCADE,
	FOREIGN KEY (FK_Notification_Type) REFERENCES Lookup_Items(Id)
);

CREATE TABLE Issues_Suggestions (
    Id INT PRIMARY KEY IDENTITY(1,1),
    User_ID INT,
    Title VARCHAR(255),
    Message VARCHAR(MAX),
    FK_Issue_Type INT,
    Status VARCHAR(50),
    Is_Active BIT DEFAULT 1,
    Created_By VARCHAR(100),
    Updated_By VARCHAR(100),
    Created_At DATETIME DEFAULT GETDATE(),
    Update_Date DATETIME,
	FOREIGN KEY (User_ID) REFERENCES Users(UserId) ON DELETE CASCADE,
	FOREIGN KEY (FK_Issue_Type) REFERENCES Lookup_Items(Id)
);

CREATE TABLE Discount_items (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Discount_ID INT,
    Item_ID INT,
    Is_Active BIT DEFAULT 1,
    Created_By VARCHAR(100),
    Updated_By VARCHAR(100),
    Created_At DATETIME DEFAULT GETDATE(),
    Update_Date DATETIME,
	FOREIGN KEY (Discount_ID) REFERENCES Discounts(Discount_Id) ON DELETE CASCADE,
	FOREIGN KEY (Item_ID) REFERENCES Items(Item_ID) ON DELETE CASCADE
);

CREATE TABLE Discount_Categories (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Discount_ID INT,
    Category_ID INT,
    Is_Active BIT DEFAULT 1,
    Created_By VARCHAR(100),
    Updated_By VARCHAR(100),
    Created_At DATETIME DEFAULT GETDATE(),
    Update_Date DATETIME,
	FOREIGN KEY (Discount_ID) REFERENCES Discounts(Discount_Id) ON DELETE CASCADE,
	FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID) ON DELETE CASCADE
);

CREATE TABLE Reports (
    Id INT PRIMARY KEY IDENTITY(1,1),
    User_ID INT,
    Item_ID INT,
    Order_ID INT,
    Title VARCHAR(255),
    Description VARCHAR(MAX),
    Is_Active BIT DEFAULT 1,
    Created_By VARCHAR(100),
    Updated_By VARCHAR(100),
    Created_At DATETIME DEFAULT GETDATE(),
    Update_Date DATETIME,
	FOREIGN KEY (User_ID) REFERENCES Users(UserId) ON DELETE CASCADE,
	FOREIGN KEY (Item_ID) REFERENCES Items(Item_ID) ON DELETE CASCADE,
	FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE
);

CREATE TABLE User_Notifications (
    FK_User_ID INT,
    Notification_Id INT,
    Is_Read BIT DEFAULT 0,
    Is_Active BIT DEFAULT 1,
    Created_By VARCHAR(100),
    Updated_By VARCHAR(100),
    Created_At DATETIME DEFAULT GETDATE(),
    Update_Date DATETIME,
	CONSTRAINT PK_User_Notifications PRIMARY KEY (FK_User_ID, Notification_Id),
	FOREIGN KEY (FK_User_ID) REFERENCES Users(UserId) ON DELETE CASCADE,
	FOREIGN KEY (Notification_Id) REFERENCES Notifications(Id)
);

CREATE TABLE User_Issues_Suggestions (
    User_ID INT,
    Issue_Suggestion_Id INT,
    Is_Active BIT DEFAULT 1,
    Created_By VARCHAR(100),
    Updated_By VARCHAR(100),
    Created_At DATETIME DEFAULT GETDATE(),
    Update_Date DATETIME,
    CONSTRAINT PK_User_Issues_Suggestions PRIMARY KEY (User_ID, Issue_Suggestion_Id),
	FOREIGN KEY (User_ID) REFERENCES Users(UserId) ON DELETE CASCADE,
	FOREIGN KEY (Issue_Suggestion_Id) REFERENCES Issues_Suggestions(Id)
); 

CREATE TABLE Role_Permissions (
    Role_Id INT,
    Permission_Id INT,
    Is_Active BIT DEFAULT 1,
    Created_By VARCHAR(100),
    Updated_By VARCHAR(100),
    Created_At DATETIME DEFAULT GETDATE(),
    Update_Date DATETIME,
    CONSTRAINT PK_Role_Permissions PRIMARY KEY (Role_Id, Permission_Id),
	FOREIGN KEY (Role_Id) REFERENCES Roles(Role_Id) ON DELETE CASCADE,
	FOREIGN KEY (Permission_Id) REFERENCES Permissions(Permission_Id) ON DELETE CASCADE
);

