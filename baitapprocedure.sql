use classicmodels;

DELIMITER //
CREATE PROCEDURE getAllCustomer()
BEGIN 
SELECT * FROM CUSTOMERS;
END //
DELIMITER ;

CALL getAllCustomer();

drop procedure if exists `getAllCustomer`;

DELIMITER //
CREATE PROCEDURE getAllCustomer()
BEGIN 
SELECT * FROM CUSTOMERS where customerNumber = 175;
END;//
DELIMITER 

call getAllCustomer();

DELIMITER //
CREATE PROCEDURE getCustomerByID(in cusNum int(11))
BEGIN 
SELECT * FROM CUSTOMERS where customerNumber = cusNum;
END //
DELIMITER ;

call getCustomerByID(233);

