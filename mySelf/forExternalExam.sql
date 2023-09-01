create database ExternalExam;

create table std_Name(
	std_id varchar(7) primary key,
	first_name varchar(30),
    middle_name varchar(30),
    last_name varchar(30)
);

create table std_Details(
	std_id varchar(7) primary key,
	home varchar(30),
    street varchar(30),
    post_office varchar(30),
    state varchar(30),
    pin int,
    foreign key(std_id) references std_Name(std_id)
);

delimiter //

create procedure insertTable(
	in pstd_id varchar(7), 
    in pfirst_name varchar(30),
    in pmiddle_name varchar(30),
    in plast_name varchar(30),
    in phome varchar(30),
    in pstreet varchar(30),
    in ppost_office varchar(30),
    in pstate varchar(30),
    in ppin int 
)
begin
	insert into std_Name value(pstd_id,pfirst_name,pmiddle_name,plast_name);
    insert into std_Details value(pstd_id,phome,pstreet,ppost_office,pstate,ppin);
end;

//
delimiter ;

call insertTable("MCA01","Adil","Jaseem","PK","Purakkal","Pannipara","Pannipara","Kerala",674321);

select * from std_name;
select * from std_Details;

select * from std_name right join std_Details on std_name.std_id = std_details.std_id;
