--===================================
--Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employees.employee_name, salary.monthly_salary from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id;

--Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employees.employee_name, salary.monthly_salary from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
where monthly_salary<2000;

--Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select id from salary
except
select salary_id from employee_salary;

-- Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.
select id from salary
where monthly_salary <2000
except
select salary_id from employee_salary;

--Найти всех работников кому не начислена ЗП.
select employees.employee_name from employees
except
select employees.employee_name from employees
join employee_salary on employees.id = employee_salary.employee_id;

--Вывести всех работников с названиями их должности.
select employee_name, role_name from roles_employee
left join  employees on employees.id = roles_employee.employee_id
left join roles on roles_employee.role_id = roles.id;

--Вывести имена и должность только Java разработчиков.
select employee_name, role_name from roles_employee
left join  employees on employees.id = roles_employee.employee_id
left join roles on roles_employee.role_id = roles.id
where lower(role_name) like lower('%Java %');

--Вывести имена и должность только Python разработчиков.
select employee_name, role_name from roles_employee
left join  employees on employees.id = roles_employee.employee_id
left join roles on roles_employee.role_id = roles.id
where lower(role_name) like lower('%Python%');

--Вывести имена и должность всех QA инженеров.
select employee_name, role_name from roles_employee
left join  employees on employees.id = roles_employee.employee_id
left join roles on roles_employee.role_id = roles.id
where lower(role_name) like lower('%QA%');

--Вывести имена и должность ручных QA инженеров.
select employee_name, role_name from roles_employee
left join  employees on employees.id = roles_employee.employee_id
left join roles on roles_employee.role_id = roles.id
where lower(role_name) like lower('%Manual%');

--Вывести имена и должность автоматизаторов QA
select employee_name, role_name from roles_employee
left join  employees on employees.id = roles_employee.employee_id
left join roles on roles_employee.role_id = roles.id
where lower(role_name) like lower('%Automation%');

--Вывести имена и зарплаты Junior специалистов

select employee_name, monthly_salary from employee_salary es 
join roles_employee on roles_employee.employee_id = es.employee_id 
left join employees e on es.employee_id = e.id 
join salary s  on s.id = es.salary_id
join roles r on roles_employee.role_id = r.id
where lower(r.role_name) like lower('%Junior%');

--Вывести имена и зарплаты Middle специалистов
select employee_name, monthly_salary from employee_salary es 
join roles_employee on roles_employee.employee_id = es.employee_id 
left join employees e on e.id = es.employee_id 
join salary s  on s.id = es.salary_id
join roles r on roles_employee.role_id = r.id
where lower(r.role_name) like lower('%Middle%');

--Вывести имена и зарплаты Senior специалистов
select employee_name, monthly_salary from employee_salary es 
join roles_employee on roles_employee.employee_id = es.employee_id 
left join employees e on e.id = es.employee_id 
join salary s  on s.id = es.salary_id
join roles r on roles_employee.role_id = r.id
where lower(r.role_name) like lower('%Senior%');

-- Вывести зарплаты Java разработчиков
select monthly_salary from employee_salary es 
left join roles_employee on es.employee_id = roles_employee.employee_id
join salary s  on s.id = es.salary_id
join roles r on roles_employee.role_id = r.id
where lower(r.role_name) like lower('%Java%');

--Вывести зарплаты Python разработчиков
select monthly_salary from employee_salary es 
left join roles_employee on  es.employee_id = roles_employee.employee_id
join salary s  on s.id = es.salary_id
join roles r on roles_employee.role_id = r.id
where lower(r.role_name) like lower('%Python%');

--Вывести имена и зарплаты Junior Python разработчиков
select e.employee_name, s.monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where lower(r.role_name) like lower('%junior python%');

-- Вывести имена и зарплаты Middle JS разработчиков
select e.employee_name, s.monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where lower(r.role_name) like lower('%middle javascript%');

--Вывести имена и зарплаты Senior Java разработчиков
select e.employee_name, s.monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where lower(r.role_name) like lower('%senior java%');

--Вывести зарплаты Junior QA инженеров
select s.monthly_salary from employee_salary es 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where lower(r.role_name) like lower('%junior QA%');

--Вывести среднюю зарплату всех Junior специалистов
select avg(s.monthly_salary) from employee_salary es 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where lower(r.role_name) like lower('%junior%');

--Вывести сумму зарплат JS разработчиков
select sum(s.monthly_salary) from employee_salary es 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where lower(r.role_name) like lower('%javascript%');

--Вывести минимальную ЗП QA инженеров
select min(s.monthly_salary) from employee_salary es 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where lower(r.role_name) like lower('%qa%');
--Вывести максимальную ЗП QA инженеров
select max(s.monthly_salary) from employee_salary es 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where lower(r.role_name) like lower('%qa%');

--Вывести количество QA инженеров
select count(r.role_name) from roles_employee re 
join employee_salary es on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where lower(r.role_name) like lower('%qa%');

--Вывести количество Middle специалистов.
select count(es.id) from employee_salary es 
join roles_employee re on es.employee_id = re.employee_id 
join roles r  on re.role_id = r.id 
where lower(r.role_name) like lower('%middle%');

--Вывести количество разработчиков
select count(es.id) from employee_salary es 
join roles_employee re on es.employee_id = re.employee_id 
join roles r  on re.role_id = r.id 
where lower(r.role_name) like lower('%develop%');

--Вывести фонд (сумму) зарплаты разработчиков.
select sum(s.monthly_salary) from employee_salary es 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where lower(r.role_name) like lower('%develop%');

--Вывести имена, должности и ЗП всех специалистов по возрастанию
select e.employee_name, r.role_name, s.monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
order by monthly_salary;

--Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select e.employee_name, r.role_name, s.monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where monthly_salary between 1700 and 2300
order by monthly_salary;

--Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select e.employee_name, r.role_name, s.monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where monthly_salary <2300
order by monthly_salary;

--Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select e.employee_name, r.role_name, s.monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where monthly_salary in(1100, 1500, 2000)
order by monthly_salary;