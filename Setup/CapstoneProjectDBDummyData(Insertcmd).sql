USE [E-Food Management System]

INSERT INTO Roles (Name_Ar, Name_En, Is_Active, Created_By, Created_At)
VALUES (N'مدير النظام', 'System Administrator', 1, 'SeederScript', GETDATE());

INSERT INTO Roles (Name_Ar, Name_En, Is_Active, Created_By, Created_At)
VALUES (N'مدير', 'Manager', 1, 'SeederScript', GETDATE());

INSERT INTO Roles (Name_Ar, Name_En, Is_Active, Created_By, Created_At)
VALUES (N'موظف دعم', 'Support Staff', 1, 'SeederScript', GETDATE());

INSERT INTO Roles (Name_Ar, Name_En, Is_Active, Created_By, Created_At)
VALUES (N'مندوب توصيل', 'Delivery Agent', 1, 'SeederScript', GETDATE());

INSERT INTO Roles (Name_Ar, Name_En, Is_Active, Created_By, Created_At)
VALUES (N'مستخدم', 'User', 1, 'SeederScript', GETDATE());

INSERT INTO Roles (Name_Ar, Name_En, Is_Active, Created_By, Created_At)
VALUES (N'محاسب', 'Accountant', 1, 'SeederScript', GETDATE());

INSERT INTO Roles (Name_Ar, Name_En, Is_Active, Created_By, Created_At)
VALUES (N'مشرف', 'Supervisor', 1, 'SeederScript', GETDATE());

INSERT INTO Roles (Name_Ar, Name_En, Is_Active, Created_By, Created_At)
VALUES (N'مطور', 'Developer', 1, 'SeederScript', GETDATE());

INSERT INTO Roles (Name_Ar, Name_En, Is_Active, Created_By, Created_At)
VALUES (N'مسؤول مشتريات', 'Procurement Officer', 1, 'SeederScript', GETDATE());

INSERT INTO Roles (Name_Ar, Name_En, Is_Active, Created_By, Created_At)
VALUES (N'مسؤول خدمة العملاء', 'Customer Service', 1, 'SeederScript', GETDATE());

INSERT INTO Permissions (Name, Description, Is_Active, Created_By, Created_At)
VALUES (N'عرض المستخدمين', N'السماح بعرض قائمة المستخدمين', 1, 'SeederScript', GETDATE());

INSERT INTO Permissions (Name, Description, Is_Active, Created_By, Created_At)
VALUES (N'إدارة المستخدمين', N'السماح بإدارة المستخدمين', 1, 'SeederScript', GETDATE());

INSERT INTO Permissions (Name, Description, Is_Active, Created_By, Created_At)
VALUES (N'عرض الطلبات', N'السماح بعرض الطلبات', 1, 'SeederScript', GETDATE());

INSERT INTO Permissions (Name, Description, Is_Active, Created_By, Created_At)
VALUES (N'إدارة الطلبات', N'السماح بإدارة الطلبات', 1, 'SeederScript', GETDATE());

INSERT INTO Permissions (Name, Description, Is_Active, Created_By, Created_At)
VALUES (N'إدارة الأصناف', N'السماح بإدارة الأصناف', 1, 'SeederScript', GETDATE());

INSERT INTO Permissions (Name, Description, Is_Active, Created_By, Created_At)
VALUES (N'إدارة الفئات', N'السماح بإدارة الفئات', 1, 'SeederScript', GETDATE());

INSERT INTO Permissions (Name, Description, Is_Active, Created_By, Created_At)
VALUES (N'مشاهدة التقارير', N'السماح بمشاهدة التقارير', 1, 'SeederScript', GETDATE());

INSERT INTO Permissions (Name, Description, Is_Active, Created_By, Created_At)
VALUES (N'إدارة الإشعارات', N'السماح بإرسال الإشعارات', 1, 'SeederScript', GETDATE());

INSERT INTO Permissions (Name, Description, Is_Active, Created_By, Created_At)
VALUES (N'التحكم في الأدوار', N'السماح بتعديل الأدوار والصلاحيات', 1, 'SeederScript', GETDATE());

INSERT INTO Permissions (Name, Description, Is_Active, Created_By, Created_At)
VALUES (N'إدارة المدفوعات', N'السماح بمراجعة المدفوعات', 1, 'SeederScript', GETDATE());

INSERT INTO Categories (Category_NameAr, Category_NameEn, Is_Active, Created_By, Created_At)
VALUES (N'الوجبات السريعة', 'Fast Food', 1, 'SeederScript', GETDATE());

