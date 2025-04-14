-- Create Roles table
CREATE TABLE Roles (
    Role_Id INT PRIMARY KEY IDENTITY(1,1),
    Name_Ar VARCHAR(255) NOT NULL,
    Name_En VARCHAR(255) NOT NULL,
    is_active BIT,
    created_by VARCHAR(100),
    updated_by VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE(),
    update_date DATETIME
)
CREATE TABLE Permissions (
    Permission_Id INT            IDENTITY(1,1) PRIMARY KEY,
    Name          NVARCHAR(100)  NOT NULL,
    Description   NVARCHAR(500)  NULL,
    is_active     BIT            NOT NULL DEFAULT(1),
    created_by    NVARCHAR(255)  NULL,
    updated_by    NVARCHAR(255)  NULL,
    created_at    DATETIME   NULL DEFAULT SYSUTCDATETIME(),
    update_date   DATETIME   NULL
)
---------------------------------------
CREATE TABLE Users (
    User_ID        INT            IDENTITY(1,1) PRIMARY KEY,
    FK_Role_Id        INT            NOT NULL
        CONSTRAINT FK_Users_Roles FOREIGN KEY REFERENCES Roles(Role_Id),
    FullName       NVARCHAR(255)  NOT NULL,
    UserName       NVARCHAR(100)  NOT NULL UNIQUE,
    Email          NVARCHAR(255)  NOT NULL UNIQUE,
    Phone_Number   NVARCHAR(50)   NULL UNIQUE,
    Password_Hash       NVARCHAR(255)  NOT NULL,
    is_active      BIT            NOT NULL DEFAULT(1),
    is_verified    BIT            NOT NULL DEFAULT(0),
    BirthDate      DATE           NULL,
    Image          NVARCHAR(500)  NULL,
    created_by     NVARCHAR(255)  NULL,
    updated_by     NVARCHAR(255)  NULL,
    created_at     DATETIME   NOT NULL DEFAULT SYSUTCDATETIME(),
    update_date    DATETIME  NULL
)

ALTER TABLE Users
ADD CONSTRAINT CHK_Users_EmailDomain
CHECK (
    LOWER(Email) LIKE '%@gmail.com'
 OR LOWER(Email) LIKE '%@hotmail.com'
 OR LOWER(Email) LIKE '%@outlook.com'
 OR LOWER(Email) LIKE '%@zoho.com'
)
----------------------------------------------------
CREATE TABLE Admins (
    id INT IDENTITY(1,1) PRIMARY KEY,
	FK_User_ID INT unique
        CONSTRAINT FK_Admins_Users FOREIGN KEY REFERENCES Users(User_ID)

)

CREATE TABLE Clients (
    id INT IDENTITY(1,1) PRIMARY KEY,
	FK_User_ID INT unique
        CONSTRAINT FK_Clients_Users FOREIGN KEY REFERENCES Users(User_ID)
)

CREATE TABLE Drivers (
     id INT IDENTITY(1,1) PRIMARY KEY,
	FK_User_ID INT unique
        CONSTRAINT FK_Drivers_Users FOREIGN KEY REFERENCES Users(User_ID)
)
------------------------------------
CREATE TABLE Categories (
    Category_ID      INT           IDENTITY(1,1) PRIMARY KEY,
    Category_NameAr  NVARCHAR(100) NOT NULL,
    Category_NameEn  NVARCHAR(100) NOT NULL,
    Image            NVARCHAR(500),
    is_active        BIT DEFAULT(1),
    created_by       NVARCHAR(255) ,
    updated_by       NVARCHAR(255) ,
    created_at       DATETIME  DEFAULT SYSUTCDATETIME(),
    update_date      DATETIME 
)

