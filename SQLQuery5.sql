create table Worker(
WORKER_ID int primary key identity(001,1),
FIRST_NAME varchar(25),
LAST_NAME varchar(30),
SALARY decimal,
JOINING_DATE datetime,
DEPARTMENT varchar(25)
)
select * from worker
create table Bonus(
WORKER_REF_ID int identity(001,1),
BONUS_AMOUNT int,
BONUS_DATE datetime,
foreign key (WORKER_REF_ID ) references Worker (WORKER_ID)

)
SELECT * FROM BONUS
CREATE TABLE TITLE(
WORKER_REF_ID int,
WORKER_TITLE char(25),
AFFECTED_FROM datetime,
foreign key (WORKER_REF_ID )references Worker(WORKER_ID)
)
insert into Worker values
         ( 'Monika', 'Arora', 100000,'2022-02-20 10:00:00 AM', 'HR'),
		( 'Niharika', 'Verma', 80000, '2022-06-11 10:00:00 AM', 'Admin'),
		('Vishal', 'Singhal', 300000, '2022-02-20 10:00:00 AM', 'HR'),
		( 'Amitabh', 'Singh', 500000, '2021-02-20 10:00:00 AM', 'Admin'),
		( 'Vivek', 'Bhati', 500000, '2022-06-11 10:00:00 AM', 'Admin'),
		( 'Vipul', 'Diwan', 200000, '2022-06-11 10:00:00 AM', 'Account'),
		( 'Satish', 'Kumar', 75000, '2022-01-20 10:00:00 AM', 'Account'),
		
		( 'Geetika', 'Chauhan', 90000, '2022-04-11 11:00:00 AM', 'Admin');
	insert into bonus values (
	8, 5000, '2022-02-20 10:00:00 AM'),
		(9, 3000, '2022-06-11 10:00:00 AM'),
		(10, 4000, '2022-02-20 10:00:00 AM'),
		(8, 4500, '2022-02-20 10:00:00 AM'),
		(9, 3500, '2022-06-11 10:00:00 AM');	
		insert into title values
		(8, 'Manager', '2016-02-20 00:00:00'),
 (9, 'Executive', '2016-06-11 00:00:00'),
 (15, 'Executive', '2016-06-11 00:00:00'),
 (12, 'Manager', '2016-06-11 00:00:00'),
 (11, 'Asst. Manager', '2016-06-11 00:00:00'),
 (14, 'Executive', '2016-06-11 00:00:00'),
 (13, 'Lead', '2016-06-11 00:00:00'),
 (10, 'Lead', '2016-06-11 00:00:00');
 select * from worker
  select * from bonus
   select * from title
   --Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
   select FIRST_NAME as WORKER_NAME from Worker
   --Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
   select upper(FIRST_NAME) from Worker 
   -- Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
   select distinct department from worker
   --Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
   select substring(first_name,1,3) from worker
   --Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
