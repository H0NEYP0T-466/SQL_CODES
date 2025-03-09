/*this query is used to create database*/
create database E_commerence_DB;
/* this query is used to create tables in our database*/
create table customers(customer_id int primary key ,customers_name varchar (25)NOT NULL,Email varchar (40) unique not null,Phone_Number varchar (15) unique);
/*this query is used to show a specfic table in this case it show the table customers*/
select * from customers;
/* this query is used to create tables in our database*/
create table products(product_id int primary key,product_name varchar (20)not null,Price decimal (10,3)not null,/*check(price>0)*/);
/*this query is used to show a specfic table in this case it show the table products*/
select * from products;
/* this query is used to create tables in our database*/
create table Orders(order_id int primary key,customer_id int ,order_date date not null,total_amount decimal(10,3) not null,foreign key( customer_id )references customers(customer_id));
/*this query is used to show a specfic table in this case it show the table orders*/
select *from Orders;
/*this query will alter the table products & will check that the price should be greater than zero*/
alter table Products
add constraint price_check check(price > 0);
/*inserting values into tables*/
INSERT INTO Customers (customer_id, customers_name, email, phone_number)
VALUES
  (1, 'Shoaib Rafiq', 'shoaib101@gmail.com', '1234567890'),
  (2, 'Umer Malik', 'malikjee@gmail.com', '0987654321'),
  (3, 'Muhammad Fezan', 'fezan1029@gmail.com', '5551234567');

  select * from customers;
  /*inserting values into tables*/
INSERT INTO Products (product_id, product_name, price)
VALUES
  (1, 'Ghee', 19.99),
  (2, 'Rice', 9.99),
  (3, 'Lays', 29.99);

  select * from products;
 /*inserting values into tables*/
INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES
  (1, 1, '2022-01-01', 19.99),
  (2, 2, '2022-01-15', 9.99),
  (3, 3, '2022-02-01', 29.99);
  select * from Orders;
  /*this query will alter the table cuntomers & add a new column named adress*/
  alter table customers add address varchar (50) not null default'';
  
  select * from customers;
  select * from products;
  select * from Orders;


