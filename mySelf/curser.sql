create database CursorSampl;
use CursorSampl;

drop table tutorials;
drop table backup;
CREATE TABLE tutorials (
   ID INT PRIMARY KEY,
   TITLE VARCHAR(100),
   AUTHOR VARCHAR(40),
   DATE VARCHAR(40)
);
insert into tutorials values(1, 'Java', 'Krishna', '2019-09-01');
insert into tutorials values(2, 'JFreeCharts', 'Satish', '2019-05-01');
insert into tutorials values(3, 'JavaSprings', 'Amit', '2019-05-01');
insert into tutorials values(4, 'Android', 'Ram', '2019-03-01');
insert into tutorials values(5, 'Cassandra', 'Pruthvi', '2019-04-06');
select *from tutorials;

CREATE TABLE backup (
   ID INT,
   TITLE VARCHAR(100),
   AUTHOR VARCHAR(40),
   DATE VARCHAR(40)
);
DELIMITER //
CREATE PROCEDURE Example()
   BEGIN
      declare done int default 0;
      declare id int;
      declare title,author,dateDo varchar(100);
      declare cors cursor for select * from tutorials;
      declare continue handler for not found set done = 1;
      open cors;
      label :loop
			fetch cors into id,title,author,dateDo;
            insert into backup values(id,title,author,dateDo);
            if done = 1 then leave label;
            end if;
            end loop;
		close cors;
   END//
DELIMITER ;

drop procedure Example;
CALL Example;
select * from backup;