INSERT INTO Categories (Category_NameAr, Category_NameEn, Is_Active, Created_By, Created_At)
VALUES (N'المشروبات', 'Beverages', 1, 'SeederScript', GETDATE());

INSERT INTO Categories (Category_NameAr, Category_NameEn, Is_Active, Created_By, Created_At)
VALUES (N'الحلويات', 'Desserts', 1, 'SeederScript', GETDATE());

INSERT INTO Categories (Category_NameAr, Category_NameEn, Is_Active, Created_By, Created_At)
VALUES (N'الوجبات الصحية', 'Healthy Meals', 1, 'SeederScript', GETDATE());

INSERT INTO Categories (Category_NameAr, Category_NameEn, Is_Active, Created_By, Created_At)
VALUES (N'المقبلات', 'Appetizers', 1, 'SeederScript', GETDATE());

INSERT INTO Categories (Category_NameAr, Category_NameEn, Is_Active, Created_By, Created_At)
VALUES (N'الأطعمة النباتية', 'Vegetarian', 1, 'SeederScript', GETDATE());

INSERT INTO Categories (Category_NameAr, Category_NameEn, Is_Active, Created_By, Created_At)
VALUES (N'المعجنات', 'Pastries', 1, 'SeederScript', GETDATE());

INSERT INTO Categories (Category_NameAr, Category_NameEn, Is_Active, Created_By, Created_At)
VALUES (N'اللحوم المشوية', 'Grilled Meats', 1, 'SeederScript', GETDATE());

INSERT INTO Categories (Category_NameAr, Category_NameEn, Is_Active, Created_By, Created_At)
VALUES (N'البيتزا', 'Pizza', 1, 'SeederScript', GETDATE());

INSERT INTO Categories (Category_NameAr, Category_NameEn, Is_Active, Created_By, Created_At)
VALUES (N'الساندويتشات', 'Sandwiches', 1, 'SeederScript', GETDATE());

INSERT INTO Notifications (Title, Message, Created_By, Created_At)
VALUES (N'تحديث جديد!', N'تم إطلاق ميزة تقييم الطلبات.', 'SeederScript', GETDATE());

INSERT INTO Notifications (Title, Message, Created_By, Created_At)
VALUES (N'عروض حصرية', N'احصل على خصم 20% عند الطلب لأول مرة.', 'SeederScript', GETDATE());

INSERT INTO Notifications (Title, Message, Created_By, Created_At)
VALUES (N'تنبيه أمني', N'تم تسجيل دخول جديد من جهاز غير معروف.', 'SeederScript', GETDATE());

INSERT INTO Notifications (Title, Message, Created_By, Created_At)
VALUES (N'تذكير', N'لا تنسَ إكمال طلبك قبل انتهاء العرض!', 'SeederScript', GETDATE());

INSERT INTO Notifications (Title, Message, Created_By, Created_At)
VALUES (N'صيانة مجدولة', N'سيتم إيقاف التطبيق مؤقتًا الساعة 2 صباحًا.', 'SeederScript', GETDATE());

INSERT INTO Notifications (Title, Message, Created_By, Created_At)
VALUES (N'مفاجأة اليوم', N'وجبة مجانية عند شراء 3 وجبات.', 'SeederScript', GETDATE());

INSERT INTO Notifications (Title, Message, Created_By, Created_At)
VALUES (N'معلومة مفيدة', N'هل تعلم أن بإمكانك تحديد عنوانين للتوصيل؟', 'SeederScript', GETDATE());

INSERT INTO Notifications (Title, Message, Created_By, Created_At)
VALUES (N'رسالة من الإدارة', N'نحن نعمل دائمًا على تحسين تجربتك.', 'SeederScript', GETDATE());

INSERT INTO Notifications (Title, Message, Created_By, Created_At)
VALUES (N'تنبيه مهم', N'يرجى تحديث التطبيق للحصول على الميزات الجديدة.', 'SeederScript', GETDATE());

INSERT INTO Notifications (Title, Message, Created_By, Created_At)
VALUES (N'عطلة نهاية الأسبوع', N'كل الطلبات خلال عطلة نهاية الأسبوع تشمل مشروب مجاني.', 'SeederScript', GETDATE());

INSERT INTO Lookup_Types (Name_Ar, Name_En, Is_Active, Created_By, Creation_Date)
VALUES (N'أنواع البلاغات', 'Issue Types', 1, 'SeederScript', GETDATE());

