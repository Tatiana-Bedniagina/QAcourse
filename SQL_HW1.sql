--1. ������� ��� ���� � ��� ������.
select * from students;
--2. ������� ���� ��������� � �������
select NAME from students; 
--3. ������� ������ Id �������������
select ID from students;
 --4. ������� ������ ��� �������������
select NAME from students;
 --5. ������� ������ email �������������
select EMAIL from students;
 --6. ������� ��� � email �������������
select NAME, EMAIL from STUDENTS;
 --7. ������� id, ���, email � ���� �������� �������������
select ID, NAME, EMAIL, created_on from STUDENTS;
 --8. ������� ������������� ��� password 12333
select ID, NAME from STUDENTS where password = '12333';
 --9. ������� ������������� ������� ���� ������� 2021-03-26 00:00:00
select ID, NAME from STUDENTS where CREATED_ON = '2021-03-26 00:00:00';
 --10. ������� ������������� ��� � ����� ���� ����� ����
select ID, NAME from STUDENTS where NAME = '����';
 --11. ������� ������������� ��� � ����� � ����� ���� 8
select * from students where name like '%8';
 --12. ������� ������������� ��� � ����� � ���� ����� �
select * from students where name like '%a%';
 --13. ������� ������������� ������� ���� ������� 2021-07-12 00:00:00
select * from students where created_on = '2021-07-12 00:00:00';
 --14. ������� ������������� ������� ���� ������� 2021-07-12 00:00:00 � ����� ������ 1m313
select * from students where created_on = '2021-07-12 00:00:00' and password = '1m313';
 --16. ������� ������������� ������� ���� ������� 2021-07-12 00:00:00 � � ������� � ����� ���� ����� 8
select * from students where created_on ='2021-07-12 00:00:00' and name like '%8%';
--15. ������� ������������� ������� ���� ������� 2021-07-12 00:00:00 � � ������� � ����� ���� ����� Andrey
select * from students where created_on  = '2021-07-12 00:00:00' and name like '%Andrey%';
 --17. ������� ������������ � ������� id ����� 10
select * from students where id = 10;
 --18. ������� ������������ � ������� id ����� 53
select * from students where id = 53;
 --19. ������� ������������ � ������� id ������ 40
select * from students where id > 40;
 --20. ������� ������������ � ������� id ������ 30
select * from students where id < 30;
 --21. ������� ������������ � ������� id ������ 27 ��� ������ 88
select * from students where id < 27 or id > 88;
 --22. ������� ������������ � ������� id ������ ���� ����� 37
select * from students where id <=37;
 --23. ������� ������������ � ������� id ������ ���� ����� 37
select * from students where id >=37;
 --24. ������� ������������ � ������� id ������ 80 �� ������ 90
select * from students where id >80 and id<90;
 --25. ������� ������������ � ������� id ����� 80 � 90
select * from students where id >=80 and id<=90;
 --26. ������� ������������� ��� password ����� 12333, 1m313, 123313
select * from students where password in('12333','1m313', '12313');
 --27. ������� ������������� ��� created_on ����� 2020-10-03 00:00:00, 2021-05-19 00:00:00, 2021-03-26 00:00:00
select * from students where created_on in('2020-10-03 00:00:00', '2021-05-19 00:00:00', '2021-03-26 00:00:00');
 --28. ������� ����������� id 
select min(id) from students;
 --29. ������� ������������.
select max(id) from students;
 --30. ������� ���������� �������������
select count(id) from students;
 --31. ������� id ������������, ���, ���� �������� ������������. ������������� �� ������� ����������� ���� ���������� �������������.
select id, name, created_on from students order by created_on asc;
-- 32. ������� id ������������, ���, ���� �������� ������������. ������������� �� ������� �������� ���� ���������� �������������.
select id, name, created_on from students order by created_on desc;