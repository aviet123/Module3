delimiter //
create procedure getCustomersCountByCity(
in in_city varchar(50),
out total int
)
begin
select count(customerNumber)
into total 
from customers
where city = in_city;
end//
delimiter ;

call getCustomersCountByCity('Lyon',@total);
select @total;

DELIMITER //

CREATE PROCEDURE SetCounter(
    INOUT counter INT,
    IN inc INT
)
BEGIN
    SET counter = counter + inc;
END//
DELIMITER ;

set @counter = 1;
call SetCounter(@counter,1);
call SetCounter(@counter,1);
call SetCounter(@counter,5);
select @counter;