-- 1 = Suggestion, 2 = Issue
INSERT INTO Lookup_Items (FK_Lookup_Type, Value_Ar, Value_En, Is_Active, Created_By, Creation_Date)
VALUES 
(1, N'اقتراح', 'Suggestion', 1, 'SeederScript', GETDATE()),
(1, N'مشكلة', 'Issue', 1, 'SeederScript', GETDATE());

-- Use 1 for Suggestion, 2 for Issue
INSERT INTO Issues_Suggestions (FK_Issue_Type, Message, Created_By, Created_At)
VALUES 
(1, N'إضافة طرق دفع جديدة مثل Apple Pay.', 'SeederScript', GETDATE()),

(2, N'تطبيق الجوال يتوقف فجأة أثناء التصفح.', 'SeederScript', GETDATE()),

(1, N'إضافة تقييمات للمطاعم.', 'SeederScript', GETDATE()),

(2, N'فشل في إتمام الطلب بعد الدفع.', 'SeederScript', GETDATE()),

(1, N'توفير دعم لغات متعددة.', 'SeederScript', GETDATE()),

(2, N'صعوبة في تسجيل الدخول.', 'SeederScript', GETDATE()),

(1, N'إمكانية جدولة الطلبات لاحقًا.', 'SeederScript', GETDATE()),

(2, N'صور المنتجات لا تظهر بشكل صحيح.', 'SeederScript', GETDATE()),

(1, N'إضافة فلتر حسب السعر.', 'SeederScript', GETDATE()),

(2, N'لا يمكن تعديل العنوان من الحساب.', 'SeederScript', GETDATE());

-- 2: حالة الطلب
INSERT INTO Lookup_Types(Name_Ar, Name_En, Is_Active, Created_By, Creation_Date)
VALUES (N'حالة الطلب', 'Order Status', 1, 'SeederScript', GETDATE());

-- 3: طرق الدفع
INSERT INTO Lookup_Types(Name_Ar, Name_En, Is_Active, Created_By, Creation_Date)
VALUES (N'طرق الدفع', 'Payment Methods', 1, 'SeederScript', GETDATE());

INSERT INTO Lookup_Items (FK_Lookup_Type, Value_Ar, Value_En, Is_Active, Created_By, Creation_Date)
VALUES 
(2, N'جديد', 'New', 1, 'SeederScript', GETDATE()),
(2, N'قيد التحضير', 'Preparing', 1, 'SeederScript', GETDATE()),
(2, N'قيد التوصيل', 'Delivering', 1, 'SeederScript', GETDATE()),
(2, N'تم التوصيل', 'Delivered', 1, 'SeederScript', GETDATE()),
(2, N'ملغي', 'Cancelled', 1, 'SeederScript', GETDATE());

INSERT INTO Lookup_Items (FK_Lookup_Type, Value_Ar, Value_En, Is_Active, Created_By, Creation_Date)
VALUES 
(3, N'نقدًا عند التسليم', 'Cash on Delivery', 1, 'SeederScript', GETDATE()),
(3, N'بطاقة ائتمان', 'Credit Card', 1, 'SeederScript', GETDATE()),
(3, N'تحويل بنكي', 'Bank Transfer', 1, 'SeederScript', GETDATE()),
(3, N'Apple Pay', 'Apple Pay', 1, 'SeederScript', GETDATE()),
(3, N'مدى', 'Mada', 1, 'SeederScript', GETDATE());

INSERT INTO Roles (Name_Ar, Name_En, Is_Active, Created_By, Created_At)
VALUES 
(N'مدير', 'Admin', 1, 'SeederScript', GETDATE()),
(N'عميل', 'Client', 1, 'SeederScript', GETDATE()),
(N'مندوب توصيل', 'Delivery', 1, 'SeederScript', GETDATE());

SET IDENTITY_INSERT Users ON;

