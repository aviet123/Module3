select c.customerNumber, customerName, phone, paymentDate, amount from customers as c
inner join payments 
on c.customerNumber = payments.customerNumber
where city = 'Las Vegas';

select c.customerNumber, c.customerName, od.orderNumber, od.status
from customers as c
left join orders as od 
on c.customerNumber = od.customerNumber;

select c.customerNumber, c.customerName, od.orderNumber, od.status
from customers as c
left join orders as od 
on c.customerNumber = od.customerNumber
where orderNumber is null;

select status from orders 
group by status;

select status, count(*) as 'so luong status'
from orders 
group by status;

select status, sum(quantityOrdered * priceEach) as amount 
from orders 
inner join orderdetails as ot on orders.orderNumber = ot.orderNumber
group by status;

select year(orderDate) as year ,sum(quantityOrdered * priceEach) as total 
from orders
inner join orderdetails on orders.orderNumber = orderdetails.orderNumber
where status = 'shipped' 
group by year
having year > 2003;

select ucase(productName) from products;
select now() from products;

select productVendor, count(productcode) from products
where productline = 'Motorcycles'
group by productVendor
order by productVendor;

select productVendor, count(productcode) as codeas from products
where productline = 'Motorcycles'
group by productVendor
having codeas > 1
order by productVendor;


