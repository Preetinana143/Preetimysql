use mydb;

-- UPDATE and DELETE

SELECT * FROM CUSTOMER;


SET sql_safe_updates=0;

UPDATE customer SET city='Hyderabad' WHERE custid=1000;

UPDATE customer SET age=41 , city='Chennai' WHERE custid=1001;

UPDATE customer SET age=100 WHERE city='Chennai';
UPDATE customer SET age=200 WHERE city='Delhi';

UPDATE CUSTOMER SET AGE=111 WHERE age is NULL;

UPDATE customer SET city='Pune' WHERE age>100;

DELETE FROM customer WHERE age < 100;

DELETE FROM CUSTOMER WHERE custid IN (1005,1006);

DELETE FROM CUSTOMER WHERE custid BETWEEN 1003 and 1007;

CREATE TABLE unique_table(
id INT UNIQUE,
name varchar(100) ,
gender CHAR(1),
age int,
city VARCHAR(100) 
);

INSERT INTO unique_table VALUES(1000,'Ramkumar','M',25,'Pune'),(1001,'Pankaj','M',27,'Mumbai'),(1002,'Kirthi','F',30,'Kolkatta');

SELECT * FROM unique_table;

INSERT INTO unique_table VALUES(1003,'Priya','F',23,'Delhi');
INSERT INTO unique_table VALUES(1004,'Priya','F',23,'Delhi');
-------------------------------------------------------------------------
Not null
CREATE TABLE notnull_table(
id INT UNIQUE,
name varchar(100) NOT NULL,
gender CHAR(1),
age int,
city VARCHAR(100) NOT NULL
);

INSERT INTO notnull_table VALUES(1000,'Abhishek','M',30,'Delhi');

SELECT * FROM notnull_table;

INSERT INTO notnull_table(id,name,gender,city) VALUES(1002,'neha','F','Pune');

INSERT INTO notnull_table(id,name,gender,city) VALUES(1003,'Preeti','F','Pune');

INSERT INTO notnull_table VALUES(1004,'Nana','M',30,'Delhi');

CREATE TABLE default_table(
id INT UNIQUE,
name varchar(100) NOT NULL,
gender CHAR(1),
age int,
city VARCHAR(100) DEFAULT 'PUNE'
);


INSERT INTO default_table VALUES(1000,'Prithvi','M',27,'Hyderabad');

INSERT INTO default_table(id,name,gender,age) VALUES(1002,'Rashmi','F',25);

SELECT * FROM default_table;

----------------------------------------------------------------------------------------------
CREATE TABLE check_table(
id INT UNIQUE,
name varchar(100) NOT NULL,
gender CHAR(1),
age int CHECK (age between 0 and 100),
city VARCHAR(100) DEFAULT 'PUNE'
);


INSERT INTO check_table VALUES(1000,'Saraswathi','F',35,'Chennai');

SELECT * FROM check_table;

INSERT INTO check_table VALUES(1001,'Sindhya','F',100,'Bangalore');


CREATE TABLE check_table2(
id INT UNIQUE,
name varchar(100) NOT NULL,
gender CHAR(1),
age int CHECK (age between 0 and 100),
city VARCHAR(100) DEFAULT 'PUNE',
country VARCHAR(100) CHECK (country IN ('INDIA','SINGAPORE','CANADA'))
);

INSERT INTO check_table2 VALUES(1000,'Jayasudha','F',25,'pune','INDIA');

SELECT * FROM check_table2;
