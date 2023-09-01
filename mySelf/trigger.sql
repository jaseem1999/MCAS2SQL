use KeysConstrains;
show tables;

alter table project add ClientName varchar(20) after projectName;

alter table project add exp int after projectName;

alter table project add total int after exp;

desc project;

create trigger addExp before insert on project for each row set  new.total = (new.budget - new.exp);

CREATE TRIGGER addExpUpdate BEFORE UPDATE ON project
FOR EACH ROW
    SET NEW.total = NEW.budget - NEW.exp;

create table expense(
	id int,
    AfterExpBudget int
);

drop table expense;

insert into expense value(1,0);

CREATE TRIGGER aftrExpBudget AFTER INSERT ON project
FOR EACH ROW
    UPDATE expense SET AfterExpBudget = (SELECT SUM(exp) FROM project) WHERE id = 1;
    

create trigger pranav before delete on project for each row insert into backupProject value(old.proId,old.projectName,old.exp,old.total,old.ClientName,old.budget);
drop trigger backupDelete;



update project set exp = 2021 where  proId = 1;

INSERT INTO project (proId, projectName, exp, ClientName, budget)
VALUES (12, "GTMS", 36785, "AjkGroup",145678 );


desc project;

select * from project;

delete from project where proId= 11;

describe backupProject;
select * from expense;

create table backupProject(proId int,projectName varchar(30),exp int,total int, ClientName varchar(30),budget int);

delete from project where proId= 8;

select * from backupProject;