select CHARINDEX('a','Amitabh') as position from worker WHERE FIRST_NAME='Amitabh'
--Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
Select RTRIM(FIRST_NAME) from Worker
--Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
select ltrim(DEPARTMENT) from worker
--Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
Select distinct len(DEPARTMENT) from Worker
--Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
select replace(first_name,'a','A')from worker
--Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
select concat(first_name,' ',last_name)as fullname from worker
--Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from worker order by first_name
--Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from worker order by first_name asc , department desc
--Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select * from worker where first_name='vipul' or first_name='satish'
--Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select * from worker where first_name not like'vipul' or first_name not like'satish'
--Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select * from worker where department like'admin'
--Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from worker where first_name like '%a%'
--Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from worker where first_name like'%a'
--Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from Worker where first_name like'_____h'
--Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from worker where salary between 100000 and 500000
--Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
select * from worker where year( JOINING_DATE )=2022 and month(joining_date)=2
--Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(*) from worker where DEPARTMENT  like'admin'
--Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select concat(first_name,' ',last_name) as workernames,salary from worker where  worker_id in(select worker_id from worker where salary between 50000 and 100000)
--Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
select department, count(*)no_of_worker from worker group by department order by no_of_worker desc
--Q-24. Write an SQL query to print details of the Workers who are also Managers.
select w.DEPARTMENT,w.LAST_NAME,w.SALARY,t.worker_title  from worker w
inner join TITLE t on t.WORKER_REF_ID=w.WORKER_ID where worker_title like 'manager'
--Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
select salary ,count(*)  from worker group by SALARY,DEPARTMENT having count(*) >1
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1
--Q-26. Write an SQL query to show only odd rows from a table.
select * from worker where WORKER_ID % 2 <>0
--Q-27. Write an SQL query to show only even rows from a table.
select * from worker where WORKER_ID % 2=0
--Q-28. Write an SQL query to clone a new table from another table.
select * into workerdet from worker
--Write an SQL query to fetch intersecting records of two tables.
delete from workerdet where WORKER_ID in (8,15)
select * from worker intersect select * from workerdet
--Q-30. Write an SQL query to show records from one table that another table does not have.
select * from worker except select * from workerdet
-- Write an SQL query to show the current date and time.
select getdate()
--Write an SQL query to show the top n (say 10) records of a table.
select top 10 * from  worker order by salary desc
--Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select max(salary) from worker where salary < (select max(salary) from worker where salary <(select max(salary) from worker where salary < (select max( salary) from worker where salary <(select max(salary) from worker ))))
--Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.
select max(salary) from worker where salary < (select max(salary) from worker where salary <(select max(salary) from worker where salary < (select max( salary) from worker where salary <(select max(salary) from worker ))))
--Write an SQL query to fetch the list of employees with the same salary
select * from worker w ,worker w1
where w.SALARY=w1.SALARY
and w.WORKER_ID<>w1.WORKER_ID
--Q-36. Write an SQL query to show the second highest salary from a table.
select max(salary) from worker where salary <(select max(salary) from worker)
--Q-37. Write an SQL query to show one row twice in results from a table.
select first_name,last_name ,count (*) as noofrow from worker group by FIRST_NAME,LAST_NAME having count(*) >1
--Q-38. Write an SQL query to fetch intersecting records of two tables.
select * from worker 
intersect select * from workerdet
--Q-39. Write an SQL query to fetch the first 50% records from a table.
select * from worker where WORKER_ID>=(select count(WORKER_ID)/2from worker)
--Q-40. Write an SQL query to fetch the departments that have less than five people in it.
select DEPARTMENT,count(*) from worker group by DEPARTMENT having count(*) <5
--Q-41. Write an SQL query to show all departments along with the number of people in there.
select department, count(*) as no_of_workers from worker group by DEPARTMENT
--Q-42. Write an SQL query to show the last record from a table.
select * from worker where WORKER_ID=(select max(WORKER_ID) from worker)
--Q-43. Write an SQL query to fetch the first row of a table
select * from worker where WORKER_ID=(select min(WORKER_ID) from worker)
--Q-44. Write an SQL query to fetch the last five records from a table.
select top 5 * from worker order by worker_id desc
--Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
select concat(e.first_name,e.last_name)as fullname,e.department,e.salary from worker e where salary in(select max(salary) from worker group by department)
--Q-46. Write an SQL query to fetch three max salaries from a table.
select top 3 *from worker order by salary desc
--Q-47. Write an SQL query to fetch three min salaries from a table.
select top 3 *from worker order by salary
--Q-48. Write an SQL query to fetch nth max salaries from a table.
SELECT distinct Salary from worker a WHERE 4 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc;
select top 4 * from worker order by salary desc
--Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
select department ,sum(salary) from worker group by DEPARTMENT
--Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
select FIRST_NAME,last_name,salary from worker where salary  in (select max(salary) from worker)
select * from worker
select * from title
