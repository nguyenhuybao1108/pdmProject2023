-- DROP SCHEMA dbo;

CREATE SCHEMA dbo;
-- restaurant.dbo.Cheff definition

-- Drop table

-- DROP TABLE restaurant.dbo.Cheff;

CREATE TABLE restaurant.dbo.Cheff (
	Cheff_id int IDENTITY(1,1) NOT NULL,
	cheff_name varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK__Cheff__0D71E4014F0782FC PRIMARY KEY (Cheff_id)
);


-- restaurant.dbo.Customer definition

-- Drop table

-- DROP TABLE restaurant.dbo.Customer;

CREATE TABLE restaurant.dbo.Customer (
	Customer_id int IDENTITY(1,1) NOT NULL,
	user_name varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Phone varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK__Customer__8CB382B15F815C11 PRIMARY KEY (Customer_id)
);


-- restaurant.dbo.Menu definition

-- Drop table

-- DROP TABLE restaurant.dbo.Menu;

CREATE TABLE restaurant.dbo.Menu (
	dish_name varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Dish_id int IDENTITY(1,1) NOT NULL,
	Price float NOT NULL,
	CONSTRAINT PK__Menu__3B03A0F71C62375F PRIMARY KEY (Dish_id)
);


-- restaurant.dbo.Staff definition

-- Drop table

-- DROP TABLE restaurant.dbo.Staff;

CREATE TABLE restaurant.dbo.Staff (
	Staff_id int IDENTITY(1,1) NOT NULL,
	staff_name varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK__Staff__32D2E85B02CC0A3F PRIMARY KEY (Staff_id)
);


-- restaurant.dbo.table_status definition

-- Drop table

-- DROP TABLE restaurant.dbo.table_status;

CREATE TABLE restaurant.dbo.table_status (
	table_Status int NOT NULL,
	status_name varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK__table_st__2DA48C408AD1D1ED PRIMARY KEY (table_Status)
);


-- restaurant.dbo.Tables definition

-- Drop table

-- DROP TABLE restaurant.dbo.Tables;

CREATE TABLE restaurant.dbo.Tables (
	Table_id int IDENTITY(1,1) NOT NULL,
	table_Status int NOT NULL,
	Staff_id int NOT NULL,
	slot int NOT NULL,
	CONSTRAINT PK__Tables__B5731FEE0C8C718C PRIMARY KEY (Table_id),
	CONSTRAINT FK__Tables__Staff_id__5070F446 FOREIGN KEY (Staff_id) REFERENCES restaurant.dbo.Staff(Staff_id),
	CONSTRAINT FK__Tables__table_St__5165187F FOREIGN KEY (table_Status) REFERENCES restaurant.dbo.table_status(table_Status)
);


-- restaurant.dbo.orders definition

-- Drop table

-- DROP TABLE restaurant.dbo.orders;

CREATE TABLE restaurant.dbo.orders (
	Order_id int IDENTITY(1,1) NOT NULL,
	order_date date NOT NULL,
	Customer_id int NOT NULL,
	CONSTRAINT PK__orders__F1FF84531DE0573B PRIMARY KEY (Order_id),
	CONSTRAINT FK__orders__Customer__398D8EEE FOREIGN KEY (Customer_id) REFERENCES restaurant.dbo.Customer(Customer_id)
);


-- restaurant.dbo.Bill definition

-- Drop table

-- DROP TABLE restaurant.dbo.Bill;

CREATE TABLE restaurant.dbo.Bill (
	Bill_id int IDENTITY(1,1) NOT NULL,
	price float NOT NULL,
	Customer_id int NOT NULL,
	Order_id int NOT NULL,
	CONSTRAINT PK__Bill__CF6F718B66A1C3DD PRIMARY KEY (Bill_id),
	CONSTRAINT FK__Bill__Customer_i__4222D4EF FOREIGN KEY (Customer_id) REFERENCES restaurant.dbo.Customer(Customer_id),
	CONSTRAINT FK__Bill__Order_id__4316F928 FOREIGN KEY (Order_id) REFERENCES restaurant.dbo.orders(Order_id)
);


-- restaurant.dbo.Order_item definition

-- Drop table

-- DROP TABLE restaurant.dbo.Order_item;

CREATE TABLE restaurant.dbo.Order_item (
	id int IDENTITY(1,1) NOT NULL,
	quantity int NOT NULL,
	Dish_id int NOT NULL,
	Cheff_id int NOT NULL,
	Order_id int NOT NULL,
	CONSTRAINT PK__Order_it__3213E83F97EBF1F8 PRIMARY KEY (id),
	CONSTRAINT FK__Order_ite__Cheff__46E78A0C FOREIGN KEY (Cheff_id) REFERENCES restaurant.dbo.Cheff(Cheff_id),
	CONSTRAINT FK__Order_ite__Dish___45F365D3 FOREIGN KEY (Dish_id) REFERENCES restaurant.dbo.Menu(Dish_id),
	CONSTRAINT FK__Order_ite__Order__47DBAE45 FOREIGN KEY (Order_id) REFERENCES restaurant.dbo.orders(Order_id)
);
