CREATE DATABASE ORG2;
SHOW DATABASES;
USE ORG2;
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        
SELECT * FROM worker;
CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
        select *from bonus;
        
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 use  org2;
 select *from title;
 select first_name as worker_name from worker;
select distinct department from worker;
select substring(first_name,1,3) from worker; 
select instr(first_name,'b') from worker where first_name='amitabh';
select rtrim(first_name) from worker;
select ltrim(first_name) from worker;
select distinct department,length (department) from worker;
select replace(first_name,'a','A') from worker ;
select concat(first_name, '', last_name) from worker; 
select * from worker order by first_name asc,department desc;
select * from worker where first_name in ('vipul','satish');
select * from worker where first_name not in ('vipul','satish');
select*from worker where department in ('admin');
select * from worker where first_name like'%a%';
select * from worker where first_name like'%a';
select * from worker where first_name like'_____h';
select * from worker where salary between 100000 and 500000;
select * from worker where year(joining_date) =2014 and month(joining_date)=02;
select department ,count(*) from worker where department = 'admin';
select concat(first_name,last_name) from worker where salary between 50000 and 100000;
select department , count(worker_id) from worker group by department
order by count(worker_id) desc;
select*from title where worker_title = 'manager';
select*from worker as w inner join title as t on w.worker_id=t.worker_ref_id where t.worker_title='manager';
select*from worker as w right join title as t on w.worker_id=t.affected_from; 
select worker_title ,count(*)  from title group by worker_title having count(*)>1;
select * from worker where mod ( worker_id ,2) !=0;
select * from worker where mod ( worker_id ,2) =0;
create table worker_clone like worker;
insert into worker_clone select * from worker;
select*from worker_clone;
select curdate();
select now();
select salary from worker order by  salary desc;
select * from worker order by salary desc limit 5;
select * from worker order by salary desc limit 4,1;
select salary from worker w1 
where 4= (
select count(distinct(w2.salary))
from worker w2
where w2.salary >=w1.salary
);
select *from worker w1,worker w2 where w1.salary = w2.salary and w1.worker_id  != w2.worker_id ;
select distinct salary from worker order by salary desc limit 1 offset 1;
select max( salary) from worker
where salary not in (select max(salary) from worker);
select*from worker
union all 
select*from worker order by worker_id;
select* from worker;
select* from title;
select* from bonus;
select* from worker where worker_id not in (select worker_ref_id from bonus); 
select*from worker where worker_id <= (select count(worker_id)/2 from worker);
