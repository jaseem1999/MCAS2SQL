create database triggers;
use triggers;
show tables;
create table tri(id int not null auto_increment,name varchar(40),age int,primary key(id));

show tables;

delimiter //

create trigger ageVerify
before insert on tri
for each row
begin
if new.age<0 then set new.age=0;
end if;
End;

//

insert into tri(name,age)values('adil jaseem',10),
('ram',-34),('lal',30);
select * from tri

create table Customers(customer_id int,first_name varchar(20),Country varchar(20));

DELIMITER //
CREATE PROCEDURE us_customers ()
BEGIN
SELECT customer_id, first_name
FROM Customers
WHERE Country = 'USA';
END //
DELIMITER ;

insert into Customers values(1,"Adil","India");
insert into Customers values(2,"Sreerag","USA");
insert into Customers values(3,"Adil","UK");
select * from Customers;

CALL us_customers();
