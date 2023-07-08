show databases;
use triggers;
create table section(s_id int,s_name varchar(20),strength int);
insert into section values(1,'Computer Science',20);
insert into section values(2,'Portal',45);
insert into section values(3,'geeksforgeeks',60);
insert into section values(4,'geeksforgeeks',60);
insert into section values(5,'geeksforgeeks',60);
DELIMITER //
CREATE FUNCTION totStrength() 
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE total INT;
  SET total = 0;
  SELECT SUM(strength) INTO total FROM section;
  RETURN total;
END;
//
DELIMITER ;

DELIMITER //
CREATE FUNCTION average3()
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE avgn INT;
    SET avgn = 0;
    SELECT MIN(strength) INTO avgn FROM section;
    RETURN avgn;
END;
// 
DELIMITER;



DELIMITER //
CREATE FUNCTION cs() 
RETURNS VARCHAR(255)
BEGIN
  DECLARE cs VARCHAR(255);
  SET cs = null;
  SELECT s_name INTO cs FROM section WHERE s_name ="Computer Science";
  RETURN cs;
END;
//
DELIMITER ;

DELIMITER //
CREATE FUNCTION geeksforgeeks() 
RETURNS VARCHAR(255)
BEGIN
  DECLARE gg VARCHAR(255);
  SET gg = null;
  SELECT s_name INTO cs FROM section WHERE s_name ="geeksforgeeks";
  RETURN gg;
END;
//
DELIMITER ;
DELIMITER //
CREATE FUNCTION geeksforgeek() 
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE gg INT;
  SET gg = 0;
  SELECT sum(strength) INTO gg  FROM section WHERE s_name ="geeksforgeeks";
  RETURN gg;
END;
//
DELIMITER ;

select totStrength();
select cs();
select geeksforgeek();
select * from section;





create database SMPL321;
USE SMPL321;
create table section(s_id int,s_name varchar(20),strength int);
insert into section values(1,'Computer Science',20);
insert into section values(2,'Portal',45);
insert into section values(3,'geeksforgeeks',60);
insert into section values(4,'geeksforgeeks',60);
insert into section values(5,'geeksforgeeks',60);

DELIMITER //
CREATE FUNCTION min1()
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE avgn INT;
    SET avgn = 0;
    SELECT sum(strength) INTO avgn FROM section;
    RETURN avgn;
END;
// 
DELIMITER ;


SELECT max(strength)  FROM section;
select * from section;
select average5();
select TOTAL();
select min1();


delimiter //
create function nameSmp5()
returns varchar(255)
deterministic
begin
	declare n varchar(255);
    set n = null;
	select s_name into n from section where s_name ="Computer Science";
    return n;
end;
//
delimiter ;
DELIMITER //
CREATE FUNCTION geeksforgeeks9() 
RETURNS int
deterministic
BEGIN
  DECLARE gg int;
  SET gg = 0;
  SELECT s_id INTO gg FROM section WHERE s_name ="geeksforgeeks" limit 1;
  RETURN gg;
END;
//
DELIMITER ;
select geeksforgeeks10();

DELIMITER //
CREATE PROCEDURE geeksfor()
BEGIN
  SELECT * FROM section WHERE s_name = 'geeksforgeeks';
END;
//
DELIMITER ;
call geeksfor();

DELIMITER //
CREATE FUNCTION geeksforgeeks3() 
RETURNS  TABLE (s_name VARCHAR(255),strength int) -- Specify the columns of your table
deterministic
BEGIN
  RETURN (
    SELECT * FROM section WHERE s_name = 'geeksforgeeks'
  );
END;
//





