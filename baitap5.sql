select productCode, productName, buyPrice, quantityInStock 
from products
where buyPrice >56.76 and quantityInStock > 10;

select productCode, productName, buyPrice, quantityInStock, textDescription
from products
inner join productlines on products.productLine = productlines.productLine
where buyPrice > 56.76 and quantityInStock > 10;

select productlines.productLine