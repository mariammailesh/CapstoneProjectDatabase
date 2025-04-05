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
    Items ||--|{ Categories : categorized_as
    Items ||--o{ Order_Items : contains
    Roles ||--|{ Users : related_to
    Clients ||--o{ Orders : places
    Orders ||--o{ Order_Items : contains
    Orders ||--|{ DeliveryLocations : assigned
    Drivers ||--o{ DeliveryLocations : fulfills
    Orders ||--|{ Payments : has
    Clients ||--|{ Payments : has 
    Clients ||--o{ Ratings : add
    Clients ||--o| Orders_History : has
    Orders_History ||--|{ Orders:has
    Orders ||--o{ Chats : has
    Clients ||--o{ Chats : communicates
    Drivers ||--o{ Chats : communicates
    Orders |o--o{ Ratings : has
    Roles |{--|{ Permissions : has
    Items ||--|| ItemOptions : has 
    ItemOptions ||--|{ Options : has 
    Users |{--|{ Notifications : has 
    Users |{--|{ Issues_Suggestions : has 
    Admins ||--|{ Discounts : make 
    Discounts ||--|| Discount_items : has 
    Discounts ||--|| Discount_Categories : has 
    Items ||--|| Discount_items : has 
    Categories ||--|| Discount_Categories : has
    Users ||--|{ Reports : has
    
For detailed implementation and complete schema details, refer to the SQL files.
