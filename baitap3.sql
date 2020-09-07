use my_database;
create table customers(
customer_number int(11) auto_increment primary key,
fullname varchar(50) not null,
address varchar(255),
email varchar(255) unique,
phone varchar(255) not null unique
);
create table accounts(
account_number int primary key,
account_type varchar(255) not null,
_date date,
balance float,
customer_number int,
foreign key(customer_number) references customers(customer_number)
);
create table transactions(
tran_number int(11) primary key,
account_number int,
tran_date date,
amount float,
descriptions text,
foreign key(account_number) references accounts(account_number)
);