INSERT INTO Users (UserId, Full_Name, UserName, Email, Phone_Number, Password_Hash, Role_Id, IsActive, Created_By, Created_At)
VALUES 
(1, N'خالد المدير', 'Khalid55', 'admin1@gmail.com', '0550000001', 'hashed_pass1', 1, 1, 'SeederScript', GETDATE()),
(2, N'مها المديرة', 'Maha02','admin2@gmail.com', '0550000002', 'hashed_pass2', 1, 1, 'SeederScript', GETDATE()),
(3, N'أحمد الزهراني', 'Ahmad03', 'ahmad@gmail.com', '0550000003', 'hashed_pass3', 2, 1, 'SeederScript', GETDATE()),
(4, N'نورة الشهري', 'Noura04', 'noura@gmail.com', '0550000004', 'hashed_pass4', 2, 1, 'SeederScript', GETDATE()),
(5, N'علي القحطاني', 'Ali05', 'ali@gmail.com', '0550000005', 'hashed_pass5', 2, 1, 'SeederScript', GETDATE()),
(6, N'سارة العتيبي', 'Sara06', 'sarah@gmail.com', '0550000006', 'hashed_pass6', 2, 1, 'SeederScript', GETDATE()),
(7, N'محمد المطيري', 'Mohammad07', 'mohammed@gmail.com', '0550000007', 'hashed_pass7', 2, 1, 'SeederScript', GETDATE()),
(8, N'سلمان التميمي', 'Sulieman08', 'salman@gmail.com', '0550000008', 'hashed_pass8', 3, 1, 'SeederScript', GETDATE()),
(9, N'ليلى الحربي', 'Layla09', 'layla@gmail.com', '0550000009', 'hashed_pass9', 3, 1, 'SeederScript', GETDATE()),
(10, N'فهد العنزي', 'Fahid10', 'fahad@gmail.com', '0550000010', 'hashed_pass10', 3, 1, 'SeederScript', GETDATE());

SET IDENTITY_INSERT Users OFF;

ALTER TABLE Orders
ALTER COLUMN Driver_ID INT NULL;


INSERT INTO Orders (Client_ID, Driver_ID, FK_Order_Status, Total_Price, Created_By, Created_At)
VALUES
(3, 8, 1, 120.00, 'SeederScript', GETDATE()),
(4, 9, 2, 75.50,  'SeederScript', GETDATE()),
(5, NULL, 1, 200.00, 'SeederScript', GETDATE()),
(6, 10, 3, 60.00, 'SeederScript', GETDATE()),
(7, NULL, 1, 150.00, 'SeederScript', GETDATE()),
(3, 8, 4, 180.25, 'SeederScript', GETDATE()),
(4, NULL, 5, 90.00, 'SeederScript', GETDATE()),
(5, 10, 2, 65.00, 'SeederScript', GETDATE()),
(6, NULL, 1, 110.00, 'SeederScript', GETDATE()),
(7, 9, 3, 250.00, 'SeederScript', GETDATE());

INSERT INTO Items (Name_Ar, Name_En, FK_Category_ID, Description_Ar, Price, Is_Active, Created_By, Creation_Date)
VALUES
(N'برجر دجاج', 'Chicken Burger', 1, N'لحم دجاج طازج مع الخس والجبنة.', 25.00, 1, 'SeederScript', GETDATE()),
(N'بيتزا خضار', 'Veggie Pizza', 9, N'بيتزا مع مجموعة من الخضروات الطازجة.', 30.00, 1, 'SeederScript', GETDATE()),
(N'عصير برتقال', 'Orange Juice', 2, N'عصير طبيعي بدون سكر.', 10.00, 1, 'SeederScript', GETDATE()),
(N'حلى تشيز كيك', 'Cheesecake', 3, N'تشيز كيك فراولة لذيذ.', 18.00, 1, 'SeederScript', GETDATE()),
(N'ساندويتش شاورما', 'Shawarma Sandwich', 10, N'شاورما دجاج بالثوم والخيار.', 20.00, 1, 'SeederScript', GETDATE());

INSERT INTO Options (Name_Ar, Name_En, OptionType, Is_Required, Is_Active, Created_By, Updated_By, Creation_Date, Update_Date)
VALUES 
(N'تمكين الإشعارات', 'Enable Notifications', 'Boolean', 1, 1, 'SeederScript', NULL, GETDATE(), NULL),

(N'عدد العناصر في الصفحة', 'Items Per Page', 'Integer', 1, 1, 'SeederScript', NULL, GETDATE(), NULL),

(N'وضع الصيانة', 'Maintenance Mode', 'Boolean', 0, 0, 'SeederScript', NULL, GETDATE(), NULL),

(N'لغة الواجهة الافتراضية', 'Default Language', 'Text', 1, 1, 'SeederScript', NULL, GETDATE(), NULL),

(N'تفعيل ميزة التوصيل السريع', 'Enable Fast Delivery', 'Boolean', 0, 1, 'SeederScript', NULL, GETDATE(), NULL);