CREATE TABLE Items (
    Item_ID         INT IDENTITY(1,1) PRIMARY KEY,
    FK_Category_ID  INT NOT NULL
        CONSTRAINT FK_Items_Categories FOREIGN KEY REFERENCES Categories(Category_ID),
    Name_Ar         NVARCHAR(100) NOT NULL,
    Name_En         NVARCHAR(100) NOT NULL,
    Description_Ar  NVARCHAR(MAX) NULL,
    Description_En  NVARCHAR(MAX) NULL,
    Image           NVARCHAR(500) NULL,
    Price           DECIMAL(18,2) NULL,
    is_active       BIT           NULL DEFAULT(1),
    created_by      NVARCHAR(255) NULL,
    updated_by      NVARCHAR(255) NULL,
    creation_date   DATETIME  NULL DEFAULT SYSUTCDATETIME(),
    update_date     DATETIME  NULL
)

CREATE TABLE Options (
    ID             INT           IDENTITY(1,1) PRIMARY KEY,
    Name_Ar        NVARCHAR(100) ,
    Name_En        NVARCHAR(100) ,
    OptionType     NVARCHAR(50)  ,
    isRequired     BIT           DEFAULT(0),
    is_active      BIT           DEFAULT(1),
    created_by     NVARCHAR(255) ,
    updated_by     NVARCHAR(255) ,
    creation_date  DATETIME    DEFAULT SYSUTCDATETIME(),
    update_date    DATETIME 
	)

CREATE TABLE ItemOptions (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Item_ID INT NOT NULL
        CONSTRAINT FK_ItemOptions_Items FOREIGN KEY REFERENCES Items(Item_ID),
    Option_ID INT NOT NULL
        CONSTRAINT FK_ItemOptions_Options FOREIGN KEY REFERENCES Options(ID),
    is_active BIT NOT NULL DEFAULT(1),
    created_by NVARCHAR(255) ,
    updated_by NVARCHAR(255) ,
    creation_date DATETIME DEFAULT SYSUTCDATETIME(),
    update_date DATETIME
)
---------------------------------

CREATE TABLE Discounts (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Title_en VARCHAR(255),
    Title_ar VARCHAR(255),
    Description_en VARCHAR(MAX),
    Description_ar VARCHAR(MAX),
    start_date DATETIME,
    end_date DATETIME,
    Limit_Amount FLOAT,
    code INT,
    FK_Discount_Status INT
        FOREIGN KEY (FK_Discount_Status) REFERENCES Lookup_Items(Id),
    is_active BIT,
    created_by VARCHAR(100),
    updated_by VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE(),
    update_date DATETIME
)
-----------------------------
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY IDENTITY(1,1),
    Client_ID INT NOT NULL,
    Driver_ID INT,
    Discount_ID INT,
    FK_Order_Status INT
        FOREIGN KEY (FK_Order_Status) REFERENCES Lookup_Items(Id),
    Total_Price FLOAT,
    is_active BIT,
    created_by VARCHAR(100),
    updated_by VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE(),
    update_at DATETIME,
    CONSTRAINT FK_Orders_Client FOREIGN KEY (Client_ID) REFERENCES Clients(ID),
    CONSTRAINT FK_Orders_Driver FOREIGN KEY (Driver_ID) REFERENCES Drivers(ID),
    CONSTRAINT FK_Orders_Discount FOREIGN KEY (Discount_ID) REFERENCES Discounts(Id)
);

CREATE TABLE Order_Items (
    OrderItem_ID INT PRIMARY KEY IDENTITY(1,1),
    FK_Order_ID INT,
    FK_Item_ID INT,
    Total_Price FLOAT,
    Item_Price FLOAT,
    Quantity INT,
    is_active BIT,
    created_by VARCHAR(100),
    updated_by VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE(),
    update_date DATETIME,
    CONSTRAINT FK_OrderItems_Order FOREIGN KEY (FK_Order_ID) REFERENCES Orders(Order_ID),
    CONSTRAINT FK_OrderItems_Item FOREIGN KEY (FK_Item_ID) REFERENCES Items(Item_ID)
);

