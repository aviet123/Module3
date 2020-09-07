CREATE DATABASE products;
-- DROP DATABASE products
use products;
create table customers(
customerNumber int primary key,
customerName varchar(50) not null,
contactLastName varchar(50) not null,
contactFirstName varchar(50) not null,
phone varchar(50) not null,
addressLine1 varchar(50) not null,
addressLine2 varchar(50),
city varchar(50) not null,
postalCode varchar(50) not null,
country varchar(50) not null,
creditLimit float,
salesRepEmployeeNumber int
);
create table orders(
orderNumber int primary key,
orderDate date not null,
requiredDate date not null,
shippedDate date,
status varchar(15) not null,
comments text,
quantityOrdered int not null,
priceEach float not null,
customerNumber int,
foreign key(customerNumber) references customers(customerNumber)
);
create table payments(
customerNumber int primary key,
checkNumber varchar(50) not null,
paymentDate date not null,
amount int not null,
foreign key(customerNumber) references customers(customerNumber)
);
create table productlines(
productLine varchar(50) unique key,
textDescription text not null,
image text not null
);
create table products(
productCode int(15) primary key,
productName varchar(70) not null,
productScale varchar(10) not null,
productVendor varchar(50) not null,
productDescription text not null,
quantityInStock float not null,
buyPrice float not null,
MSRP float not null,
productLine varchar(50),
foreign key(productLine) references productlines(productLine)
);
create table offices (
officeCode int(11) primary key,
city varchar(50) not null,
phone varchar(50) not null,
addressLine1 varchar(50) not null,
addressLine2 varchar(50) not null,
state varchar(50) not null,
country varchar(50) not null,
postalCode varchar(15) not null
);
create table orderDetails(
ordernumber int,
productcode int,
primary key(ordernumber, productcode),
foreign key(ordernumber) references orders(orderNumber),
foreign key(productcode) references products(productCode)
);
create table employees (
employeeNumber int primary key,
lastName varchar(50) not null,
firstName varchar(50) not null,
email varchar(100) not null,
jobTitle varchar(50) not null,
reportTo int,
officeCode int(11), 
foreign key(officeCode) references offices(officeCode)
);
select * from offices;
alter table customers
 add foreign key(salesRepEmployeeNumber) references employees(employeeNumber);
alter table employees
add foreign key(reportTo) references employees(employeeNumber);