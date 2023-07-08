create database storedprocedure;
use storedprocedure;




CREATE TABLE products (
    product_id INT AUTO_INCREMENT,
    product_name VARCHAR(100),
    product_price DECIMAL(10, 2),
    PRIMARY KEY (product_id)
);

INSERT INTO products (product_name, product_price) VALUES
    ('Product A', 10.50),
    ('Product B', 15.75),
    ('Product C', 20.00);

-- Create the stored procedure 'GetProductPrice'
DELIMITER //

CREATE PROCEDURE GetProductPrice(IN productId INT, OUT price DECIMAL(10, 2))
BEGIN
    SELECT product_price INTO price FROM products WHERE product_id = productId;
END //

DELIMITER ;


SET @productPrice = 0;
CALL GetProductPrice(1, @productPrice);
SELECT @productPrice;


DELIMITER //

CREATE PROCEDURE GetProductName3(IN productId INT, OUT name1 VARCHAR(100))
BEGIN
    SELECT product_name INTO name1 FROM products WHERE product_id = productId;
END //

DELIMITER ;


CALL GetProductName3(2, @productName);
SELECT @productName;


DELIMITER //

CREATE PROCEDURE GetProductsAndId5(IN productId INT,IN nameP varchar(100), OUT id INT, OUT namePro VARCHAR(100))
BEGIN
    SELECT product_id, product_name INTO id, namePro FROM products WHERE product_id = productId AND product_name = nameP;
END //

DELIMITER ;


CALL GetProductsAndId5(3,'Product C',@productId, @productN);
SELECT @productId, @productN;

create table sadd(id int auto_increment primary key,a int, b int, c int );


DELIMITER //

CREATE PROCEDURE insertAdd(IN x INT,in y INT, OUT z int)
BEGIN
	insert into sadd(a,b,c)values(x,y,x+y);
     select c into z from sadd where a = x and b=y;
END //

DELIMITER ;

select * from sadd;

CALL insertAdd(9,9,@added);
SELECT @added;


DELIMITER //

CREATE PROCEDURE getAllDetails()
BEGIN
	select * from sadd;
END //

DELIMITER ;

call getAllDetails();

delimiter //
create function getById(n int)
returns int
deterministic
begin
	declare added int;
    set added = 0;
    select c into added from sadd where id=n;
    return added;
end;
//
delimiter ;

select getById(3);


DELIMITER //
CREATE PROCEDURE simpleAddtwo()
BEGIN
	declare a int;
    declare b int;
    declare c int;
    set a = 10;
    set b = 20;
    set c = a+b;
    select a,b,c;
END //

DELIMITER ;

call simpleAddtwo();