INSERT INTO ItemOptions (FK_Item_ID, FK_Option_ID, Is_Active, Created_By, Updated_By, Creation_Date, Update_Date)
VALUES 
(1, 1, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Chicken Burger + Enable Notifications
(1, 2, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Chicken Burger + Items Per Page
(2, 3, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Veggie Pizza + Maintenance Mode
(3, 4, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Orange Juice + Default Language
(5, 5, 1, 'SeederScript', NULL, GETDATE(), NULL); -- Shawarma Sandwich + Enable Fast Delivery

INSERT INTO DeliveryLocations (FK_Order_ID, FK_Client_ID, Delivery_Status, Delivery_Time, Title, Region, Longitude, Latitude, Is_Active, Created_By, Updated_By, Creation_Date, Update_Date)
VALUES
(7, 3, 'Delivered', DATEADD(MINUTE, -45, GETDATE()), 'Home Address', 'Riyadh', 46.6753, 24.7136, 1, 'SeederScript', NULL, GETDATE(), NULL),

(8, 4, 'Out for Delivery', DATEADD(MINUTE, -15, GETDATE()), 'Workplace', 'Jeddah', 39.1979, 21.4858, 1, 'SeederScript', NULL, GETDATE(), NULL),

(9, 5, 'Pending', DATEADD(MINUTE, 30, GETDATE()), 'My Apartment', 'Dammam', 50.1033, 26.4207, 1, 'SeederScript', NULL, GETDATE(), NULL),

(10, 6, 'Preparing', DATEADD(MINUTE, 10, GETDATE()), 'Family Home', 'Medina', 39.6122, 24.5247, 1, 'SeederScript', NULL, GETDATE(), NULL),

(11, 7, 'Cancelled', DATEADD(MINUTE, -60, GETDATE()), 'Old Address', 'Makkah', 39.8262, 21.3891, 0, 'SeederScript', NULL, GETDATE(), NULL);

INSERT INTO Lookup_Types (Name_Ar, Name_En, Is_Active, Created_By, Creation_Date)
VALUES (N'حالة الخصم', 'Discount Status', 1, 'SeederScript', GETDATE());

-- FK_Lookup_Type = 4 → Discount Status
INSERT INTO Lookup_Items (FK_Lookup_Type, Value_Ar, Value_En, Is_Active, Created_By, Creation_Date)
VALUES
(4, N'جديد', 'New', 1, 'SeederScript', GETDATE()),
(4, N'ساري', 'Active', 1, 'SeederScript', GETDATE()),
(4, N'منتهي', 'Expired', 1, 'SeederScript', GETDATE()),
(4, N'ملغي', 'Cancelled', 1, 'SeederScript', GETDATE()),
(4, N'مؤجل', 'Pending', 1, 'SeederScript', GETDATE());

INSERT INTO Discounts 
(Title_en, Title_ar, Description_en, Description_ar, Start_Date, End_Date, Limit_Amount, Code, FK_Discount_Status, Is_Active, Created_By, Updated_By, Created_At, Update_Date)
VALUES
(
  'Eid Special Offer', 
  N'عرض خاص للعيد', 
  'Get 20% off on all items during Eid holidays.', 
  N'احصل على خصم 20٪ على جميع الطلبات خلال عطلة العيد.', 
  '2025-04-05', 
  '2025-04-20', 
  100.00, 
  202504, 
  4, 
  1, 
  'SeederScript', 
  NULL, 
  GETDATE(), 
  NULL
),
(
  'Weekend Deal', 
  N'عرض نهاية الأسبوع', 
  'Enjoy 15% off this weekend only!', 
  N'استمتع بخصم 15٪ خلال عطلة نهاية الأسبوع فقط!', 
  '2025-04-18', 
  '2025-04-20', 
  50.00, 
  202518, 
  4, 
  1, 
  'SeederScript', 
  NULL, 
  GETDATE(), 
  NULL
),
(
  'Free Delivery Campaign', 
  N'حملة توصيل مجاني', 
  'Orders over 80 SAR get free delivery.', 
  N'الطلبات التي تتجاوز 80 ريالًا تحصل على توصيل مجاني.', 
  '2025-04-10', 
  '2025-04-25', 
  80.00, 
  202580, 
  4, 
  1, 
  'SeederScript', 
  NULL, 
  GETDATE(), 
  NULL
),
(
  'First Order Discount', 
  N'خصم الطلب الأول', 
  '25% discount for first-time customers.', 
  N'خصم 25٪ للعملاء الجدد في أول طلب.', 
  '2025-04-01', 
  '2025-05-01', 
  0.00, 
  202501, 
  4, 
  1, 
  'SeederScript', 
  NULL, 
  GETDATE(), 
  NULL
),
(
  'Flash Sale', 
  N'تخفيضات خاطفة', 
  'Limited-time 10% discount across all categories.', 
  N'خصم 10٪ على جميع الأصناف لفترة محدودة.', 
  '2025-04-19', 
  '2025-04-19', 
  30.00, 
  202510, 
  4, 
  0, 
  'SeederScript', 
  NULL, 
  GETDATE(), 
  NULL
);

INSERT INTO Discount_Categories (Discount_ID, Category_ID, Is_Active, Created_By, Updated_By, Created_At, Update_Date)
VALUES
(1, 1, 1, 'SeederScript', NULL, GETDATE(), NULL),  -- Eid Offer applies to Fast Food
(1, 2, 1, 'SeederScript', NULL, GETDATE(), NULL),  -- Eid Offer applies to Beverages
(2, 3, 1, 'SeederScript', NULL, GETDATE(), NULL),  -- Weekend Deal on Desserts
(3, 9, 1, 'SeederScript', NULL, GETDATE(), NULL),  -- Free Delivery for Pizza
(4, 10, 1, 'SeederScript', NULL, GETDATE(), NULL), -- First Order for Sandwiches
(5, 1, 1, 'SeederScript', NULL, GETDATE(), NULL),  -- Flash Sale also on Fast Food
(5, 4, 1, 'SeederScript', NULL, GETDATE(), NULL),  -- Flash Sale on Healthy Meals
(2, 7, 1, 'SeederScript', NULL, GETDATE(), NULL),  -- Weekend Deal on Pastries
(3, 5, 1, 'SeederScript', NULL, GETDATE(), NULL),  -- Free Delivery on Appetizers
(4, 6, 1, 'SeederScript', NULL, GETDATE(), NULL);  -- First Order for Vegetarian

INSERT INTO Discount_Items (Discount_ID, Item_ID, Is_Active, Created_By, Updated_By, Created_At, Update_Date)
VALUES
(1, 1, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Eid Offer on Chicken Burger
(2, 2, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Weekend Deal on Veggie Pizza
(3, 3, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Free Delivery on Orange Juice
(4, 4, 1, 'SeederScript', NULL, GETDATE(), NULL), -- First Order Discount on Cheesecake
(5, 5, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Flash Sale on Shawarma Sandwich
(2, 4, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Weekend Deal also on Cheesecake
(3, 2, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Free Delivery on Veggie Pizza
(4, 1, 1, 'SeederScript', NULL, GETDATE(), NULL), -- First Order also on Chicken Burger
(5, 3, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Flash Sale on Orange Juice
(1, 5, 1, 'SeederScript', NULL, GETDATE(), NULL); -- Eid Offer on Shawarma Sandwich

INSERT INTO Order_Items (FK_Order_ID, FK_Item_ID, Total_Price, Item_Price, Quantity, Is_Active, Created_By, Updated_By, Created_At, Update_Date)
VALUES
(7, 1, 50.00, 25.00, 2, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Chicken Burger x2
(8, 2, 60.00, 30.00, 2, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Veggie Pizza x2
(9, 3, 30.00, 10.00, 3, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Orange Juice x3
(10, 4, 36.00, 18.00, 2, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Cheesecake x2
(11, 5, 40.00, 20.00, 2, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Shawarma Sandwich x2
(12, 2, 90.00, 30.00, 3, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Veggie Pizza x3
(13, 1, 75.00, 25.00, 3, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Chicken Burger x3
(14, 3, 20.00, 10.00, 2, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Orange Juice x2
(15, 5, 60.00, 20.00, 3, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Shawarma x3
(16, 4, 18.00, 18.00, 1, 1, 'SeederScript', NULL, GETDATE(), NULL); -- Cheesecake x1

INSERT INTO Orders_History (FK_Order_ID, FK_Client_ID, Is_Active, Created_By, Updated_By, Created_At, Update_Date)
VALUES
(7, 3, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Order 1 by Client 3
(8, 4, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Order 2 by Client 4
(9, 5, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Order 3 by Client 5
(10, 6, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Order 4 by Client 6
(11, 7, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Order 5 by Client 7
(12, 3, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Order 6 by Client 3
(13, 4, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Order 7 by Client 4
(14, 5, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Order 8 by Client 5
(15, 6, 1, 'SeederScript', NULL, GETDATE(), NULL), -- Order 9 by Client 6
(16, 7, 1, 'SeederScript', NULL, GETDATE(), NULL); -- Order 10 by Client 7

INSERT INTO Payments (FK_Order_ID, Client_ID, FK_Payment_Method, Amount, Paid_At, Is_Active, Created_By, Updated_By, Created_At, Update_At)
VALUES
(7, 3, 11, 120.00, GETDATE(), 1, 'SeederScript', NULL, GETDATE(), NULL),  -- Order 1 - Cash
(8, 4, 12, 75.50, GETDATE(), 1, 'SeederScript', NULL, GETDATE(), NULL),   -- Order 2 - Card
(9, 5, 13, 200.00, GETDATE(), 1, 'SeederScript', NULL, GETDATE(), NULL),  -- Order 3 - Bank Transfer
(10, 6, 14, 60.00, GETDATE(), 1, 'SeederScript', NULL, GETDATE(), NULL),   -- Order 4 - Apple Pay
(11, 7, 15, 150.00, GETDATE(), 1, 'SeederScript', NULL, GETDATE(), NULL),  -- Order 5 - Mada
(12, 3, 12, 180.25, GETDATE(), 1, 'SeederScript', NULL, GETDATE(), NULL),  -- Order 6 - Card
(13, 4, 13, 90.00, GETDATE(), 1, 'SeederScript', NULL, GETDATE(), NULL),   -- Order 7 - Bank Transfer
(14, 5, 11, 65.00, GETDATE(), 1, 'SeederScript', NULL, GETDATE(), NULL),   -- Order 8 - Cash
(15, 6, 14, 110.00, GETDATE(), 1, 'SeederScript', NULL, GETDATE(), NULL),  -- Order 9 - Apple Pay
(16, 7, 15, 250.00, GETDATE(), 1, 'SeederScript', NULL, GETDATE(), NULL); -- Order 10 - Mada

INSERT INTO Ratings (Client_ID, Order_ID, Driver_ID, Rating_Amount, Feedback, Is_Active, Created_By, Updated_By, Created_At, Update_Date)
VALUES
(3, 7, 8, 5.0, N'خدمة ممتازة والتوصيل سريع جداً.', 1, 'SeederScript', NULL, GETDATE(), NULL),
(4, 8, 9, 4.5, N'الطلب كان جيد ولكن هناك تأخير بسيط.', 1, 'SeederScript', NULL, GETDATE(), NULL),
(5, 9, 8, 3.0, N'التوصيل بطيء بعض الشيء والطعام كان بارد.', 1, 'SeederScript', NULL, GETDATE(), NULL),
(6, 10, 10, 4.0, N'الخدمة جيدة والطعام لذيذ.', 1, 'SeederScript', NULL, GETDATE(), NULL),
(7, 11, 9, 2.5, N'السائق لم يتبع العنوان بدقة.', 1, 'SeederScript', NULL, GETDATE(), NULL),
(3, 12, 8, 5.0, N'أفضل تجربة طلب حتى الآن!', 1, 'SeederScript', NULL, GETDATE(), NULL),
(4, 13, 9, 3.5, N'تجربة مقبولة ولكن يمكن التحسين.', 1, 'SeederScript', NULL, GETDATE(), NULL),
(5, 14, 10, 4.8, N'سائق محترم والخدمة رائعة.', 1, 'SeederScript', NULL, GETDATE(), NULL),
(6, 15, 10, 4.2, N'تم التوصيل بسرعة والطعام طازج.', 1, 'SeederScript', NULL, GETDATE(), NULL),
(7, 16, 9, 2.0, N'التوصيل متأخر والطعام غير جيد.', 1, 'SeederScript', NULL, GETDATE(), NULL);

INSERT INTO Reports (User_ID, Item_ID, Order_ID, Title, Description, Is_Active, Created_By, Updated_By, Created_At, Update_Date)
VALUES
(3, 1, 7, N'الطعام بارد', N'تم استلام الطلب وكان الطعام بارد وغير طازج.', 1, 'SeederScript', NULL, GETDATE(), NULL),

(4, 2, 8, N'تأخير في التوصيل', N'وصل الطلب متأخرًا بأكثر من 40 دقيقة عن الوقت المتوقع.', 1, 'SeederScript', NULL, GETDATE(), NULL),

(5, 3, 9, N'العصير مسكوب', N'العصير وصل مكسور وغرق باقي الطلب.', 1, 'SeederScript', NULL, GETDATE(), NULL),

(6, 4, 10, N'طلب خاطئ', N'تم استلام عنصر مختلف عن الذي تم طلبه.', 1, 'SeederScript', NULL, GETDATE(), NULL),

(7, 5, 11, N'سوء تعامل المندوب', N'السائق لم يكن محترمًا ولم يلتزم بالإجراءات.', 1, 'SeederScript', NULL, GETDATE(), NULL);

INSERT INTO User_Notifications (FK_User_ID, Notification_Id, Is_Read, Is_Active, Created_By, Updated_By, Created_At, Update_Date)
VALUES
(3, 1, 1, 1, 'SeederScript', NULL, GETDATE(), NULL),  -- read
(3, 2, 0, 1, 'SeederScript', NULL, GETDATE(), NULL),
(4, 3, 1, 1, 'SeederScript', NULL, GETDATE(), NULL),  -- read
(4, 4, 0, 1, 'SeederScript', NULL, GETDATE(), NULL),
(5, 5, 1, 1, 'SeederScript', NULL, GETDATE(), NULL),  -- read
(5, 6, 0, 1, 'SeederScript', NULL, GETDATE(), NULL),
(6, 7, 0, 1, 'SeederScript', NULL, GETDATE(), NULL),
(6, 8, 1, 1, 'SeederScript', NULL, GETDATE(), NULL),  -- read
(7, 9, 0, 1, 'SeederScript', NULL, GETDATE(), NULL),
(7, 10, 1, 1, 'SeederScript', NULL, GETDATE(), NULL); -- read

INSERT INTO User_Issues_Suggestions (User_ID, Issue_Suggestion_Id, Is_Active, Created_By, Updated_By, Created_At, Update_Date)
VALUES
(3, 1, 1, 'SeederScript', NULL, GETDATE(), NULL),
(3, 6, 1, 'SeederScript', NULL, GETDATE(), NULL),
(4, 2, 1, 'SeederScript', NULL, GETDATE(), NULL),
(4, 7, 1, 'SeederScript', NULL, GETDATE(), NULL),
(5, 3, 1, 'SeederScript', NULL, GETDATE(), NULL),
(5, 8, 1, 'SeederScript', NULL, GETDATE(), NULL),
(6, 4, 1, 'SeederScript', NULL, GETDATE(), NULL),
(6, 9, 1, 'SeederScript', NULL, GETDATE(), NULL),
(7, 5, 1, 'SeederScript', NULL, GETDATE(), NULL),
(7, 10, 1, 'SeederScript', NULL, GETDATE(), NULL);

INSERT INTO Role_Permissions (Role_Id, Permission_Id, Is_Active, Created_By, Updated_By, Created_At, Update_Date)
VALUES
-- System Administrator (1) - full access
(1, 1, 1, 'SeederScript', NULL, GETDATE(), NULL),
(1, 2, 1, 'SeederScript', NULL, GETDATE(), NULL),
(1, 3, 1, 'SeederScript', NULL, GETDATE(), NULL),
(1, 4, 1, 'SeederScript', NULL, GETDATE(), NULL),
(1, 9, 1, 'SeederScript', NULL, GETDATE(), NULL),

-- Manager (2)
(2, 1, 1, 'SeederScript', NULL, GETDATE(), NULL),
(2, 4, 1, 'SeederScript', NULL, GETDATE(), NULL),
(2, 5, 1, 'SeederScript', NULL, GETDATE(), NULL),
(2, 7, 1, 'SeederScript', NULL, GETDATE(), NULL),

-- Delivery Agent (4)
(4, 3, 1, 'SeederScript', NULL, GETDATE(), NULL),
(4, 4, 1, 'SeederScript', NULL, GETDATE(), NULL),

-- Accountant (6)
(6, 2, 1, 'SeederScript', NULL, GETDATE(), NULL),

-- Support Staff (3)
(3, 1, 1, 'SeederScript', NULL, GETDATE(), NULL),
(3, 3, 1, 'SeederScript', NULL, GETDATE(), NULL),

-- Customer Service (10)
(10, 8, 1, 'SeederScript', NULL, GETDATE(), NULL),
(10, 9, 1, 'SeederScript', NULL, GETDATE(), NULL);

INSERT INTO Chats (FK_Order_ID, FK_Client_ID, FK_Driver_ID, Chat_File_Path, Is_active, Created_By, Updated_By, Creation_Date, Update_Date)
VALUES
(7, 3, 8, 'chats/chat_order_1.json', 1, 'SeederScript', NULL, GETDATE(), NULL),
(8, 4, 9, 'chats/chat_order_2.json', 1, 'SeederScript', NULL, GETDATE(), NULL),
(9, 6, 10, 'chats/chat_order_4.json', 1, 'SeederScript', NULL, GETDATE(), NULL),
(10, 3, 8, 'chats/chat_order_6.json', 1, 'SeederScript', NULL, GETDATE(), NULL),
(11, 7, 9, 'chats/chat_order_10.json', 1, 'SeederScript', NULL, GETDATE(), NULL);
