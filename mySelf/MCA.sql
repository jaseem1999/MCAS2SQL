create database mca;

use mca;

#procedure |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

delimiter //
create procedure addTwoNo()
begin
		declare a int;
        declare b int;
        declare c int;
        set a = 2;
        set b = 3;
        set c = a+b;
        select a,b,c;
end;
//
delimiter ;


call addTwoNo();

delimiter //
create procedure addTwoNoInput(in a int ,in b int)
begin
		declare c int;
        set c = a+b;
        select a,b,c;
end;
//
delimiter ;


delimiter //
create procedure addSample(in a int ,in b int,out c int)
begin
        set c = a+b;
end;
//
delimiter ;

call addSample(10,20,@added);
select @added;


create table addSum(a int ,b int, c int);
desc addSum;

delimiter //
create procedure addTwoNoInput(in x int ,in y int,out z int)
begin
        insert into addSum(a,b,c)value(x,y,x+y);
        select c into z from addSum where a=x and b=y;
end;
//
delimiter ;
call addTwoNoInput(10,30,@C);

select * from addSum;
select @c as sum;

delimiter //
create procedure deleteByC(in x int)
begin
        delete from addSum where c = x;
end;
//
delimiter ;

call deleteByC(310);


use ebill;
desc bills;
show tables;
select * from bills;

#function |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

delimiter //
create function getByIdFun(x int)
returns int
deterministic
begin
	declare amount int;
    set amount = 0;
    select tatal_amount into amount from bills where id = x;
    return amount;
end;
//
delimiter ;

select getByIdFun(3)


delimiter //
create function getByIdFunName(x int)
returns varchar(30)
deterministic
begin
	declare Firstname varchar(30);
    set Firstname = null;
    select  name into Firstname from bills where id = x;
    return Firstname;
end;
//
delimiter ;

select getByIdFunName(9)


delimiter //
create function getAddSimplFun(x int, y int)
returns int
deterministic
begin
	declare z int;
    set z = x+y;
    return z;
end;
//
delimiter ;

select getAddSimplFun(8,12) as sum;

#couser |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

CREATE TABLE tutorials (
   ID INT PRIMARY KEY,
   TITLE VARCHAR(100),
   AUTHOR VARCHAR(40),
   DATE VARCHAR(40)
);

CREATE TABLE backup (
   ID INT,
   TITLE VARCHAR(100),
   AUTHOR VARCHAR(40),
   DATE VARCHAR(40)
);

insert into tutorials values(1, 'Java', 'Krishna', '2019-09-01');
insert into tutorials values(2, 'JFreeCharts', 'Satish', '2019-05-01');
insert into tutorials values(3, 'JavaSprings', 'Amit', '2019-05-01');
insert into tutorials values(4, 'Android', 'Ram', '2019-03-01');
insert into tutorials values(5, 'Cassandra', 'Pruthvi', '2019-04-06');
select * from tutorials;




delimiter //
create procedure backupData()
begin
	declare done int default 0;
	declare id int;
    declare title,author,date varchar(50);
    declare curs cursor for select * from tutorials;
    declare continue handler for not found set done =1;
    open curs;
    label:loop
		fetch curs into id,title,author,date;
		insert into backup(ID,TITLE ,AUTHOR,DATE)value(id,title,author,date);
        if done = 1 then leave label;
        end if;
        end loop;
        close curs;
end ;
//
delimiter ;

call backupData();
select * from backup;


# join|||||||||||||||||||||| foreign key

create table employee(Emp_id int primary key, Name varchar(30) );


show tables;
create table EmpAdress(table_id int primary key auto_increment,
							EmpIdForKey int,
                            Home varchar(20),
                            Post_office varchar(20),
                            Street varchar(20),
                            Pin int not null,
                            foreign key(EmpIdForKey) references employee(Emp_id)
                            );
insert into employee values(101,"Adil"),
							(102,"sreerag m"),
                            (103,"US Sreerag"),
                            (104,"Jaseem");
select * from employee;

insert into EmpAdress(EmpIdForKey,Home,Post_office,Street,Pin)values(101,"Purakkal","Pannipara","Edavannna",2314);
insert into EmpAdress(EmpIdForKey,Home,Post_office,Street,Pin)values(102,"Kozhikode","Kakkodi","Kakkodi",214);
insert into EmpAdress(EmpIdForKey,Home,Post_office,Street,Pin)values(103,"rakkal","Pannipara","Edavan",2314);
insert into EmpAdress(EmpIdForKey,Home,Post_office,Street,Pin)values(104,"Kalappatt","pazhur","Mavoor",5134);

select * from employee right join EmpAdress on employee.Emp_id = EmpAdress.EmpIdForKey;