CREATE TABLE Orders_History (
    FK_Order_ID INT,
    FK_Client_ID INT,
    is_active BIT,
    created_by VARCHAR(100),
    updated_by VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE(),
    update_date DATETIME,
    CONSTRAINT PK_OrdersHistory PRIMARY KEY (FK_Order_ID, FK_Client_ID),
    CONSTRAINT FK_OrdersHistory_Order FOREIGN KEY (FK_Order_ID) REFERENCES Orders(Order_ID),
    CONSTRAINT FK_OrdersHistory_Client FOREIGN KEY (FK_Client_ID) REFERENCES Clients(ID)
);
------------------
CREATE TABLE Chats (
    Chat_ID INT PRIMARY KEY IDENTITY(1,1),
    FK_Order_ID INT NOT NULL,
    FK_Client_ID INT NOT NULL,
    FK_Driver_ID INT NOT NULL,
    Chat_File_Path VARCHAR(255) NOT NULL, -- Stores path to the JSON file
    is_active BIT,
    created_by VARCHAR(100),
    updated_by VARCHAR(100),
    creation_date DATETIME DEFAULT GETDATE(),
    update_date DATETIME,
    CONSTRAINT FK_Chats_Order FOREIGN KEY (FK_Order_ID) REFERENCES Orders(Order_ID),
    CONSTRAINT FK_Chats_Client FOREIGN KEY (FK_Client_ID) REFERENCES Clients(ID),
    CONSTRAINT FK_Chats_Driver FOREIGN KEY (FK_Driver_ID) REFERENCES Drivers(ID)
)

CREATE TABLE Payments (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Order_ID INT,
    Client_ID INT,
    FK_Payment_Method INT
        FOREIGN KEY (FK_Payment_Method) REFERENCES Lookup_Items(Id),
    Amount FLOAT,
    Paid_At DATETIME,
    CONSTRAINT FK_Payments_Order FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    CONSTRAINT FK_Payments_Client FOREIGN KEY (Client_ID) REFERENCES Clients(ID)
);

CREATE TABLE DeliveryLocations (
    ID INT PRIMARY KEY IDENTITY(1,1),
    FK_Order_ID INT,
    FK_Client_ID INT,
    Delivery_Status VARCHAR(50) NOT NULL,
    Delivery_Time DATETIME NOT NULL,
    Title VARCHAR(255),
    Region VARCHAR(255),
    Longitude FLOAT,
    Latitude FLOAT,
    is_active BIT,
    created_by VARCHAR(100),
    updated_by VARCHAR(100),
    creation_date DATETIME DEFAULT GETDATE(),
    update_date DATETIME,
    CONSTRAINT FK_DeliveryLocations_Order FOREIGN KEY (FK_Order_ID) REFERENCES Orders(Order_ID),
    CONSTRAINT FK_DeliveryLocations_Client FOREIGN KEY (FK_Client_ID) REFERENCES Clients(ID)
);

CREATE TABLE Ratings (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Client_ID INT,
    Order_ID INT,
    Driver_ID INT,
    Rating_Amount FLOAT,
    Feedback VARCHAR(MAX),
    is_active BIT,
    created_by VARCHAR(100),
    updated_by VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE(),
    update_date DATETIME,
    CONSTRAINT FK_Ratings_Client FOREIGN KEY (Client_ID) REFERENCES Clients(ID),
    CONSTRAINT FK_Ratings_Order FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    CONSTRAINT FK_Ratings_Driver FOREIGN KEY (Driver_ID) REFERENCES Drivers(ID)
);
-------------------
CREATE TABLE Notifications (
    Id INT PRIMARY KEY IDENTITY(1,1),
    User_ID INT,
    Title VARCHAR(255),
    Message VARCHAR(MAX),
    FK_Notification_Type INT
        FOREIGN KEY (FK_Notification_Type) REFERENCES Lookup_Items(Id),
    is_read BIT,
    is_active BIT,
    created_by VARCHAR(100),
    updated_by VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE(),
    update_date DATETIME,
    CONSTRAINT FK_Notifications_User FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

CREATE TABLE Issues_Suggestions (
    Id INT PRIMARY KEY IDENTITY(1,1),
    User_ID INT,
    Title VARCHAR(255),
    Message VARCHAR(MAX),
     FK_Issue_Type INT
        FOREIGN KEY (FK_Issue_Type) REFERENCES Lookup_Items(Id),
    status VARCHAR(50),
    is_active BIT,
    created_by VARCHAR(100),
    updated_by VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE(),
    update_date DATETIME,
    CONSTRAINT FK_IssuesSuggestions_User FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);


CREATE TABLE Discount_items (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Discount_ID INT,
    Item_ID INT,
    is_active BIT,
    created_by VARCHAR(100),
    updated_by VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE(),
    update_date DATETIME,
    CONSTRAINT FK_DiscountItems_Discount FOREIGN KEY (Discount_ID) REFERENCES Discounts(Id),
    CONSTRAINT FK_DiscountItems_Item FOREIGN KEY (Item_ID) REFERENCES Items(Item_ID)
);

CREATE TABLE Discount_Categories (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Discount_ID INT,
    Category_ID INT,
    is_active BIT,
    created_by VARCHAR(100),
    updated_by VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE(),
    update_date DATETIME,
    CONSTRAINT FK_DiscountCategories_Discount FOREIGN KEY (Discount_ID) REFERENCES Discounts(Id),
    CONSTRAINT FK_DiscountCategories_Category FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID)
);

