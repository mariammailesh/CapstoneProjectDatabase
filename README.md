# Capstone-Project-Database
# Food Delivery Database System

## Overview
A SQL Server database designed for a food delivery application supporting multilingual content (Arabic/English), user management, order processing, and delivery tracking.

## Core Components

### User Management
- User authentication and roles (Admin, Client, Driver)
- Permission-based access control
- Profile management

### Menu System
- Categories and Items (bilingual)
- Customization options
- Pricing and descriptions

### Order Processing
- Order creation and tracking
- Item customization
- Delivery status monitoring
- Payment processing

### Features
- Multilingual support (Arabic/English)
- Location tracking
- Chat system between drivers and customers
- Rating and feedback system
- Discount management
- Payment processing
- Notification system

### Technical Details
- Built on Microsoft SQL Server
- Includes audit trails
- Foreign key constraints
- Email validation
- Secure password storage

## Getting Started
1. Run schema creation scripts
2. Add reference data (roles, permissions)
3. Create admin users
4. Set up menu items
5. Begin processing orders

## Relationship analysis
%% Relationships
    Items ||--|{ Categories : categorized_as<br>
    Items ||--o{ Order_Items : contains<br>
    Roles ||--|{ Users : related_to<br>
    Clients ||--o{ Orders : places<br>
    Orders ||--o{ Order_Items : contains<br>
    Orders ||--|{ DeliveryLocations : assigned<br>
    Drivers ||--o{ DeliveryLocations : fulfills<br>
    Orders ||--|{ Payments : has<br>
    Clients ||--|{ Payments : has <br>
    Clients ||--o{ Ratings : add<br>
    Clients ||--o| Orders_History : has<br>
    Orders_History ||--|{ Orders:has<br>
    Orders ||--o{ Chats : has<br>
    Clients ||--o{ Chats : communicates<br>
    Drivers ||--o{ Chats : communicates<br>
    Orders |o--o{ Ratings : has<br>
    Roles |{--|{ Permissions : has<br>
    Items ||--|| ItemOptions : has <br>
    ItemOptions ||--|{ Options : has <br>
    Users |{--|{ Notifications : has <br>
    Users |{--|{ Issues_Suggestions : has <br>
    Admins ||--|{ Discounts : make <br>
    Discounts ||--|| Discount_items : has <br>
    Discounts ||--|| Discount_Categories : has <br>
    Items ||--|| Discount_items : has <br>
    Categories ||--|| Discount_Categories : has<br>
    Users ||--|{ Reports : has<br>
    
For detailed implementation and complete schema details, refer to the SQL files.
