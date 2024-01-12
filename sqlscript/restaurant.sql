CREATE database restaurant
use restaurant

CREATE TABLE Customer
(
    Customer_id INT NOT NULL identity,
    Phone VARCHAR(255) NOT NULL,
    Passwords varchar(255) NOT NULL,
    PRIMARY KEY (Customer_id),
    UNIQUE(Phone)
);

CREATE TABLE Orders
(
    Order_id INT NOT NULL identity,
    Dates DATE NOT NULL,
    Customer_id INT NOT NULL,
    PRIMARY KEY (Order_id),
    FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);

CREATE TABLE Staff
(
    Staff_id INT NOT NULL identity,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (Staff_id)
);

CREATE TABLE Menu
(
    Name VARCHAR(255) NOT NULL,
    Dish_id INT NOT NULL identity,
    Price INT NOT NULL,
    PRIMARY KEY (Dish_id)
);

CREATE TABLE Chef
(
    Chef_id INT NOT NULL identity,
    Name VARCHAR(255) NOT NULL,
    PRIMARY KEY (Chef_id)
);

CREATE TABLE Bill
(
    Bill_id INT NOT NULL identity,


    Order_id INT NOT NULL,
    PRIMARY KEY (Bill_id),

    FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);

CREATE TABLE Order_item
(
    
    quantity INT NOT NULL,
    Dish_id INT NOT NULL,
    Chef_id INT NOT NULL,
    Order_id INT NOT NULL,
    
    FOREIGN KEY (Dish_id) REFERENCES Menu(Dish_id),
    FOREIGN KEY (Chef_id) REFERENCES Chef(Chef_id),
    FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);

CREATE TABLE Tables
(
    Table_id INT NOT NULL identity,
    table_Status CHAR NOT NULL,
    Staff_id INT NOT NULL,
    slot int not null,
    PRIMARY KEY (Table_id),
    FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id)
);

CREATE TABLE Book
(

    id INT NOT NULL identity,
    Customer_id INT NOT NULL,
    Table_id INT NOT NULL,
    PRIMARY KEY (id, Customer_id, Table_id),
    FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id),
    FOREIGN KEY (Table_id) REFERENCES Tables(Table_id)
);
