--===================================
--������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.
select employees.employee_name, salary.monthly_salary from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id;

--������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.
select employees.employee_name, salary.monthly_salary from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
where monthly_salary<2000;

--������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select id from salary
except
select salary_id from employee_salary;

-- ������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.
select id from salary
where monthly_salary <2000
except
select salary_id from employee_salary;

--����� ���� ���������� ���� �� ��������� ��.
select employees.employee_name from employees
except
select employees.employee_name from employees
join employee_salary on employees.id = employee_salary.employee_id;

--������� ���� ���������� � ���������� �� ���������.
select employee_name, role_name from roles_employee
left join  employees on employees.id = roles_employee.employee_id
left join roles on roles_employee.role_id = roles.id;

--������� ����� � ��������� ������ Java �������������.
select employee_name, role_name from roles_employee
left join  employees on employees.id = roles_employee.employee_id
left join roles on roles_employee.role_id = roles.id
where lower(role_name) like lower('%Java %');

--������� ����� � ��������� ������ Python �������������.
select employee_name, role_name from roles_employee
left join  employees on employees.id = roles_employee.employee_id
left join roles on roles_employee.role_id = roles.id
where lower(role_name) like lower('%Python%');

--������� ����� � ��������� ���� QA ���������.
select employee_name, role_name from roles_employee
left join  employees on employees.id = roles_employee.employee_id
left join roles on roles_employee.role_id = roles.id
where lower(role_name) like lower('%QA%');

--������� ����� � ��������� ������ QA ���������.
select employee_name, role_name from roles_employee
left join  employees on employees.id = roles_employee.employee_id
left join roles on roles_employee.role_id = roles.id
where lower(role_name) like lower('%Manual%');

--������� ����� � ��������� ��������������� QA
select employee_name, role_name from roles_employee
left join  employees on employees.id = roles_employee.employee_id
left join roles on roles_employee.role_id = roles.id
where lower(role_name) like lower('%Automation%');

--������� ����� � �������� Junior ������������

select employee_name, monthly_salary from employee_salary es 
join roles_employee on roles_employee.employee_id = es.employee_id 
left join employees e on es.employee_id = e.id 
join salary s  on s.id = es.salary_id
join roles r on roles_employee.role_id = r.id
where lower(r.role_name) like lower('%Junior%');

--������� ����� � �������� Middle ������������
select employee_name, monthly_salary from employee_salary es 
join roles_employee on roles_employee.employee_id = es.employee_id 
left join employees e on e.id = es.employee_id 
join salary s  on s.id = es.salary_id
join roles r on roles_employee.role_id = r.id
where lower(r.role_name) like lower('%Middle%');

--������� ����� � �������� Senior ������������
select employee_name, monthly_salary from employee_salary es 
join roles_employee on roles_employee.employee_id = es.employee_id 
left join employees e on e.id = es.employee_id 
join salary s  on s.id = es.salary_id
join roles r on roles_employee.role_id = r.id
where lower(r.role_name) like lower('%Senior%');

-- ������� �������� Java �������������
select monthly_salary from employee_salary es 
left join roles_employee on es.employee_id = roles_employee.employee_id
join salary s  on s.id = es.salary_id
join roles r on roles_employee.role_id = r.id
where lower(r.role_name) like lower('%Java%');

--������� �������� Python �������������
select monthly_salary from employee_salary es 
left join roles_employee on  es.employee_id = roles_employee.employee_id
join salary s  on s.id = es.salary_id
join roles r on roles_employee.role_id = r.id
where lower(r.role_name) like lower('%Python%');

--������� ����� � �������� Junior Python �������������
select e.employee_name, s.monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where lower(r.role_name) like lower('%junior python%');

-- ������� ����� � �������� Middle JS �������������
select e.employee_name, s.monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where lower(r.role_name) like lower('%middle javascript%');

--������� ����� � �������� Senior Java �������������
select e.employee_name, s.monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where lower(r.role_name) like lower('%senior java%');

--������� �������� Junior QA ���������
select s.monthly_salary from employee_salary es 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where lower(r.role_name) like lower('%junior QA%');

--������� ������� �������� ���� Junior ������������
select avg(s.monthly_salary) from employee_salary es 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where lower(r.role_name) like lower('%junior%');

--������� ����� ������� JS �������������
select sum(s.monthly_salary) from employee_salary es 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where lower(r.role_name) like lower('%javascript%');

--������� ����������� �� QA ���������
select min(s.monthly_salary) from employee_salary es 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where lower(r.role_name) like lower('%qa%');
--������� ������������ �� QA ���������
select max(s.monthly_salary) from employee_salary es 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where lower(r.role_name) like lower('%qa%');

--������� ���������� QA ���������
select count(r.role_name) from roles_employee re 
join employee_salary es on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where lower(r.role_name) like lower('%qa%');

--������� ���������� Middle ������������.
select count(es.id) from employee_salary es 
join roles_employee re on es.employee_id = re.employee_id 
join roles r  on re.role_id = r.id 
where lower(r.role_name) like lower('%middle%');

--������� ���������� �������������
select count(es.id) from employee_salary es 
join roles_employee re on es.employee_id = re.employee_id 
join roles r  on re.role_id = r.id 
where lower(r.role_name) like lower('%develop%');

--������� ���� (�����) �������� �������������.
select sum(s.monthly_salary) from employee_salary es 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where lower(r.role_name) like lower('%develop%');

--������� �����, ��������� � �� ���� ������������ �� �����������
select e.employee_name, r.role_name, s.monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
order by monthly_salary;

--������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300
select e.employee_name, r.role_name, s.monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where monthly_salary between 1700 and 2300
order by monthly_salary;

--������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300
select e.employee_name, r.role_name, s.monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where monthly_salary <2300
order by monthly_salary;

--������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000
select e.employee_name, r.role_name, s.monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
join roles_employee re on es.employee_id = re.employee_id 
join roles r on r.id = re.role_id 
where monthly_salary in(1100, 1500, 2000)
order by monthly_salary;