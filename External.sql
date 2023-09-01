use ExternalExam;
show tables;

create table emp_table(id int not null auto_increment,name varchar(26) not null,desig varchar(40) not null, age int not null,primary key (id) );
describe emp_table;
insert into emp_table(name,desig,age)value('joh','Sales',54);
select * from emp_table;
update emp_table set name = 'arun' where id =5;
alter table emp_table add PhoneNo int not null after desig;
alter table emp_table modify PhoneNo varchar(35);
alter table emp_table add Salary varchar(25) not null after desig;

insert into emp_table(name,desig,Salary,PhoneNo,age)value('Shahana','Sales','400000','8463823',28);
insert into emp_table(name,desig,Salary,PhoneNo,age)value('Raheem','Sales','200000','76383623',23);
insert into emp_table(name,desig,Salary,PhoneNo,age)value('Hashim','QC','220000','24682843',23);
insert into emp_table(name,desig,Salary,PhoneNo,age)value('Sam','Director','','',32);

update emp_table set PhoneNo = '' where id =1;
update emp_table set PhoneNo  = '98434722' where id =2;
update emp_table set PhoneNo  = '33287002' where id =3;
update emp_table set PhoneNo  = '29526645' where id =4;
update emp_table set PhoneNo  = '98352827' where id =5;


select * from emp_table where salary>390000;

select * from emp_table where salary>390000 or age>30;

select * from emp_table where salary>390000 and age>30;

select * from emp_table where (desig = 'Sales' and age<25) and salary>200000;

select * from emp_table where name like "_a%";

select * from emp_table where name not like '_a%'; 

select * from emp_table where Salary is null;

select distinct desig from emp_table;

select  count(*) from emp_table;

select * from emp_table where id>0 order by Salary desc;

select desig, count(*) from emp_table group by desig;

select desig,max(salary) from emp_table group by desig;

select desig,min(salary) from emp_table group by desig;

select desig, sum(Salary) from emp_table group by desig;

select desig, sum(salary) as "TOTAL SALARY THIS MONTH" , count(*) from emp_table group by desig;

select desig, sum(salary), count(*) from emp_table group by desig having sum(salary)>10000;

select count(*),age,salary from emp_table group by age;

SELECT * FROM emp_table WHERE age BETWEEN 28 AND 54;



select char_length(name) as 'As total length' from emp_table;

select concat(name, " ",desig) as "Details" from emp_table;

select concat(name, " ",desig) from emp_table where name='adil';

select insert("java is language ",1,4,"python");

select lcase("JAVA");

select length("java");

select trim(" java is a language    ");

select trim('j' from 'java');

select mid("java developer ",5) from dual;

select desig,min(salary) from emp_table group by desig;

select mod(13,2);

select pi();

select pow(2,10);

select desig,sum(salary) from emp_table group by desig;



select adddate('2016/06/11 02:12:01', interval 15 minute );

select addtime('2022/06/12 02:12:20','2:10;10');

select current_date();

select current_time();

select current_timestamp();

select curdate()+1;

select date_format("3020/01/01","%y");

select now();

select * from emp_table;

commit;

select * from emp_table;

start transaction;

delete from emp_table where id=5; 

select * from emp_table;

rollback;

select * from emp_table;


create table std_details(
						id int primary key,Name varchar(20) not null,
                        Home varchar(20),
                        Street varchar(20),
                        PostOffice varchar(20),
                        State varchar(20),
                        pin int not null);


create table std_clg_details(
						 admi_no int primary key not null,
                         stud_id int not null,
                         roll_no int,
                         department varchar(30),
                         course varchar(30),
                         semester varchar(30),
                         foreign key(stud_id) references std_details(id)
							);
                            
create table std_uni_details(
						Uni_name varchar(40),
						uni_id varchar(10) primary key not null,
                        std_id int not null,
                        admi_no int not null,
                        department varchar(30),
                        foreign key(std_id) references std_details(id),
                        foreign key(admi_no) references std_clg_details(admi_no)
							);
                            
                            
show tables;
describe std_clg_details;
describe std_uni_details;


INSERT INTO std_details (id, Name, Home, Street, PostOffice, State, pin)
VALUES
    (1, 'John', '123 Main St', 'Central Ave', 'Central PO', 'California', 12345),
    (2, 'Alice', '456 Elm St', 'Park Ave', 'Park PO', 'New York', 54321),
    (3, 'Bob', '789 Oak St', 'Maple St', 'Maple PO', 'Florida', 98765),
    (4, 'Emily', '101 Pine St', 'Pine Ave', 'Pine PO', 'Texas', 13579),
    (5, 'David', '202 Cedar St', 'Cedar Ave', 'Cedar PO', 'Ohio', 24680),
    (6, 'Sophia', '303 Walnut St', 'Walnut Ave', 'Walnut PO', 'Illinois', 86420),
    (7, 'Oliver', '404 Birch St', 'Birch Ave', 'Birch PO', 'Michigan', 97531);
    
select * from std_details;

INSERT INTO std_clg_details (admi_no, stud_id, roll_no, department, course, semester)
VALUES
    (1001, 1, 101, 'Computer Science', 'B.Tech', 'Spring 2023'),
    (1002, 2, 102, 'Electrical Engineering', 'B.E.', 'Fall 2023'),
    (1003, 3, 103, 'Mechanical Engineering', 'B.Tech', 'Summer 2023'),
    (1004, 4, 104, 'Biology', 'B.Sc.', 'Spring 2023'),
    (1005, 5, 105, 'Physics', 'B.Sc.', 'Fall 2023'),
    (1006, 6, 106, 'Mathematics', 'B.A.', 'Summer 2023'),
    (1007, 7, 107, 'Chemistry', 'B.Sc.', 'Spring 2023');
    
