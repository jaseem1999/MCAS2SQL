create database Sreerag;
use Sreerag;

Delimiter //

create procedure SimpleAddTwo()
begin
	declare  a int;
    declare b int ;
    declare c int;
    set a = 1;
    set b = 4;
    set c = a+b;
    select a,b,c;
end ;
//

Delimiter ;

drop procedure SimpleAddTwo;

call SimpleAddTwo();

Delimiter //

create procedure SimpleAddPerameterFirstOutt(in a int,in b int,out d int)
begin
	declare  c int;
    set c = a+b;
    select c into d;
    select a,b,c;
end ;
//

Delimiter ;

set @added =0;
call SimpleAddPerameterFirstOutt(10,20,@added);
select @added;

drop procedure SimpleAddPerameterFirstOutt;


create table addTable(a int,b int,c int);

delimiter //
create procedure insertAddedNotable(in x int,in y int, out z int)
begin
	insert into addTable(a,b,c)value(x,y,x+y);
    select c into z from addTable where a=x and b=y;
end ;
//
delimiter ;
call insertAddedNotable(10,25,@addT);
select * from addTable;
select @addT;


use cricket;
show tables;
select * from players;

use project;

show tables;

select * from team2;


delimiter //
create procedure getBuIdTeamDetails(in id int)
begin
	select * from team2 where team_id = id;
end ;
//
delimiter ;

delimiter //
create procedure getByIdTeamNameTeamCrearted(in id int,out name_emp varchar(30),out team_name varchar(30),out pro_name varchar(30))
begin
	select * from team2 where team_id = id;
	select name_team,Project_name,Employee_Name into  team_name,pro_name,name_emp from team2 where team_id = id;
end ;
//
delimiter ;

call  getByIdTeamNameTeamCrearted(103,@na1,@temNme,@prName);
select @na1,@temNme,@prName;

delimiter //
create function getById(id int)
returns varchar(50)
deterministic
begin
	declare name varchar(50);
    set name = null;
    select Employee_Name into name from team2 where team_id = id;
    return name;
end ;
//
delimiter ;

select getById(102);

delimiter //
create function getByTeamIdSample(tableId int)
returns int
deterministic
begin
	declare teamId int;
    set teamId = 0;
    select team_id into teamId from team2 where id = tableId;
    return teamId;
end ;
//
delimiter ;

select getByTeamIdSample(5);

drop function getByTeamId;

drop function getByTeamIdSample;

#join

use Sreerag;


create table employee(Emp_id int primary key, Name varchar(30) );
desc employee;

create table EmpAdress(table_id int primary key auto_increment,
							EmpIdForKey int,
                            Home varchar(20),
                            Post_office varchar(20),
                            Street varchar(20),
                            Pin int not null,
                            foreign key(EmpIdForKey) references employee(Emp_id)
                            );
desc EmpAdress;
drop table EmpAdress;
insert into employee values(101,"Adil"),
							(102,"sreerag m"),
                            (103,"US Sreerag"),
                            (104,"Jaseem");
select * from employee;

insert into EmpAdress(EmpIdForKey,Home,Post_office,Street,Pin)values(101,"Purakkal","Pannipara","Edavannna",2314);
insert into EmpAdress(EmpIdForKey,Home,Post_office,Street,Pin)values(102,"Kozhikode","Kakkodi","Kakkodi",214);
insert into EmpAdress(EmpIdForKey,Home,Post_office,Street,Pin)values(103,"rakkal","Pannipara","Edavan",2314);
insert into EmpAdress(EmpIdForKey,Home,Post_office,Street,Pin)values(104,"Kalappatt","pazhur","Mavoor",5134);

select * from EmpAdress;

select * from EmpAdress left join employee on EmpAdress.EmpIdForKey = employee.Emp_id;


					


