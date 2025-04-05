-- Insert Roles
INSERT INTO Roles (Name_Ar, Name_En, is_active)
VALUES 
('مدير', 'Admin', 1),
('عميل', 'Client', 1),
('سائق', 'Driver', 1);

-- Insert Permissions
INSERT INTO Permissions (Name, Description, is_active)
VALUES
('manage_users', 'Can manage all users in the system', 1),
('manage_orders', 'Can manage orders', 1),
('manage_items', 'Can manage menu items', 1),
('place_orders', 'Can place new orders', 1),
('deliver_orders', 'Can deliver orders', 1);

-- Insert Role Permissions
INSERT INTO Role_Permissions (Role_Id, Permission_Id)
VALUES
(1, 1), (1, 2), (1, 3), -- Admin has all permissions
(2, 4), -- Client can place orders
(3, 5); -- Driver can deliver orders

-- Insert Users
INSERT INTO Users (FK_Role_Id, FullName, UserName, Email, Phone_Number, Password_Hash, is_active, is_verified)
VALUES
(1, 'Admin User', 'admin1', 'admin@gmail.com', '+1234567890', 'hashed_password_1', 1, 1),
(2, 'John Smith', 'john_smith', 'john.smith@gmail.com', '+1234567891', 'hashed_password_2', 1, 1),
(2, 'Sarah Wilson', 'sarah_w', 'sarah.w@hotmail.com', '+1234567892', 'hashed_password_3', 1, 1),
(3, 'Mike Driver', 'mike_d', 'mike.d@gmail.com', '+1234567893', 'hashed_password_4', 1, 1);

-- Insert into role-specific tables
INSERT INTO Admins (FK_User_ID) VALUES (1);
INSERT INTO Clients (FK_User_ID) VALUES (2), (3);
INSERT INTO Drivers (FK_User_ID) VALUES (4);

-- Insert Categories
INSERT INTO Categories (Category_NameAr, Category_NameEn, is_active)
VALUES
('برجر', 'Burgers', 1),
('بيتزا', 'Pizza', 1),
('مشروبات', 'Beverages', 1);

-- Insert Items
INSERT INTO Items (FK_Category_ID, Name_Ar, Name_En, Description_En, Price, is_active)
VALUES
(1, 'تشيز برجر', 'Cheeseburger', 'Classic beef burger with cheese', 9.99, 1),
(1, 'تشيكن برجر', 'Chicken Burger', 'Grilled chicken burger', 8.99, 1),
(2, 'بيتزا مارجريتا', 'Margherita Pizza', 'Classic tomato and cheese pizza', 12.99, 1),
(3, 'كولا', 'Cola', 'Refreshing cola drink', 2.99, 1);

-- Insert Options
INSERT INTO Options (Name_Ar, Name_En, OptionType, isRequired)
VALUES
('الحجم', 'Size', 'single', 1),
('إضافات', 'Extra Toppings', 'multiple', 0);

-- Insert Orders
INSERT INTO Orders (Client_ID, Driver_ID, Order_Status, Total_Price)
VALUES
(1, 1, 'Delivered', 22.97),
(2, 1, 'In Progress', 15.98);

-- Insert Order Items
INSERT INTO Order_Items (FK_Order_ID, FK_Item_ID, Total_Price, Item_Price, Quantity)
VALUES
(1, 1, 19.98, 9.99, 2),
(1, 4, 2.99, 2.99, 1),
(2, 2, 15.98, 8.99, 2);

-- Insert Ratings
INSERT INTO Ratings (Client_ID, Order_ID, Driver_ID, Rating_Amount, Feedback)
VALUES
(1, 1, 1, 4.5, 'Great service and fast delivery!');

-- Insert DeliveryLocations
INSERT INTO DeliveryLocations (FK_Order_ID, FK_Client_ID, Delivery_Status, Delivery_Time, Title, Region, Longitude, Latitude)
VALUES
(1, 1, 'Delivered', '2024-03-10 14:30:00', 'Home', 'Downtown', 35.1234, 31.5678);

-- Insert Payments
INSERT INTO Payments (Order_ID, Client_ID, Payment_Method, Amount, Paid_At)
VALUES
(1, 1, 'Credit Card', 22.97, '2024-03-10 14:00:00'),
(2, 2, 'Cash', 15.98, '2024-03-10 15:30:00');