select * from std_clg_details;

INSERT INTO std_uni_details (Uni_name, uni_id, std_id, admi_no, department)
VALUES
    ('ABC University', 'U001', 1, 1001, 'Computer Science'),
    ('XYZ University', 'U002', 2, 1002, 'Electrical Engineering'),
    ('DEF University', 'U003', 3, 1003, 'Mechanical Engineering'),
    ('LMN University', 'U004', 4, 1004, 'Biology'),
    ('PQR University', 'U005', 5, 1005, 'Physics'),
    ('UVW University', 'U006', 6, 1006, 'Mathematics'),
    ('GHI University', 'U007', 7, 1007, 'Chemistry');
    
select * from std_uni_details;

SELECT
    su.uni_id,
    su.Uni_name,
    sd.Name,
    sd.Home,
    sd.Street,
    sd.PostOffice,
    sd.State,
    sd.pin,
    scd.roll_no,
    scd.department AS college_department,
    scd.course,
    scd.semester,
    su.department AS university_department
FROM
    std_uni_details su
JOIN
    std_clg_details scd ON su.admi_no = scd.admi_no
JOIN
    std_details sd ON su.std_id = sd.id;


SELECT
    *
FROM
    std_uni_details su
JOIN
    std_clg_details scd ON su.admi_no = scd.admi_no
JOIN
    std_details sd ON su.std_id = sd.id;
    
    
show databases;




create view allDetailsStudent as SELECT
    su.uni_id,
    su.Uni_name,
    sd.Name,
    sd.Home,
    sd.Street,
    sd.PostOffice,
    sd.State,
    sd.pin,
    scd.roll_no,
    scd.department AS college_department,
    scd.course,
    scd.semester,
    su.department AS university_department
FROM
    std_uni_details su
JOIN
    std_clg_details scd ON su.admi_no = scd.admi_no
JOIN
    std_details sd ON su.std_id = sd.id;
    
select * from allDetailsStudent;

select * from allDetailsStudent where uni_id="U002";

show databases;
use hospital;
show tables;

select * from emp_ageabove30;
select * from emp_demo;
select * from emp_table;



alter table emp_table drop PhoneNo;

show tables;

select * from emp_table;

describe emp_table;

create table repl(id int primary key, name varchar(26),desig varchar(40),salary varchar(35),PhoneNo varchar(35),age int);

describe repl;

delimiter //
create procedure emp_backup()

begin

end;

//

delimiter ;


create table recylebin(id int primary key, name varchar(26),desig varchar(40),salary varchar(35),PhoneNo varchar(35),age int);
drop table recylebin;

create trigger emp_detailes_delete before delete on emp_table for each row  insert into recylebin(id,name,desig,salary,PhoneNo,age)values(old.id,old.name,old.desig,old.Salary,old.phoneNo,old,old.age);
drop trigger emp_detailes_delete;

select * from emp_table;

delete from emp_table where id=1;





create table student_details(
						id int primary key,
                        Name varchar(20),
                        Home varchar(20),
                        Street varchar(20),
                        PostOffice varchar(20),
                        State varchar(20),
                        pin int );

create table student_details_backup(
						id int primary key,
                        Name varchar(20),
                        Home varchar(20),
                        Street varchar(20),
                        PostOffice varchar(20),
                        State varchar(20),
                        pin int);

create table student_insertion_mdfy_data(
						modify_date date
                        );
create table student_delete_mdfy_data(
						modify_date date
                        );

create trigger backup_of_student_details before delete on student_details for each row insert into student_details_backup value(
		old.id,
		old.Name,
		old.Home,
		old.Street,
		old.PostOffice,
		old.State,
		old.pin);


create trigger student_details_mdy_date after insert on student_details for each row insert into student_insertion_mdfy_data value(
		NOW());
create trigger student_details_mdy_delete_date after delete on student_details for each row insert into student_delete_mdfy_data value(
		NOW());
        
INSERT INTO student_details(id, Name, Home, Street, PostOffice, State, pin)
VALUES
    (1, 'John', '123 Main St', 'Central Ave', 'Central PO', 'California', 12345);
    
INSERT INTO student_details(id, Name, Home, Street, PostOffice, State, pin)
VALUES
    (2, 'Alice', '456 Elm St', 'Park Ave', 'Park PO', 'New York', 54321),
    (3, 'Bob', '789 Oak St', 'Maple St', 'Maple PO', 'Florida', 98765),
    (4, 'Emily', '101 Pine St', 'Pine Ave', 'Pine PO', 'Texas', 13579),
    (5, 'David', '202 Cedar St', 'Cedar Ave', 'Cedar PO', 'Ohio', 24680),
    (6, 'Sophia', '303 Walnut St', 'Walnut Ave', 'Walnut PO', 'Illinois', 86420),
    (7, 'Oliver', '404 Birch St', 'Birch Ave', 'Birch PO', 'Michigan', 97531);
    
    
INSERT INTO student_details(id, Name, Home, Street, PostOffice, State, pin)
VALUES
    (6, 'Sophia', '303 Walnut St', 'Walnut Ave', 'Walnut PO', 'Illinois', 86420);

select * from student_details;

delete from student_details where id=7;

select * from student_insertion_mdfy_data;

select * from student_details_backup;

select * from student_delete_mdfy_data;


delimiter //
create procedure SimpleAdd(in n1 int,in n2 int,out n3 int)
begin
	set n3 = n1+n2;
    select n3;
end
//
delimiter ;

set @addSmpl =0;

call SimpleAdd(30,10,@addSmpl);

select @addSmpl;


delimiter //
create function sumAdd(n1 int,n2 int)
returns int
deterministic
begin
	declare n3 int;
    set n3 = n1+n2;
    return n3;
end ;
//
delimiter ;

select sumAdd(10,30);