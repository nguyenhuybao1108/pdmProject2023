Create database restaurant 
use restaurant

CREATE TABLE Customer
(
  Customer_id INT NOT NULL identity,
  user_name VARCHAR(255) NOT NULL,
  Phone varchar(255) NOT NULL,
  PRIMARY KEY (Customer_id)
);
CREATE TABLE orders
(
  Order_id INT NOT NULL identity,
  order_date Date NOT NULL,
  Customer_id INT NOT NULL,
  PRIMARY KEY (Order_id),
  FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);

CREATE TABLE Staff
(
  Staff_id INT NOT NULL identity,
  staff_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Staff_id)
);

CREATE TABLE Menu
(
  dish_name VARCHAR(255) NOT NULL,
  Dish_id INT NOT NULL identity,
  Price FLOAT NOT NULL,
  PRIMARY KEY (Dish_id)
);

CREATE TABLE Cheff
(
  Cheff_id INT NOT NULL identity,
  cheff_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Cheff_id)
);

CREATE TABLE Bill
(
  Bill_id INT NOT NULL identity,
  price FLOAT NOT NULL,
  Customer_id INT NOT NULL,
  Order_id INT NOT NULL,
  PRIMARY KEY (Bill_id),
  FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id),
  FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);

CREATE TABLE Order_item
(
  id INT NOT NULL identity,
  quantity INT NOT NULL,
  Dish_id INT NOT NULL,
  Cheff_id INT NOT NULL,
  Order_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (Dish_id) REFERENCES Menu(Dish_id),
  FOREIGN KEY (Cheff_id) REFERENCES Cheff(Cheff_id),
  FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);
CREATE table table_status (
    table_Status int not null,
    status_name varchar(255) not NULL,
    PRIMARY key (table_Status)

)
CREATE TABLE Tables
(
  Table_id INT NOT NULL identity,
  table_Status int NOT NULL,
  Staff_id INT NOT NULL,
  PRIMARY KEY (Table_id),
  FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id),
  FOREIGN key (table_Status) REFERENCES table_status(table_Status)
);


CREATE TABLE Book
(
  Date DATE NOT NULL,
  id INT NOT NULL identity,
  Customer_id INT NOT NULL,
  Table_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id),
  FOREIGN KEY (Table_id) REFERENCES Tables(Table_id)
);