-------------------
CREATE TABLE Reports (
    Id INT PRIMARY KEY IDENTITY(1,1),
    User_ID INT,
    Item_ID INT,
    Order_ID INT,
    Title VARCHAR(255),
    Description VARCHAR(MAX),
    is_active BIT,
    created_by VARCHAR(100),
    updated_by VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE(),
    update_date DATETIME,
    CONSTRAINT FK_Reports_User FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
    CONSTRAINT FK_Reports_Item FOREIGN KEY (Item_ID) REFERENCES Items(Item_ID),
    CONSTRAINT FK_Reports_Order FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

CREATE TABLE User_Notifications (
    FK_User_ID INT,
    Notification_Id INT,
    is_read BIT DEFAULT 0,
    is_active BIT DEFAULT 1,
    created_by VARCHAR(100),
    updated_by VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE(),
    update_date DATETIME,
    CONSTRAINT PK_User_Notifications PRIMARY KEY (FK_User_ID, Notification_Id),
    CONSTRAINT FK_UserNotifications_Users FOREIGN KEY (FK_User_ID) REFERENCES Users(User_ID),
    CONSTRAINT FK_UserNotifications_Notifications FOREIGN KEY (Notification_Id) REFERENCES Notifications(Id)
);

CREATE TABLE User_Issues_Suggestions (
    User_ID INT,
    Issue_Suggestion_Id INT,
    is_active BIT DEFAULT 1,
    created_by VARCHAR(100),
    updated_by VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE(),
    update_date DATETIME,
    CONSTRAINT PK_User_Issues_Suggestions PRIMARY KEY (User_ID, Issue_Suggestion_Id),
    CONSTRAINT FK_UserIssuesSuggestions_Users FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
    CONSTRAINT FK_UserIssuesSuggestions_IssuesSuggestions FOREIGN KEY (Issue_Suggestion_Id) REFERENCES Issues_Suggestions(Id)
); 

CREATE TABLE Role_Permissions (
    Role_Id INT,
    Permission_Id INT,
    is_active BIT DEFAULT 1,
    created_by VARCHAR(100),
    updated_by VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE(),
    update_date DATETIME,
    CONSTRAINT PK_Role_Permissions PRIMARY KEY (Role_Id, Permission_Id),
    CONSTRAINT FK_RolePermissions_Role FOREIGN KEY (Role_Id) REFERENCES Roles(Role_Id),
    CONSTRAINT FK_RolePermissions_Permission FOREIGN KEY (Permission_Id) REFERENCES Permissions(Permission_Id)
);

-- Table to define the type/category of lookup
CREATE TABLE Lookup_Types (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name_En VARCHAR(100) NOT NULL,
    Name_Ar VARCHAR(100) NULL,
    Description VARCHAR(255) NULL
);

-- Table to define each value (item) under each type
CREATE TABLE Lookup_Items (
    Id INT PRIMARY KEY IDENTITY(1,1),
    FK_Lookup_Type INT NOT NULL,
    Value_En VARCHAR(100) NOT NULL,
    Value_Ar VARCHAR(100),
    is_active BIT DEFAULT 1,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (FK_Lookup_Type) REFERENCES Lookup_Types(Id)
);