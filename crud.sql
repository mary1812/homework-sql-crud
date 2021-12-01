--Создайте таблицу “workers” (“id”, “birthday”, “name”, “salary”).
CREATE TABLE workers (
id serial PRIMARY KEY,
first_name varchar(64) NOT NULL CHECK(first_name!=''),
birthday date NOT NULL CHECK(birthday < current_date),
salary numeric(4,0) NOT NULL
);


--Задачи на INSERT
--Добавьте нового работника Никиту, 90го года, зарплата 300$.
INSERT INTO workers (first_name, birthday, salary)
VALUES ('Никита', '01.01.1990',  300);
--Добавьте нового работника Светлану с зарплатой 1200$.
INSERT INTO workers VALUES  ('Светлана', '02.02.1998', 1200);
--Добавьте двух новых работников одним запросом: Ярослава с зарплатой 1200$ и годом 80го, Петра с зарплатой 1000$ и 93 года.
INSERT INTO workers(first_name, birthday, salary) VALUES ('Ярослав', '03.03.1980', 1200), ('Петр', '12.12.1993', 1000);


--Задачи на UPDATE
--Поставьте Васе зарплату в 200$.
UPDATE workers SET salary = 200 WHERE first_name = 'Вася';
--Работнику с id=4 поставьте год рождения 87й.
UPDATE workers SET birthday = '03.03.1987' WHERE id = 4;
--Всем, у кого зарплата 500$ сделайте ее 700$.
UPDATE workers SET salary = 700 WHERE salary = 500;
--Работникам с id больше 2 и меньше 5 включительно поставьте год 99.
UPDATE workers SET birthday = '01.01.1999' WHERE id >= 2 AND id<=5;
--Поменяйте Васю на Женю и прибавьте ему зарплату до 900$.
UPDATE workers SET first_name = 'Женя', salary = 900 WHERE first_name = 'Вася';


--Задачи на SELECT
--Выбрать работника с id = 3.
SELECT * FROM workers WHERE id = 3;
--Выбрать работников с зарплатой более 400$.
SELECT * FROM workers WHERE salary > 400;
--Выбрать работников с зарплатой НЕ равной 500$.
SELECT * FROM workers WHERE salary <> 500;
--!!!Узнайте зарплату и возраст Жени.
SELECT salary, age(birthday) FROM workers WHERE first_name = 'Женя';
--Выбрать работников с именем Петя.
SELECT * FROM workers WHERE first_name = 'Петр';
--Выбрать всех, кроме работников с именем Петя.
SELECT * FROM workers WHERE first_name <> 'Петр';
--Выбрать всех работников в возрасте 27 лет или с зарплатой 1000$.
SELECT * FROM workers WHERE age(birthday) > make_interval(27) OR salary = 1000;
--Выбрать работников в возрасте от 25 (не включительно) до 35 лет (включительно).
SELECT * FROM workers WHERE age(birthday) > make_interval(25) AND age(birthday) <= make_interval(35);
--Выбрать всех работников в возрасте от 23 лет до 27 лет или с зарплатой от 400$ до 1000$.
SELECT * FROM workers 
WHERE age(birthday) >= make_interval(23) 
AND age(birthday) <= make_interval(27)
OR salary >= 400 AND salary <= 1000;
--Выбрать всех работников в возрасте 27 лет или с зарплатой не равной 400$.
SELECT * FROM workers
WHERE age(birthday) = make_interval(27) 
OR salary <> 400;


--Задачи на DELETE
--Удалите работника с id=7.
DELETE FROM workers WHERE id = 7;
--Удалите Женю.
DELETE FROM workers WHERE first_name = 'Женя';
--Удалите всех работников, у которых возраст 23 года.
DELETE FROM workers WHERE age(birthday) > make_interval(23);

