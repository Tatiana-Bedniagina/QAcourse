create table employees (
			 id serial not null primary key,
			 employee_name varchar(50) not null);
			 
select * from employees;

insert into employees (employee_name) values ('Tanya');
insert into employees (employee_name) values ('Vladimir'),('Yan');
insert into employees (employee_name) values ('Anna'),('Olga'),('Helen'),('Anatolii'),('Alex'),('Nick'),('Bob'),('July'),('Irina'),('Tatiana'),('Liam'),('Noah'),('Oliver'),('Elijah'),('William'),('James'),('Benjamin'),('Lucas'),('Henry'),('Alexander'),('Mason'),('Michael'),('Ethan'),('Daniel'),('Jacob'),('Logan'),('Jackson'),('Levi'),('Sebastian'),('Mateo'),('Jack'),('Owen'),('Theodore'),('Aiden'),('Samuel'),('Joseph'),('John'),('David'),('Wyatt'),('Matthew'),('Luke'),('Asher'),('Carter'),('Julian'),('Grayson'),('Leo'),('Jayden'),('Gabriel'),('Isaac'),('Lincoln'),('Anthony'),('Hudson'),('Dylan'),('Ezra'),('Thomas'),('Charles'),('Christopher'),('Jaxon'),('Maverick'),('Josiah'),('Isaiah'),('Andrew'),('Elias'),('Joshua'),('Nathan'),('Caleb'),('Ryan'),('Adrian'),('Miles'),('Eli'),('Nolan'),('Christian'),('Aaron');
delete from employees where id > 70; 
--==================================
create table salary (
					id serial not null primary key,
					monthly_salary decimal not null);
					
alter table salary 
alter column monthly_salary set data type int;

select * from salary;

insert into salary (monthly_salary) 
values (1000),(1100),(1200),(1300),(1400),(1500),(1600),(1700),(1800),(1900),(2000),(2100),(2200),(2300),(2400),(2500);

--==================================
create table empoyee_salary (
					id serial not null primary key,
					employee_id int not null unique,
					salary_id int not null);
	
select * from employee_salary;

alter table empoyee_salary rename to employee_salary;

insert into employee_salary (employee_id, salary_id) 
values (24,3),(25,3),(31,5),(32,9);

drop table employee_salary;

--=================================

create table roles (
				id serial primary key,
				role_name int not null unique);
				
alter table roles alter column role_name set data type varchar;

insert into roles (role_name) 
values('Junior Python developer'),('Middle Python developer'),
('Senior Python developer'), ('Junior Java developer'),
('Middle Java developer'), ('Senior Java developer'),
('Junior JavaScript developer'), ('Middle JavaScript developer'),
('Senior JavaScript developer'), ('Junior Manual QA engineer'),
('Middle Manual QA engineer'), ('Senior Manual QA engineer'),
('Project Manager'), ('Designer'),
('HR'), ('CEO'),
('Sales manager'), ('Junior Automation QA engineer'),
('Middle Automation QA engineer'), ('Senior Automation QA engineer');

select * from roles;

--=================================

create  table roles_employee (
			id serial primary key,
			employee_id int not null unique,
			role_id int not null,
			foreign key (employee_id)
			references employees (id),
			foreign key (role_id)
			references roles (id));
			
insert into roles_employee (employee_id, role_id) 
values (43,2),(47,4),(57,9),(56,13),(67,4),(68,2),(69,8),(61,17),(62,4),(63,7);

select * from roles_employee;
