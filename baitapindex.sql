use classicmodels;
explain select * from customers where customerNumber = 175;

alter table customers 
add index idx_customerNumber(customerNumber);

explain select * from customers where customerNumber = 175;

alter table customers 
add index idx_full_name(contactFirstName, contactLastName);

alter table customers
drop index idx_customerNumber;

EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';
