use demo;
drop table products;

create table products(
id int(11) auto_increment primary key,
productCode int not null,
productName varchar(50),
productPrice int(11),
productAmount int(11),
productDescription text,
productStatus varchar(50)
);


insert into products values(1,1,'nokia',20000,30,'hang ngon','con zin');
insert into products values(2,2,'iphone',30000,310,'hang lom','con zin');
insert into products values(3,3,'samsung',40000,320,'hang thuong','het zin');
insert into products values(4,4,'note 7',50000,303,'quoc te','con zin');
insert into products values(5,5,'vetus',60000,301,'noi dia','het zin');
insert into products values(6,6,'nokia e73',70000,130,'hang lock','con zin');
insert into products values(7,7,'iphone x',80000,20,'hang ngon','con zin');

select * from products;

alter table products 
add index idx_product_code(productCode);

alter table products 
add index idx_product_name_price(productName,productPrice);

alter table products
drop index idx_product_code;

explain select * from products where productName = 'phone x';

create view product_views as
select productCode, productName, productPrice, productStatus from products;

select * from product_views;
 
create or replace view product_views as
select productCode, productName, productDescription from products;

drop view product_views;

delimiter //
create procedure getAllProduct()
begin
	select * from products;
end //
delimiter ;

call getAllProduct();

delimiter //
create procedure insertProduct(idproduct int,productCode int(11),productName varchar(30),productPrice int(11),productAmount int(11),productDescript text)
begin
	insert into products values(idproduct, productCode, productName, productPrice,productAmount,productDescription);
end //
delimiter ;

call insertProduct(null,8,'nokia',20000,300,'hang noi dia','con nguyen');
call insertProduct(null,9,'nokia',20000,300,'hang ngoai','con nguyen');
call insertProduct(null,10,'nokia',30000,400,'hang ngoai','con zin');
insert into products (productCode) values (11);

delimiter //
create procedure updateIDFromProduct(in idproduct int(11), codeP int(11),nameP varchar(30),priceP int(11),amountP int(11), descript text)
begin
	update products
    set productCode = codeP, productName = nameP, productPrice = priceP, productAmount = amountP, productDescript = descript
    where id = idproduct
    ;
end //
delimiter ;

call updateIDFromProduct(9,9,'iphone xs',300000,200,'hang noi dia','het zin');

delimiter //
create procedure deleteProductByID(in idproduct int(11))
begin
	delete from products
    where id = idproduct;
end //
delimiter ;

call deleteProductByID(11);


